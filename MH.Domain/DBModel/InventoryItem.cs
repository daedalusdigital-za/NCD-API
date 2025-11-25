using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class InventoryItem : BaseModel<int>
    {
        public string Name { get; set; } = null!;
        public string? Description { get; set; }
        public InventoryCategory Category { get; set; }
        public string SKU { get; set; } = null!;
        public string UnitOfMeasure { get; set; } = null!;
        public decimal UnitPrice { get; set; }
        public int StockAvailable { get; set; }
        public int ReorderLevel { get; set; }
        public string? Supplier { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public string? BatchNumber { get; set; }
        public InventoryStatus Status { get; set; }
        public bool IsDeleted { get; set; }
        public new DateTime CreatedDate { get; set; }
        public new int? CreatedBy { get; set; }
        public new DateTime? LastUpdated { get; set; }
        public new int? UpdatedBy { get; set; }
        public int? ModifiedBy { get; set; }

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