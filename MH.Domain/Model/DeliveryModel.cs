using MH.Domain.DBModel;

namespace MH.Domain.Model
{
    public class DeliveryModel
    {
        public int? Id { get; set; }
        public string? DeliveryNumber { get; set; }
        public int SaleId { get; set; }
        public string InstitutionName { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string ItemDescription { get; set; } = null!;
        public int Quantity { get; set; }
        public DateTime DeliveryDate { get; set; }
        public string InvoiceNumber { get; set; } = null!;
        public DeliveryTrackingStatus Status { get; set; } = DeliveryTrackingStatus.Pending;
        public string? DriverName { get; set; }
        public string? VehicleNumber { get; set; }
        public string? RecipientName { get; set; }
        public string? RecipientSignature { get; set; }
        public DateTime? ReceivedDate { get; set; }
        public string? Notes { get; set; }
    }

    public class DeliveryStatusUpdateModel
    {
        public int DeliveryId { get; set; }
        public DeliveryTrackingStatus Status { get; set; }
        public string? RecipientName { get; set; }
        public string? RecipientSignature { get; set; }
        public DateTime? ReceivedDate { get; set; }
        public string? Notes { get; set; }
    }
}
