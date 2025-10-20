using MH.Domain.DBModel;

namespace MH.Domain.Model
{
    public class SaleModel
    {
        public int? Id { get; set; }
        public string SaleNumber { get; set; } = null!;
        public DateTime SaleDate { get; set; }
        public string Province { get; set; } = null!;
        public string Hospital { get; set; } = null!;
        public string CustomerContactName { get; set; } = null!;
        public string? CustomerContactEmail { get; set; }
        public string? CustomerContactPhone { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
        public DeliveryStatus DeliveryStatus { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public string? Notes { get; set; }
        public string? SalesPerson { get; set; }
        public decimal Discount { get; set; }
        public string? InvoiceNumber { get; set; }
        public List<SaleItemModel> SaleItems { get; set; } = new List<SaleItemModel>();
    }

    public class SaleItemModel
    {
        public int? Id { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
}