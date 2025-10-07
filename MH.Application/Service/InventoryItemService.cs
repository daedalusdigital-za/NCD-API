using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IEntity;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.Service
{
    public class InventoryItemService : IInventoryItemService
    {
        private readonly IInventoryItemRepository _inventoryRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUser _currentUser;

        public InventoryItemService(
            IInventoryItemRepository inventoryRepository,
            IMapper mapper,
            ICurrentUser currentUser)
        {
            _inventoryRepository = inventoryRepository;
            _mapper = mapper;
            _currentUser = currentUser;
        }

        public async Task Add(InventoryItemModel model)
        {
            var entity = _mapper.Map<InventoryItem>(model);
            entity.CreatedBy = _currentUser.User.Id;
            entity.DateCreated = DateTime.Now;
            
            // Calculate derived fields
            entity.StockAvailable = entity.QtyOnHand + entity.QtyOnPO - entity.QtyOnSO;
            entity.TotalCostForQOH = entity.QtyOnHand * entity.UnitCostForQOH;
            
            // Set initial status based on stock levels
            if (entity.StockAvailable <= 0)
                entity.Status = InventoryStatus.OutOfStock;
            else if (entity.StockAvailable <= entity.ReorderLevel)
                entity.Status = InventoryStatus.LowStock;
            else
                entity.Status = InventoryStatus.InStock;

            await _inventoryRepository.Insert(entity);
        }

        public async Task Update(InventoryItemModel model)
        {
            var existingEntity = await _inventoryRepository.GetById(model.Id.Value);
            if (existingEntity == null)
                throw new ArgumentException("Inventory item not found");

            _mapper.Map(model, existingEntity);
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            
            // Recalculate derived fields
            existingEntity.StockAvailable = existingEntity.QtyOnHand + existingEntity.QtyOnPO - existingEntity.QtyOnSO;
            existingEntity.TotalCostForQOH = existingEntity.QtyOnHand * existingEntity.UnitCostForQOH;
            
            // Update status based on stock levels
            if (existingEntity.StockAvailable <= 0)
                existingEntity.Status = InventoryStatus.OutOfStock;
            else if (existingEntity.StockAvailable <= existingEntity.ReorderLevel)
                existingEntity.Status = InventoryStatus.LowStock;
            else
                existingEntity.Status = InventoryStatus.InStock;

            await _inventoryRepository.Update(existingEntity);
        }

        public async Task Delete(int id)
        {
            var existingEntity = await _inventoryRepository.GetById(id);
            if (existingEntity == null)
                throw new ArgumentException("Inventory item not found");

            existingEntity.IsDeleted = true;
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            await _inventoryRepository.Update(existingEntity);
        }

        public async Task<InventoryItemViewModel?> GetById(int id)
        {
            var entity = await _inventoryRepository.FindBy(
                x => x.Id == id && !x.IsDeleted,
                x => x.CreatedByUser);
            
            if (entity == null) return null;

            var viewModel = _mapper.Map<InventoryItemViewModel>(entity);
            viewModel.CategoryText = entity.Category.ToString();
            viewModel.StatusText = entity.Status.ToString();
            viewModel.CreatedByUserName = entity.CreatedByUser?.UserProfile?.FirstName + " " + entity.CreatedByUser?.UserProfile?.LastName;
            
            return viewModel;
        }

        public async Task<List<InventoryItemViewModel>> GetAll()
        {
            var entities = await _inventoryRepository.GetAll(
                x => !x.IsDeleted,
                x => x.CreatedByUser);

            var viewModels = _mapper.Map<List<InventoryItemViewModel>>(entities);
            
            // Enhance with text representations
            foreach (var vm in viewModels)
            {
                vm.CategoryText = ((InventoryCategory)vm.Category).ToString();
                vm.StatusText = ((InventoryStatus)vm.Status).ToString();
            }

            return viewModels;
        }

        public async Task<List<InventoryItemViewModel>> GetByCategory(InventoryCategory category)
        {
            var entities = await _inventoryRepository.GetByCategory(category);
            return _mapper.Map<List<InventoryItemViewModel>>(entities);
        }

        public async Task<List<InventoryItemViewModel>> GetLowStock()
        {
            var entities = await _inventoryRepository.GetLowStock();
            return _mapper.Map<List<InventoryItemViewModel>>(entities);
        }

        public async Task<List<InventoryItemViewModel>> GetByStatus(InventoryStatus status)
        {
            var entities = await _inventoryRepository.GetByStatus(status);
            return _mapper.Map<List<InventoryItemViewModel>>(entities);
        }

        public async Task UpdateStock(InventoryUpdateStockModel model)
        {
            await _inventoryRepository.UpdateStock(
                model.Id, 
                model.QtyOnHand, 
                model.QtyOnPO, 
                model.QtyOnSO, 
                model.UnitCostForQOH);
        }

        public async Task<InventoryStatsModel> GetInventoryStats()
        {
            return await _inventoryRepository.GetInventoryStats();
        }

        public async Task<bool> IsItemNumberExists(string itemNumber, int? excludeId = null)
        {
            return await _inventoryRepository.IsItemNumberExists(itemNumber, excludeId);
        }
    }
}