using MH.Domain.DBModel;

namespace MH.Domain.ViewModel
{
    public class InventoryItemViewModel
    {
        public int? Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Description { get; set; }
        public InventoryCategory Category { get; set; }
        public string? CategoryText { get; set; }
        public string SKU { get; set; } = null!;
        public string UnitOfMeasure { get; set; } = null!;
        public decimal UnitPrice { get; set; }
        public int StockAvailable { get; set; }
        public int ReorderLevel { get; set; }
        public string? Supplier { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public string? BatchNumber { get; set; }
        public InventoryStatus Status { get; set; }
        public string? StatusText { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }
        public string? CreatedByUserName { get; set; }
    }
}