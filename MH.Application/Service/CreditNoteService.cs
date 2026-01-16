using AutoMapper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IEntity;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.Service
{
    public class CreditNoteService : ICreditNoteService
    {
        private readonly ICreditNoteRepository _creditNoteRepository;
        private readonly ISaleRepository _saleRepository;
        private readonly IInventoryItemRepository _inventoryRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUser _currentUser;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public CreditNoteService(
            ICreditNoteRepository creditNoteRepository,
            ISaleRepository saleRepository,
            IInventoryItemRepository inventoryRepository,
            IMapper mapper,
            ICurrentUser currentUser,
            IWebHostEnvironment webHostEnvironment)
        {
            _creditNoteRepository = creditNoteRepository;
            _saleRepository = saleRepository;
            _inventoryRepository = inventoryRepository;
            _mapper = mapper;
            _currentUser = currentUser;
            _webHostEnvironment = webHostEnvironment;
        }

        public async Task<CreditNoteViewModel> CreateCreditNote(CreateCreditNoteDto dto)
        {
            // Fetch the invoice/sale
            var sale = await _saleRepository.FindBy(
                x => x.Id == dto.InvoiceId,
                x => x.SaleItems);

            if (sale == null)
                throw new ArgumentException("Invoice not found");

            // Validate credit amount
            if (dto.CreditAmount > sale.Total)
                throw new ArgumentException("Credit amount cannot exceed original amount");

            // Check total credited amount doesn't exceed original
            var existingCreditTotal = await _creditNoteRepository.GetTotalCreditAmountForInvoice(dto.InvoiceId);
            if (existingCreditTotal + dto.CreditAmount > sale.Total)
                throw new ArgumentException($"Total credit amount (${existingCreditTotal + dto.CreditAmount}) would exceed original sale amount (${sale.Total})");

            // Create credit note
            var creditNote = new CreditNote
            {
                CreditNoteNumber = await GenerateCreditNoteNumber(),
                InvoiceId = dto.InvoiceId,
                InvoiceNumber = sale.SaleNumber,
                CustomerId = null, // Sale doesn't have CustomerId
                CustomerName = sale.CustomerName,
                OriginalAmount = sale.Total,
                CreditAmount = dto.CreditAmount,
                Reason = dto.Reason,
                Notes = dto.Notes,
                ReverseStock = dto.ReverseStock,
                ReverseSale = dto.ReverseSale,
                Status = "pending",
                CreatedBy = _currentUser.User.Id,
                DateCreated = DateTime.UtcNow
            };

            await _creditNoteRepository.Insert(creditNote);

            return _mapper.Map<CreditNoteViewModel>(creditNote);
        }

        public async Task<CreditNoteViewModel> UpdateCreditNote(int id, UpdateCreditNoteDto dto)
        {
            var creditNote = await _creditNoteRepository.GetById(id);
            if (creditNote == null)
                throw new ArgumentException("Credit note not found");

            // Prevent updates to completed/rejected credit notes
            if (creditNote.Status == "completed")
                throw new InvalidOperationException("Cannot update a completed credit note");

            // Update fields if provided
            if (dto.CreditAmount.HasValue)
            {
                // Validate new credit amount
                var sale = await _saleRepository.GetById(creditNote.InvoiceId);
                if (sale != null && dto.CreditAmount.Value > sale.Total)
                    throw new ArgumentException("Credit amount cannot exceed original amount");

                creditNote.CreditAmount = dto.CreditAmount.Value;
            }

            if (!string.IsNullOrEmpty(dto.Reason))
                creditNote.Reason = dto.Reason;

            if (dto.Notes != null)
                creditNote.Notes = dto.Notes;

            if (dto.ReverseStock.HasValue)
                creditNote.ReverseStock = dto.ReverseStock.Value;

            if (dto.ReverseSale.HasValue)
                creditNote.ReverseSale = dto.ReverseSale.Value;

            // Handle status change
            if (!string.IsNullOrEmpty(dto.Status))
            {
                await ValidateStatusTransition(creditNote.Status, dto.Status);
                
                if (dto.Status == "approved")
                {
                    creditNote.Status = "approved";
                    creditNote.ApprovedDate = DateTime.UtcNow;
                    creditNote.ApprovedBy = dto.ApprovedBy ?? _currentUser.User.Email;

                    // Execute reversals
                    if (creditNote.ReverseStock)
                        await ReverseStock(creditNote.Id);
                    
                    if (creditNote.ReverseSale)
                        await ReverseSale(creditNote.Id);
                }
                else
                {
                    creditNote.Status = dto.Status;
                }
            }

            creditNote.UpdatedBy = _currentUser.User.Id;
            creditNote.LastUpdated = DateTime.UtcNow;

            await _creditNoteRepository.Update(creditNote);

            return _mapper.Map<CreditNoteViewModel>(creditNote);
        }

        public async Task DeleteCreditNote(int id)
        {
            var creditNote = await _creditNoteRepository.GetById(id);
            if (creditNote == null)
                throw new ArgumentException("Credit note not found");

            // Only allow deletion of pending credit notes
            if (creditNote.Status != "pending")
                throw new InvalidOperationException("Only pending credit notes can be deleted");

            creditNote.IsDeleted = true;
            creditNote.UpdatedBy = _currentUser.User.Id;
            creditNote.LastUpdated = DateTime.UtcNow;

            await _creditNoteRepository.Update(creditNote);
        }

        public async Task<CreditNoteViewModel?> GetById(int id)
        {
            var creditNote = await _creditNoteRepository.FindBy(
                x => x.Id == id && !x.IsDeleted,
                x => x.Invoice);

            return _mapper.Map<CreditNoteViewModel>(creditNote);
        }

        public async Task<List<CreditNoteViewModel>> GetAll(CreditNoteFilterDto? filter = null)
        {
            IReadOnlyList<CreditNote> creditNotes;

            if (filter != null)
            {
                creditNotes = await _creditNoteRepository.GetFiltered(filter);
            }
            else
            {
                var allNotes = await _creditNoteRepository.GetAll();
                creditNotes = allNotes.Where(x => !x.IsDeleted).ToList();
            }

            return _mapper.Map<List<CreditNoteViewModel>>(creditNotes);
        }

        public async Task<List<CreditNoteViewModel>> GetByInvoiceId(int invoiceId)
        {
            var creditNotes = await _creditNoteRepository.GetByInvoiceId(invoiceId);
            return _mapper.Map<List<CreditNoteViewModel>>(creditNotes);
        }

        public async Task ApproveCreditNote(int id, string approvedBy)
        {
            var creditNote = await _creditNoteRepository.FindBy(
                x => x.Id == id && !x.IsDeleted,
                x => x.Invoice,
                x => x.Invoice.SaleItems);

            if (creditNote == null)
                throw new ArgumentException("Credit note not found");

            if (creditNote.Status != "pending")
                throw new InvalidOperationException("Only pending credit notes can be approved");

            creditNote.Status = "approved";
            creditNote.ApprovedDate = DateTime.UtcNow;
            creditNote.ApprovedBy = approvedBy;
            creditNote.UpdatedBy = _currentUser.User.Id;
            creditNote.LastUpdated = DateTime.UtcNow;

            await _creditNoteRepository.Update(creditNote);

            // Execute reversals
            if (creditNote.ReverseStock)
                await ReverseStock(id);

            if (creditNote.ReverseSale)
                await ReverseSale(id);
        }

        public async Task RejectCreditNote(int id, string reason)
        {
            var creditNote = await _creditNoteRepository.GetById(id);
            if (creditNote == null)
                throw new ArgumentException("Credit note not found");

            if (creditNote.Status != "pending")
                throw new InvalidOperationException("Only pending credit notes can be rejected");

            creditNote.Status = "rejected";
            creditNote.Notes = $"{creditNote.Notes}\n\nRejection Reason: {reason}";
            creditNote.UpdatedBy = _currentUser.User.Id;
            creditNote.LastUpdated = DateTime.UtcNow;

            await _creditNoteRepository.Update(creditNote);
        }

        public async Task<DocumentUploadResult> UploadDocument(int id, IFormFile file)
        {
            // Validate file
            if (file.Length > 5 * 1024 * 1024) // 5MB
                throw new ArgumentException("File size exceeds 5MB");

            if (file.ContentType != "application/pdf")
                throw new ArgumentException("Only PDF files are allowed");

            var creditNote = await _creditNoteRepository.GetById(id);
            if (creditNote == null)
                throw new ArgumentException("Credit note not found");

            // Generate file path
            var fileName = $"{creditNote.CreditNoteNumber}.pdf";
            var relativePath = Path.Combine("uploads", "credit-notes");
            var fullDirectory = Path.Combine(_webHostEnvironment.WebRootPath ?? _webHostEnvironment.ContentRootPath, relativePath);
            
            // Create directory if it doesn't exist
            Directory.CreateDirectory(fullDirectory);

            var fullPath = Path.Combine(fullDirectory, fileName);

            // Save file
            using (var stream = new FileStream(fullPath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            // Update database
            creditNote.DocumentFileName = fileName;
            creditNote.DocumentFileUrl = $"/{relativePath.Replace("\\", "/")}/{fileName}";
            creditNote.DocumentUploadedDate = DateTime.UtcNow;
            creditNote.UpdatedBy = _currentUser.User.Id;
            creditNote.LastUpdated = DateTime.UtcNow;

            await _creditNoteRepository.Update(creditNote);

            return new DocumentUploadResult
            {
                FileName = fileName,
                FileUrl = creditNote.DocumentFileUrl,
                UploadedDate = creditNote.DocumentUploadedDate.Value
            };
        }

        public async Task<string> GetDocumentPath(int id)
        {
            var creditNote = await _creditNoteRepository.GetById(id);
            if (creditNote == null)
                throw new ArgumentException("Credit note not found");

            if (string.IsNullOrEmpty(creditNote.DocumentFileName))
                throw new ArgumentException("No document found for this credit note");

            var relativePath = Path.Combine("uploads", "credit-notes", creditNote.DocumentFileName);
            var fullPath = Path.Combine(_webHostEnvironment.WebRootPath ?? _webHostEnvironment.ContentRootPath, relativePath);

            if (!File.Exists(fullPath))
                throw new FileNotFoundException("Document file not found");

            return fullPath;
        }

        public async Task<string> GenerateCreditNoteNumber()
        {
            var year = DateTime.UtcNow.Year;
            var prefix = $"CN-{year}-";

            // Get all credit notes for this year ordered by ID descending
            var allCreditNotes = await _creditNoteRepository.GetAll();
            var lastCreditNote = allCreditNotes
                .Where(x => x.CreditNoteNumber.StartsWith(prefix))
                .OrderByDescending(x => x.Id)
                .FirstOrDefault();

            int nextNumber = 1;
            if (lastCreditNote != null)
            {
                var parts = lastCreditNote.CreditNoteNumber.Split('-');
                if (parts.Length == 3 && int.TryParse(parts[2], out int lastNumber))
                {
                    nextNumber = lastNumber + 1;
                }
            }

            return $"CN-{year}-{nextNumber:D3}";
        }

        public async Task ReverseStock(int creditNoteId)
        {
            var creditNote = await _creditNoteRepository.FindBy(
                x => x.Id == creditNoteId,
                x => x.Invoice,
                x => x.Invoice.SaleItems);

            if (creditNote == null || creditNote.Invoice == null)
                return;

            if (!creditNote.ReverseStock || creditNote.Status != "approved")
                return;

            // Reverse stock for each sale item
            foreach (var saleItem in creditNote.Invoice.SaleItems.Where(x => !x.IsDeleted))
            {
                var inventoryItem = await _inventoryRepository.GetById(saleItem.InventoryItemId);
                if (inventoryItem != null)
                {
                    inventoryItem.StockAvailable += saleItem.Quantity;
                    inventoryItem.LastUpdated = DateTime.UtcNow;
                    inventoryItem.UpdatedBy = _currentUser.User.Id;

                    await _inventoryRepository.Update(inventoryItem);
                }
            }
        }

        public async Task ReverseSale(int creditNoteId)
        {
            var creditNote = await _creditNoteRepository.FindBy(
                x => x.Id == creditNoteId,
                x => x.Invoice);

            if (creditNote == null || creditNote.Invoice == null)
                return;

            if (!creditNote.ReverseSale || creditNote.Status != "approved")
                return;

            var sale = creditNote.Invoice;
            sale.HasCreditNote = true;
            
            // Calculate total credited amount for this sale
            var totalCredited = await _creditNoteRepository.GetTotalCreditAmountForInvoice(sale.Id);
            sale.CreditedAmount = totalCredited;

            await _saleRepository.Update(sale);
        }

        private async Task ValidateStatusTransition(string currentStatus, string newStatus)
        {
            var validTransitions = new Dictionary<string, List<string>>
            {
                { "pending", new List<string> { "approved", "rejected" } },
                { "approved", new List<string> { "completed" } },
                { "rejected", new List<string>() }, // No transitions from rejected
                { "completed", new List<string>() } // No transitions from completed
            };

            if (!validTransitions.ContainsKey(currentStatus))
                throw new InvalidOperationException($"Unknown status: {currentStatus}");

            if (!validTransitions[currentStatus].Contains(newStatus))
                throw new InvalidOperationException($"Cannot transition from {currentStatus} to {newStatus}");

            await Task.CompletedTask;
        }
    }
}
