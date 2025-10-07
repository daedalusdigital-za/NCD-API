using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Application.IService
{
    public interface IInventoryItemService
    {
        Task Add(InventoryItemModel model);
        Task Update(InventoryItemModel model);
        Task Delete(int id);
        Task<InventoryItemViewModel?> GetById(int id);
        Task<List<InventoryItemViewModel>> GetAll();
        Task<List<InventoryItemViewModel>> GetByCategory(InventoryCategory category);
        Task<List<InventoryItemViewModel>> GetLowStock();
        Task<List<InventoryItemViewModel>> GetByStatus(InventoryStatus status);
        Task UpdateStock(InventoryUpdateStockModel model);
        Task<InventoryStatsModel> GetInventoryStats();
        Task<bool> IsItemNumberExists(string itemNumber, int? excludeId = null);
    }
}