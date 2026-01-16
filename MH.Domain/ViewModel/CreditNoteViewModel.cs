namespace MH.Domain.ViewModel
{
    /// <summary>
    /// View model for displaying credit note information
    /// </summary>
    public class CreditNoteViewModel
    {
        public int Id { get; set; }
        public string CreditNoteNumber { get; set; } = null!;
        public int InvoiceId { get; set; }
        public string InvoiceNumber { get; set; } = null!;
        public int? CustomerId { get; set; }
        public string CustomerName { get; set; } = null!;
        public decimal OriginalAmount { get; set; }
        public decimal CreditAmount { get; set; }
        public string Reason { get; set; } = null!;
        public string Status { get; set; } = null!;
        public bool ReverseStock { get; set; }
        public bool ReverseSale { get; set; }
        public string? Notes { get; set; }
        public UploadedDocumentViewModel? UploadedDocument { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public string? ApprovedBy { get; set; }
        public DateTime LastUpdated { get; set; }
    }

    /// <summary>
    /// View model for uploaded document information
    /// </summary>
    public class UploadedDocumentViewModel
    {
        public string FileName { get; set; } = null!;
        public string FileUrl { get; set; } = null!;
        public DateTime UploadedDate { get; set; }
    }

    /// <summary>
    /// View model for credit note summary (used in lists)
    /// </summary>
    public class CreditNoteSummaryViewModel
    {
        public int Id { get; set; }
        public string CreditNoteNumber { get; set; } = null!;
        public decimal CreditAmount { get; set; }
        public string Status { get; set; } = null!;
        public DateTime CreatedDate { get; set; }
    }
}
