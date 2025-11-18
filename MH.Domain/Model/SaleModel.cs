using MH.Domain.DBModel;

namespace MH.Domain.Model
{
    public class SaleModel
    {
        public int? Id { get; set; }
        public string SaleNumber { get; set; } = null!;
        public DateTime SaleDate { get; set; }
        public int CustomerId { get; set; }
        public string CustomerName { get; set; } = null!;
        public string? CustomerPhone { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Total { get; set; }
        public string? Notes { get; set; }
        public int? ProvinceId { get; set; }
        public List<SaleItemModel> SaleItems { get; set; } = new List<SaleItemModel>();
    }

    public class SaleItemModel
    {
        public int? Id { get; set; }
        public int InventoryItemId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
}