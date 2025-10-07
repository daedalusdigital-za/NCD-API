using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Delivery : BaseModel<int>
    {
        public string DeliveryNumber { get; set; } = null!;
        public int SaleId { get; set; }
        public string InstitutionName { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string ItemDescription { get; set; } = null!;
        public int Quantity { get; set; }
        public DateTime DeliveryDate { get; set; }
        public string InvoiceNumber { get; set; } = null!;
        public DeliveryTrackingStatus Status { get; set; }
        public string? DriverName { get; set; }
        public string? VehicleNumber { get; set; }
        public string? RecipientName { get; set; }
        public string? RecipientSignature { get; set; }
        public DateTime? ReceivedDate { get; set; }
        public string? Notes { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual Sale? Sale { get; set; }
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum DeliveryTrackingStatus
    {
        Pending = 1,
        InTransit = 2,
        Delivered = 3,
        Failed = 4,
        Returned = 5
    }
}