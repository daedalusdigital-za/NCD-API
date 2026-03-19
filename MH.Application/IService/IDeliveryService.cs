using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.IService
{
    public interface IDeliveryService
    {
        Task Add(DeliveryModel model);
        Task Update(DeliveryModel model);
        Task UpdateStatus(DeliveryStatusUpdateModel model);
        Task Delete(int id);
        Task<DeliveryViewModel?> GetById(int id);
        Task<List<DeliveryViewModel>> GetAll();
        Task<List<DeliveryViewModel>> GetBySaleId(int saleId);
        Task<List<DeliveryViewModel>> GetByProvince(string province);
        Task<List<DeliveryViewModel>> GetByStatus(DeliveryTrackingStatus status);
        Task<List<DeliveryViewModel>> GetByDateRange(DateTime startDate, DateTime endDate);
        Task<List<DeliveryViewModel>> GetByEquipmentType(string itemDescription);
        Task<DeliveryStatsModel> GetDeliveryStats();
        Task<List<DeliveryByEquipmentTypeModel>> GetDeliveryStatsByEquipmentType();
        Task<List<DeliveryByProvinceModel>> GetDeliveryStatsByProvince();
        Task<string> GenerateDeliveryNumber();
    }
}
