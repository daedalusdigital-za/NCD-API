using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Sale : BaseModel<int>
    {
        public string SaleNumber { get; set; } = null!;
        public DateTime SaleDate { get; set; }
        
        // Map to database columns
        public int CustomerId { get; set; }
        public string CustomerName { get; set; } = null!;
        public string? CustomerEmail { get; set; }
        public string? CustomerPhone { get; set; }
        
        public decimal Subtotal { get; set; }
        public decimal TaxAmount { get; set; }
        public decimal Discount { get; set; }
        public decimal Total { get; set; }
        public int PaymentMethod { get; set; }
        public int PaymentStatus { get; set; }
        public int DeliveryStatus { get; set; }
        public string? Notes { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ICollection<SaleItem> SaleItems { get; set; } = new List<SaleItem>();
    }

    public class SaleItem : BaseModel<int>
    {
        public int SaleId { get; set; }
        public int InventoryItemId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual Sale? Sale { get; set; }
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