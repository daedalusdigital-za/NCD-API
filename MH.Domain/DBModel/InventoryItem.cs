using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class InventoryItem : BaseModel<int>
    {
        public string ItemNumber { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string Location { get; set; } = null!;
        public string UOM { get; set; } = null!; // Unit of Measure
        public InventoryCategory Category { get; set; }
        public int QtyOnHand { get; set; }
        public int QtyOnPO { get; set; } // Quantity on Purchase Order
        public int QtyOnSO { get; set; } // Quantity on Sales Order
        public int StockAvailable { get; set; } // Calculated: QtyOnHand + QtyOnPO - QtyOnSO
        public decimal UnitCostForQOH { get; set; }
        public decimal TotalCostForQOH { get; set; } // Calculated: QtyOnHand * UnitCostForQOH
        public int ReorderLevel { get; set; }
        public int MaxStockLevel { get; set; }
        public string? Supplier { get; set; }
        public DateTime? LastRestocked { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public InventoryStatus Status { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ICollection<SaleItem> SaleItems { get; set; } = new List<SaleItem>();
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum InventoryCategory
    {
        HemoglobinTesting = 1,
        GlucoseTesting = 2,
        HBA1CTesting = 3,
        MultiparameterTesting = 4,
        QualityControl = 5,
        EquipmentAccessories = 6,
        Disposables = 7,
        MedicalEquipment = 8
    }

    public enum InventoryStatus
    {
        InStock = 1,
        LowStock = 2,
        OutOfStock = 3,
        Discontinued = 4
    }
}