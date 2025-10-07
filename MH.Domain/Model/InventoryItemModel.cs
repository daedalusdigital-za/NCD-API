using MH.Domain.DBModel;

namespace MH.Domain.Model
{
    public class InventoryItemModel
    {
        public int? Id { get; set; }
        public string ItemNumber { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string Location { get; set; } = null!;
        public string UOM { get; set; } = null!;
        public InventoryCategory Category { get; set; }
        public int QtyOnHand { get; set; }
        public int QtyOnPO { get; set; }
        public int QtyOnSO { get; set; }
        public decimal UnitCostForQOH { get; set; }
        public int ReorderLevel { get; set; }
        public int MaxStockLevel { get; set; }
        public string? Supplier { get; set; }
        public DateTime? LastRestocked { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public InventoryStatus Status { get; set; }
    }

    public class InventoryUpdateStockModel
    {
        public int Id { get; set; }
        public int QtyOnHand { get; set; }
        public int QtyOnPO { get; set; }
        public int QtyOnSO { get; set; }
        public decimal UnitCostForQOH { get; set; }
        public DateTime? LastRestocked { get; set; }
    }
}