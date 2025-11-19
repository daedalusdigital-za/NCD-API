using MH.Domain.DBModel;

namespace MH.Domain.ViewModel
{
    public class SaleViewModel
    {
        public int? Id { get; set; }
        public string SaleNumber { get; set; } = null!;
        public DateTime SaleDate { get; set; }
        public string CustomerName { get; set; } = null!;
        public string? CustomerPhone { get; set; }
        public decimal Total { get; set; }
        public string? Notes { get; set; }
        public List<SaleItemViewModel>? SaleItems { get; set; }
        public DateTime DateCreated { get; set; }
    }

    public class SaleItemViewModel
    {
        public int? Id { get; set; }
        public int SaleId { get; set; }
        public int InventoryItemId { get; set; }
        public string? InventoryItemName { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
    }
}