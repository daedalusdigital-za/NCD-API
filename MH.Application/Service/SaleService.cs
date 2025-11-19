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
            var entity = _mapper.Map<Sale>(model);
            entity.CreatedBy = _currentUser.User.Id;
            entity.DateCreated = DateTime.Now;
            
            // Calculate totals from sale items
            if (entity.SaleItems != null)
            {
                foreach (var item in entity.SaleItems)
                {
                    item.TotalPrice = item.Quantity * item.UnitPrice;
                }
                entity.Total = entity.SaleItems.Sum(x => x.TotalPrice);
            }

            await _saleRepository.Insert(entity);
        }

        public async Task Update(SaleModel model)
        {
            var existingEntity = await _saleRepository.FindBy(
                x => x.Id == model.Id.Value,
                x => x.SaleItems);
                
            if (existingEntity == null)
                throw new ArgumentException("Sale not found");

            _mapper.Map(model, existingEntity);
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            
            // Recalculate totals
            if (existingEntity.SaleItems != null)
            {
                foreach (var item in existingEntity.SaleItems)
                {
                    item.TotalPrice = item.Quantity * item.UnitPrice;
                }
                existingEntity.Total = existingEntity.SaleItems.Sum(x => x.TotalPrice);
            }

            await _saleRepository.Update(existingEntity);
        }

        public async Task Delete(int id)
        {
            var existingEntity = await _saleRepository.GetById(id);
            if (existingEntity == null)
                throw new ArgumentException("Sale not found");

            existingEntity.IsDeleted = true;
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
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
    }
}