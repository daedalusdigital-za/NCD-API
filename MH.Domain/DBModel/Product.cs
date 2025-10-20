using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Product : BaseModel<int>
    {
        public string Name { get; set; } = null!;
        public ProductCategory Category { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public string Supplier { get; set; } = null!;
        public string Description { get; set; } = null!;
        public ProductStatus Status { get; set; }
        public DateTime? LastRestocked { get; set; }
        public string? SKU { get; set; }
        public string? Barcode { get; set; }
        public decimal? Weight { get; set; }
        public decimal? Length { get; set; }
        public decimal? Width { get; set; }
        public decimal? Height { get; set; }
        public int MinimumOrderQuantity { get; set; }
        public int LeadTime { get; set; }
        public string? Warranty { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ICollection<SaleItem> SaleItems { get; set; } = new List<SaleItem>();
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum ProductCategory
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

    public enum ProductStatus
    {
        InStock = 1,
        LowStock = 2,
        OutOfStock = 3,
        Discontinued = 4
    }
}