using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IEntity;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.Service
{
    public class SaleService : ISaleService
    {
        private readonly ISaleRepository _saleRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUser _currentUser;

        public SaleService(
            ISaleRepository saleRepository,
            IMapper mapper,
            ICurrentUser currentUser)
        {
            _saleRepository = saleRepository;
            _mapper = mapper;
            _currentUser = currentUser;
        }

        public async Task Add(SaleModel model)
        {
            // Validation
            if (string.IsNullOrWhiteSpace(model.SaleNumber))
                throw new ArgumentException("Sale number is required");

            if (string.IsNullOrWhiteSpace(model.CustomerName))
                throw new ArgumentException("Customer name is required");

            if (model.SaleItems == null || !model.SaleItems.Any())
                throw new ArgumentException("At least one sale item is required");

            // Validate all items
            foreach (var item in model.SaleItems)
            {
                if (item.Quantity <= 0)
                    throw new ArgumentException("Item quantity must be greater than 0");

                if (item.UnitPrice <= 0)
                    throw new ArgumentException("Item unit price must be greater than 0");
            }

            var entity = _mapper.Map<Sale>(model);
            entity.CreatedBy = _currentUser.User.Id;
            entity.DateCreated = DateTime.Now;
            entity.IsDeleted = false;
            
            // Calculate totals from sale items
            if (entity.SaleItems != null)
            {
                foreach (var item in entity.SaleItems)
                {
                    item.TotalPrice = item.Quantity * item.UnitPrice;
                    item.IsDeleted = false;
                }
                entity.Total = entity.SaleItems.Sum(x => x.TotalPrice);
            }

            await _saleRepository.Insert(entity);
        }

        public async Task Update(SaleModel model)
        {
            // Validation
            if (!model.Id.HasValue || model.Id.Value <= 0)
                throw new ArgumentException("Invalid sale ID");

            if (string.IsNullOrWhiteSpace(model.SaleNumber))
                throw new ArgumentException("Sale number is required");

            if (string.IsNullOrWhiteSpace(model.CustomerName))
                throw new ArgumentException("Customer name is required");

            if (model.SaleItems == null || !model.SaleItems.Any())
                throw new ArgumentException("At least one sale item is required");

            var existingEntity = await _saleRepository.FindByAsTracking(
                x => x.Id == model.Id.Value,
                x => x.SaleItems);
                
            if (existingEntity == null)
                throw new ArgumentException($"Sale with ID {model.Id.Value} not found");

            // Update basic fields
            existingEntity.SaleNumber = model.SaleNumber;
            existingEntity.SaleDate = model.SaleDate;
            existingEntity.CustomerName = model.CustomerName;
            existingEntity.CustomerPhone = model.CustomerPhone;
            existingEntity.Notes = model.Notes;

            // Update audit fields
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;

            // Handle SaleItems - Remove items not in the new list
            var existingItemIds = existingEntity.SaleItems.Select(x => x.Id).ToList();
            var updatedItemIds = model.SaleItems.Where(x => x.Id.HasValue).Select(x => x.Id.Value).ToList();
            var itemsToRemove = existingEntity.SaleItems.Where(x => !updatedItemIds.Contains(x.Id)).ToList();
            
            foreach (var item in itemsToRemove)
            {
                existingEntity.SaleItems.Remove(item);
            }

            // Update existing items and add new ones
            foreach (var itemModel in model.SaleItems)
            {
                if (itemModel.Quantity <= 0)
                    throw new ArgumentException("Item quantity must be greater than 0");

                if (itemModel.UnitPrice <= 0)
                    throw new ArgumentException("Item unit price must be greater than 0");

                if (itemModel.Id.HasValue && itemModel.Id.Value > 0)
                {
                    // Update existing item
                    var existingItem = existingEntity.SaleItems.FirstOrDefault(x => x.Id == itemModel.Id.Value);
                    if (existingItem != null)
                    {
                        existingItem.InventoryItemId = itemModel.InventoryItemId;
                        existingItem.Quantity = itemModel.Quantity;
                        existingItem.UnitPrice = itemModel.UnitPrice;
                        existingItem.TotalPrice = itemModel.Quantity * itemModel.UnitPrice;
                    }
                }
                else
                {
                    // Add new item
                    var newItem = new SaleItem
                    {
                        SaleId = existingEntity.Id,
                        InventoryItemId = itemModel.InventoryItemId,
                        Quantity = itemModel.Quantity,
                        UnitPrice = itemModel.UnitPrice,
                        TotalPrice = itemModel.Quantity * itemModel.UnitPrice,
                        IsDeleted = false
                    };
                    existingEntity.SaleItems.Add(newItem);
                }
            }

            // Recalculate total from all items
            existingEntity.Total = existingEntity.SaleItems
                .Where(x => !x.IsDeleted)
                .Sum(x => x.TotalPrice);

            await _saleRepository.Update(existingEntity);
            await _saleRepository.SaveAsync();
        }

        public async Task Delete(int id)
        {
            var existingEntity = await _saleRepository.GetById(id);
            if (existingEntity == null)
                throw new ArgumentException("Sale not found");

            existingEntity.IsDeleted = true;
            // Sale table doesn't have UpdatedBy/LastUpdated columns - removed
            await _saleRepository.Update(existingEntity);
        }

        public async Task<SaleViewModel?> GetById(int id)
        {
            var entity = await _saleRepository.FindBy(
                x => x.Id == id && !x.IsDeleted,
                x => x.SaleItems);
            
            if (entity == null) return null;

            return _mapper.Map<SaleViewModel>(entity);
        }

        public async Task<List<SaleViewModel>> GetAll()
        {
            var entities = await _saleRepository.GetAll(
                x => !x.IsDeleted,
                x => x.SaleItems);

            return _mapper.Map<List<SaleViewModel>>(entities);
        }

        public async Task<List<SaleViewModel>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            var entities = await _saleRepository.GetByDateRange(startDate, endDate);
            return _mapper.Map<List<SaleViewModel>>(entities);
        }

        public async Task<List<SaleViewModel>> GetByProvince(string province)
        {
            var entities = await _saleRepository.GetByProvince(province);
            return _mapper.Map<List<SaleViewModel>>(entities);
        }

        public async Task<SalesStatsModel> GetSalesStats()
        {
            return await _saleRepository.GetSalesStats();
        }

        public async Task<List<ProvincialSalesData>> GetProvincialSalesData()
        {
            return await _saleRepository.GetProvincialSalesData();
        }

        public async Task<List<TopProductModel>> GetTopProducts(int limit = 10)
        {
            return await _saleRepository.GetTopProducts(limit);
        }

        public async Task<List<SaleViewModel>> GetRecentSales(int limit = 10)
        {
            var entities = await _saleRepository.GetRecentSales(limit);
            return _mapper.Map<List<SaleViewModel>>(entities);
        }

        public async Task<bool> IsSaleNumberExists(string saleNumber, int? excludeId = null)
        {
            return await _saleRepository.IsSaleNumberExists(saleNumber, excludeId);
        }

        public async Task<string> GenerateSaleNumber()
        {
            var year = DateTime.Now.Year;
            var month = DateTime.Now.Month;
            
            // Get the count of sales this month to generate sequential number
            var monthlyCount = await _saleRepository.GetAll(
                x => x.SaleDate.Year == year && x.SaleDate.Month == month && !x.IsDeleted);
            
            var sequentialNumber = monthlyCount.Count() + 1;
            
            return $"SAL-{year}{month:00}-{sequentialNumber:0000}";
        }

        public async Task<List<SaleViewModel>> GetCreditedSales(string? status = null, DateTime? dateFrom = null, DateTime? dateTo = null)
        {
            // Get all sales with credit notes including related data
            var allSales = await _saleRepository.GetAll();
            var entities = allSales.Where(x => x.HasCreditNote && !x.IsDeleted).ToList();

            // Apply filters
            if (!string.IsNullOrEmpty(status))
            {
                entities = entities.Where(s => s.CreditNotes.Any(cn => cn.Status == status && !cn.IsDeleted)).ToList();
            }

            if (dateFrom.HasValue)
            {
                entities = entities.Where(s => s.SaleDate >= dateFrom.Value).ToList();
            }

            if (dateTo.HasValue)
            {
                entities = entities.Where(s => s.SaleDate <= dateTo.Value).ToList();
            }

            return _mapper.Map<List<SaleViewModel>>(entities);
        }
    }
}