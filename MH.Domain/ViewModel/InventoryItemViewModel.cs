using MH.Domain.DBModel;

namespace MH.Domain.ViewModel
{
    public class InventoryItemViewModel
    {
        public int? Id { get; set; }
        public string ItemNumber { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string Location { get; set; } = null!;
        public string UOM { get; set; } = null!;
        public InventoryCategory Category { get; set; }
        public string? CategoryText { get; set; }
        public int QtyOnHand { get; set; }
        public int QtyOnPO { get; set; }
        public int QtyOnSO { get; set; }
        public int StockAvailable { get; set; }
        public decimal UnitCostForQOH { get; set; }
        public decimal TotalCostForQOH { get; set; }
        public int ReorderLevel { get; set; }
        public int MaxStockLevel { get; set; }
        public string? Supplier { get; set; }
        public DateTime? LastRestocked { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public InventoryStatus Status { get; set; }
        public string? StatusText { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
        public string? CreatedByUserName { get; set; }
    }
}