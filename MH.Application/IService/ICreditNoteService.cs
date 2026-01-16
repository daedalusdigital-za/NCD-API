using Microsoft.AspNetCore.Http;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MH.Application.IService
{
    /// <summary>
    /// Service interface for Credit Note business logic
    /// </summary>
    public interface ICreditNoteService
    {
        /// <summary>
        /// Create a new credit note
        /// </summary>
        Task<CreditNoteViewModel> CreateCreditNote(CreateCreditNoteDto dto);

        /// <summary>
        /// Update an existing credit note
        /// </summary>
        Task<CreditNoteViewModel> UpdateCreditNote(int id, UpdateCreditNoteDto dto);

        /// <summary>
        /// Delete a credit note (only if status is pending)
        /// </summary>
        Task DeleteCreditNote(int id);

        /// <summary>
        /// Get credit note by ID
        /// </summary>
        Task<CreditNoteViewModel?> GetById(int id);

        /// <summary>
        /// Get all credit notes with optional filtering
        /// </summary>
        Task<List<CreditNoteViewModel>> GetAll(CreditNoteFilterDto? filter = null);

        /// <summary>
        /// Get credit notes by invoice ID
        /// </summary>
        Task<List<CreditNoteViewModel>> GetByInvoiceId(int invoiceId);

        /// <summary>
        /// Approve a credit note and execute reversals
        /// </summary>
        Task ApproveCreditNote(int id, string approvedBy);

        /// <summary>
        /// Reject a credit note
        /// </summary>
        Task RejectCreditNote(int id, string reason);

        /// <summary>
        /// Upload a document for a credit note
        /// </summary>
        Task<DocumentUploadResult> UploadDocument(int id, IFormFile file);

        /// <summary>
        /// Get document file path for download
        /// </summary>
        Task<string> GetDocumentPath(int id);

        /// <summary>
        /// Generate a unique credit note number
        /// </summary>
        Task<string> GenerateCreditNoteNumber();

        /// <summary>
        /// Reverse stock for a credit note (increase inventory)
        /// </summary>
        Task ReverseStock(int creditNoteId);

        /// <summary>
        /// Reverse sale for a credit note (update sale status)
        /// </summary>
        Task ReverseSale(int creditNoteId);
    }
}
