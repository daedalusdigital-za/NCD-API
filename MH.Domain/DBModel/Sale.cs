using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Sale : BaseModel<int>
    {
        public string SaleNumber { get; set; } = null!;
        public DateTime SaleDate { get; set; }
        public string Province { get; set; } = null!;
        public string Hospital { get; set; } = null!;
        public string CustomerContactName { get; set; } = null!;
        public string? CustomerContactEmail { get; set; }
        public string? CustomerContactPhone { get; set; }
        public decimal Subtotal { get; set; }
        public decimal TaxAmount { get; set; }
        public decimal Total { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
        public DeliveryStatus DeliveryStatus { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public string? Notes { get; set; }
        public string? SalesPerson { get; set; }
        public decimal Discount { get; set; }
        public string? InvoiceNumber { get; set; }
        public string CreatedByName { get; set; } = null!;
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ICollection<SaleItem> SaleItems { get; set; } = new List<SaleItem>();
        public virtual ICollection<Delivery> Deliveries { get; set; } = new List<Delivery>();
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public class SaleItem : BaseModel<int>
    {
        public int SaleId { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual Sale? Sale { get; set; }
        public virtual Product? Product { get; set; }
        public virtual InventoryItem? InventoryItem { get; set; }
    }

    public enum PaymentMethod
    {
        Cash = 1,
        CreditCard = 2,
        BankTransfer = 3,
        GovernmentContract = 4
    }

    public enum PaymentStatus
    {
        Pending = 1,
        Paid = 2,
        Overdue = 3,
        Cancelled = 4
    }

    public enum DeliveryStatus
    {
        Pending = 1,
        InTransit = 2,
        Delivered = 3,
        Cancelled = 4
    }
}