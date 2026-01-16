using System.ComponentModel.DataAnnotations;

namespace MH.Domain.Model
{
    /// <summary>
    /// DTO for creating a new credit note
    /// </summary>
    public class CreateCreditNoteDto
    {
        [Required(ErrorMessage = "Invoice ID is required")]
        public int InvoiceId { get; set; }

        [Required(ErrorMessage = "Credit amount is required")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Credit amount must be greater than 0")]
        public decimal CreditAmount { get; set; }

        [Required(ErrorMessage = "Reason is required")]
        [StringLength(2000, ErrorMessage = "Reason cannot exceed 2000 characters")]
        public string Reason { get; set; } = null!;

        [StringLength(2000, ErrorMessage = "Notes cannot exceed 2000 characters")]
        public string? Notes { get; set; }

        public bool ReverseStock { get; set; } = false;

        public bool ReverseSale { get; set; } = true;
    }

    /// <summary>
    /// DTO for updating an existing credit note
    /// </summary>
    public class UpdateCreditNoteDto
    {
        [Range(0.01, double.MaxValue, ErrorMessage = "Credit amount must be greater than 0")]
        public decimal? CreditAmount { get; set; }

        [StringLength(2000, ErrorMessage = "Reason cannot exceed 2000 characters")]
        public string? Reason { get; set; }

        [StringLength(2000, ErrorMessage = "Notes cannot exceed 2000 characters")]
        public string? Notes { get; set; }

        [RegularExpression("pending|approved|rejected|completed", 
            ErrorMessage = "Status must be one of: pending, approved, rejected, completed")]
        public string? Status { get; set; }

        public string? ApprovedBy { get; set; }

        public bool? ReverseStock { get; set; }

        public bool? ReverseSale { get; set; }
    }

    /// <summary>
    /// DTO for credit note query filters
    /// </summary>
    public class CreditNoteFilterDto
    {
        public string? Status { get; set; }
        public int? CustomerId { get; set; }
        public int? InvoiceId { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public string? Search { get; set; }
    }

    /// <summary>
    /// DTO for document upload result
    /// </summary>
    public class DocumentUploadResult
    {
        public string FileName { get; set; } = null!;
        public string FileUrl { get; set; } = null!;
        public DateTime UploadedDate { get; set; }
    }
}
