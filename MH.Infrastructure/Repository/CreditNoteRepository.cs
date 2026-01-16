using Microsoft.EntityFrameworkCore;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Infrastructure.DBContext;
using System.Linq;

namespace MH.Infrastructure.Repository
{
    public class CreditNoteRepository : Repository<CreditNote, int>, ICreditNoteRepository
    {
        private new readonly ApplicationDbContext _context;

        public CreditNoteRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<CreditNote?> GetByCreditNoteNumber(string creditNoteNumber)
        {
            return await _context.CreditNotes
                .Include(x => x.Invoice)
                    .ThenInclude(x => x != null ? x.SaleItems : null)
                .FirstOrDefaultAsync(x => x.CreditNoteNumber == creditNoteNumber && !x.IsDeleted);
        }

        public async Task<IReadOnlyList<CreditNote>> GetByInvoiceId(int invoiceId)
        {
            return await _context.CreditNotes
                .Include(x => x.Invoice)
                .Where(x => x.InvoiceId == invoiceId && !x.IsDeleted)
                .OrderByDescending(x => x.DateCreated)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<CreditNote>> GetByStatus(string status)
        {
            return await _context.CreditNotes
                .Include(x => x.Invoice)
                .Where(x => x.Status == status && !x.IsDeleted)
                .OrderByDescending(x => x.DateCreated)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<CreditNote>> GetByCustomerId(int customerId)
        {
            return await _context.CreditNotes
                .Include(x => x.Invoice)
                .Where(x => x.CustomerId == customerId && !x.IsDeleted)
                .OrderByDescending(x => x.DateCreated)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<CreditNote>> GetFiltered(CreditNoteFilterDto filter)
        {
            var query = _context.CreditNotes
                .Include(x => x.Invoice)
                .Where(x => !x.IsDeleted)
                .AsQueryable();

            if (!string.IsNullOrEmpty(filter.Status))
            {
                query = query.Where(x => x.Status == filter.Status);
            }

            if (filter.CustomerId.HasValue)
            {
                query = query.Where(x => x.CustomerId == filter.CustomerId.Value);
            }

            if (filter.InvoiceId.HasValue)
            {
                query = query.Where(x => x.InvoiceId == filter.InvoiceId.Value);
            }

            if (filter.DateFrom.HasValue)
            {
                query = query.Where(x => x.DateCreated >= filter.DateFrom.Value);
            }

            if (filter.DateTo.HasValue)
            {
                query = query.Where(x => x.DateCreated <= filter.DateTo.Value);
            }

            if (!string.IsNullOrEmpty(filter.Search))
            {
                var searchLower = filter.Search.ToLower();
                query = query.Where(x => 
                    x.CreditNoteNumber.ToLower().Contains(searchLower, StringComparison.Ordinal) ||
                    x.CustomerName.ToLower().Contains(searchLower, StringComparison.Ordinal) ||
                    x.InvoiceNumber.ToLower().Contains(searchLower, StringComparison.Ordinal));
            }

            return await query
                .OrderByDescending(x => x.DateCreated)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<bool> IsCreditNoteNumberExists(string creditNoteNumber)
        {
            return await _context.CreditNotes
                .AnyAsync(x => x.CreditNoteNumber == creditNoteNumber);
        }

        public async Task<IReadOnlyList<CreditNote>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            return await _context.CreditNotes
                .Include(x => x.Invoice)
                .Where(x => x.DateCreated >= startDate && x.DateCreated <= endDate && !x.IsDeleted)
                .OrderByDescending(x => x.DateCreated)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<int> GetPendingCount()
        {
            return await _context.CreditNotes
                .CountAsync(x => x.Status == "pending" && !x.IsDeleted);
        }

        public async Task<decimal> GetTotalCreditAmountForInvoice(int invoiceId)
        {
            return await _context.CreditNotes
                .Where(x => x.InvoiceId == invoiceId && 
                           (x.Status == "approved" || x.Status == "completed") && 
                           !x.IsDeleted)
                .SumAsync(x => x.CreditAmount);
        }
    }
}
