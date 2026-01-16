using MH.Domain.DBModel;
using MH.Domain.Model;

namespace MH.Domain.IRepository
{
    /// <summary>
    /// Repository interface for Credit Note operations
    /// </summary>
    public interface ICreditNoteRepository : IRepository<CreditNote, int>
    {
        /// <summary>
        /// Get credit note by its unique credit note number
        /// </summary>
        Task<CreditNote?> GetByCreditNoteNumber(string creditNoteNumber);

        /// <summary>
        /// Get all credit notes for a specific invoice/sale
        /// </summary>
        Task<IReadOnlyList<CreditNote>> GetByInvoiceId(int invoiceId);

        /// <summary>
        /// Get all credit notes by status
        /// </summary>
        Task<IReadOnlyList<CreditNote>> GetByStatus(string status);

        /// <summary>
        /// Get all credit notes by customer ID
        /// </summary>
        Task<IReadOnlyList<CreditNote>> GetByCustomerId(int customerId);

        /// <summary>
        /// Get credit notes with filters
        /// </summary>
        Task<IReadOnlyList<CreditNote>> GetFiltered(CreditNoteFilterDto filter);

        /// <summary>
        /// Check if a credit note number already exists
        /// </summary>
        Task<bool> IsCreditNoteNumberExists(string creditNoteNumber);

        /// <summary>
        /// Get credit notes by date range
        /// </summary>
        Task<IReadOnlyList<CreditNote>> GetByDateRange(DateTime startDate, DateTime endDate);

        /// <summary>
        /// Get pending credit notes count
        /// </summary>
        Task<int> GetPendingCount();

        /// <summary>
        /// Get total credit amount for a specific invoice
        /// </summary>
        Task<decimal> GetTotalCreditAmountForInvoice(int invoiceId);
    }
}
