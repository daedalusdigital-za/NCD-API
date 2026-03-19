using MH.Domain.DBModel;
using MH.Domain.ViewModel;

namespace MH.Domain.IRepository
{
    public interface IDeliveryRepository : IRepository<Delivery, int>
    {
        Task<IReadOnlyList<Delivery>> GetBySaleId(int saleId);
        Task<IReadOnlyList<Delivery>> GetByProvince(string province);
        Task<IReadOnlyList<Delivery>> GetByStatus(DeliveryTrackingStatus status);
        Task<IReadOnlyList<Delivery>> GetByDateRange(DateTime startDate, DateTime endDate);
        Task<IReadOnlyList<Delivery>> GetByEquipmentType(string itemDescription);
        Task<Delivery?> GetByDeliveryNumber(string deliveryNumber);
        Task<bool> IsDeliveryNumberExists(string deliveryNumber, int? excludeId = null);
        Task<DeliveryStatsModel> GetDeliveryStats();
        Task<List<DeliveryByEquipmentTypeModel>> GetDeliveryStatsByEquipmentType();
        Task<List<DeliveryByProvinceModel>> GetDeliveryStatsByProvince();
        Task<AllEquipmentOrderStats> GetAllEquipmentOrderStats();
    }
}
