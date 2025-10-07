using MH.Domain.DBModel;

namespace MH.Domain.ViewModel
{
    public class SaleViewModel
    {
        public int? Id { get; set; }
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
        public string? PaymentMethodText { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
        public string? PaymentStatusText { get; set; }
        public DeliveryStatus DeliveryStatus { get; set; }
        public string? DeliveryStatusText { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public string? Notes { get; set; }
        public string? SalesPerson { get; set; }
        public decimal Discount { get; set; }
        public string? InvoiceNumber { get; set; }
        public string CreatedByName { get; set; } = null!;
        public List<SaleItemViewModel>? SaleItems { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
    }

    public class SaleItemViewModel
    {
        public int? Id { get; set; }
        public int SaleId { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
    }
}