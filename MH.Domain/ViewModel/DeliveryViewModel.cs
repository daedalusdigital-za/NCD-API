using MH.Domain.DBModel;

namespace MH.Domain.ViewModel
{
    public class DeliveryViewModel
    {
        public int Id { get; set; }
        public string DeliveryNumber { get; set; } = null!;
        public int SaleId { get; set; }
        public string? SaleNumber { get; set; }
        public string InstitutionName { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string ItemDescription { get; set; } = null!;
        public int Quantity { get; set; }
        public DateTime DeliveryDate { get; set; }
        public string InvoiceNumber { get; set; } = null!;
        public DeliveryTrackingStatus Status { get; set; }
        public string StatusName => Status.ToString();
        public string? DriverName { get; set; }
        public string? VehicleNumber { get; set; }
        public string? RecipientName { get; set; }
        public string? RecipientSignature { get; set; }
        public DateTime? ReceivedDate { get; set; }
        public string? Notes { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
    }

    public class DeliveryStatsModel
    {
        public int TotalDeliveries { get; set; }
        public int Pending { get; set; }
        public int InTransit { get; set; }
        public int Delivered { get; set; }
        public int Failed { get; set; }
        public int Returned { get; set; }
        public decimal DeliveryRate { get; set; }
    }

    public class DeliveryByEquipmentTypeModel
    {
        public string EquipmentType { get; set; } = null!;
        public int TotalOrdered { get; set; }
        public int TotalDelivered { get; set; }
        public decimal DeliveryRate { get; set; }
        public List<ProvinceDistributionModel> ProvinceDistribution { get; set; } = new();
        public List<ItemBreakdownModel> ItemBreakdown { get; set; } = new();
    }

    public class ProvinceDistributionModel
    {
        public string Province { get; set; } = null!;
        public int Ordered { get; set; }
        public int Delivered { get; set; }
        public decimal Percentage { get; set; }
    }

    public class ItemBreakdownModel
    {
        public string ItemType { get; set; } = null!;
        public int Quantity { get; set; }
        public decimal Value { get; set; }
    }

    public class DeliveryByProvinceModel
    {
        public string Province { get; set; } = null!;
        public int TotalDeliveries { get; set; }
        public int Pending { get; set; }
        public int InTransit { get; set; }
        public int Delivered { get; set; }
        public int Failed { get; set; }
        public int Returned { get; set; }
        public decimal DeliveryRate { get; set; }
    }

    // Order vs Delivery stats - pulls from Sales data
    public class OrderDeliveryStatsModel
    {
        public string EquipmentType { get; set; } = null!;
        public string Category { get; set; } = null!;
        public int TotalOrdered { get; set; }
        public int TotalDelivered { get; set; }
        public int PendingDelivery { get; set; }
        public decimal DeliveryRate { get; set; }
        public decimal TotalOrderValue { get; set; }
        public decimal DeliveredValue { get; set; }
        public List<OrderProvinceBreakdown> ProvinceDistribution { get; set; } = new();
    }

    public class OrderProvinceBreakdown
    {
        public string Province { get; set; } = null!;
        public int Ordered { get; set; }
        public int Delivered { get; set; }
        public decimal Percentage { get; set; }
        public decimal OrderValue { get; set; }
    }

    public class AllEquipmentOrderStats
    {
        public int TotalEquipmentTypes { get; set; }
        public int TotalItemsOrdered { get; set; }
        public int TotalItemsDelivered { get; set; }
        public decimal OverallDeliveryRate { get; set; }
        public decimal TotalOrderValue { get; set; }
        public List<OrderDeliveryStatsModel> EquipmentBreakdown { get; set; } = new();
    }
}
