using MH.Domain.Model;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MH.Domain.DBModel
{
    public class CreditNote : BaseModel<int>
    {
        [Required]
        [StringLength(50)]
        public string CreditNoteNumber { get; set; } = null!;

        [Required]
        public int InvoiceId { get; set; }

        [Required]
        [StringLength(50)]
        public string InvoiceNumber { get; set; } = null!;

        public int? CustomerId { get; set; }

        [Required]
        [StringLength(200)]
        public string CustomerName { get; set; } = null!;

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal OriginalAmount { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal CreditAmount { get; set; }

        [Required]
        public string Reason { get; set; } = null!;

        [Required]
        [StringLength(20)]
        public string Status { get; set; } = "pending"; // pending, approved, rejected, completed

        public bool ReverseStock { get; set; } = false;

        public bool ReverseSale { get; set; } = true;

        public string? Notes { get; set; }

        [StringLength(255)]
        public string? DocumentFileName { get; set; }

        [StringLength(500)]
        public string? DocumentFileUrl { get; set; }

        public DateTime? DocumentUploadedDate { get; set; }

        public DateTime? ApprovedDate { get; set; }

        [StringLength(100)]
        public string? ApprovedBy { get; set; }

        public bool IsDeleted { get; set; } = false;

        // Navigation properties
        public virtual Sale? Invoice { get; set; }
    }

    public enum CreditNoteStatus
    {
        Pending = 1,
        Approved = 2,
        Rejected = 3,
        Completed = 4
    }
}
