using MH.Domain.Model;
using System.ComponentModel.DataAnnotations.Schema;

namespace MH.Domain.DBModel
{
    public class Sale : BaseModel<int>
    {
        // Map DateCreated property to CreatedDate column in database
        [Column("CreatedDate")]
        public new DateTime DateCreated { get; set; }
        
        public string SaleNumber { get; set; } = null!;
        public DateTime SaleDate { get; set; }
        
        // Customer information  
        public string CustomerName { get; set; } = null!;
        public string? CustomerPhone { get; set; }
        
        // Sale totals and details
        public decimal Total { get; set; }
        public string? Notes { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ICollection<SaleItem> SaleItems { get; set; } = new List<SaleItem>();
    }

    // SaleItem does NOT inherit from BaseModel because the table lacks audit columns
    public class SaleItem
    {
        public int Id { get; set; }
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