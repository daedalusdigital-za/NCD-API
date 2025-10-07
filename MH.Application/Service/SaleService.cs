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
            entity.CreatedBy = _currentUser.UserId;
            entity.DateCreated = DateTime.Now;
            entity.CreatedByName = _currentUser.User?.UserProfile?.FirstName + " " + _currentUser.User?.UserProfile?.LastName;
            
            // Calculate totals
            entity.Subtotal = entity.SaleItems.Sum(x => x.TotalPrice);
            entity.TaxAmount = entity.Subtotal * 0.15m; // 15% VAT
            entity.Total = entity.Subtotal + entity.TaxAmount - entity.Discount;
            
            // Set each sale item's calculated total
            foreach (var item in entity.SaleItems)
            {
                item.TotalPrice = item.Quantity * item.UnitPrice;
                item.CreatedBy = _currentUser.UserId;
                item.DateCreated = DateTime.Now;
            }

            await _saleRepository.Add(entity);
        }

        public async Task Update(SaleModel model)
        {
            var existingEntity = await _saleRepository.GetFirst(
                x => x.Id == model.Id.Value,
                x => x.SaleItems);
                
            if (existingEntity == null)
                throw new ArgumentException("Sale not found");

            _mapper.Map(model, existingEntity);
            existingEntity.UpdatedBy = _currentUser.UserId;
            existingEntity.LastUpdated = DateTime.Now;
            
            // Recalculate totals
            existingEntity.Subtotal = existingEntity.SaleItems.Sum(x => x.TotalPrice);
            existingEntity.TaxAmount = existingEntity.Subtotal * 0.15m;
            existingEntity.Total = existingEntity.Subtotal + existingEntity.TaxAmount - existingEntity.Discount;

            await _saleRepository.Update(existingEntity);
        }

        public async Task Delete(int id)
        {
            var existingEntity = await _saleRepository.GetById(id);
            if (existingEntity == null)
                throw new ArgumentException("Sale not found");

            existingEntity.IsDeleted = true;
            existingEntity.UpdatedBy = _currentUser.UserId;
            existingEntity.LastUpdated = DateTime.Now;
            await _saleRepository.Update(existingEntity);
        }

        public async Task<SaleViewModel?> GetById(int id)
        {
            var entity = await _saleRepository.GetFirst(
                x => x.Id == id && !x.IsDeleted,
                x => x.SaleItems, x => x.CreatedByUser);
            
            if (entity == null) return null;

            var viewModel = _mapper.Map<SaleViewModel>(entity);
            viewModel.PaymentMethodText = entity.PaymentMethod.ToString();
            viewModel.PaymentStatusText = entity.PaymentStatus.ToString();
            viewModel.DeliveryStatusText = entity.DeliveryStatus.ToString();
            
            return viewModel;
        }

        public async Task<List<SaleViewModel>> GetAll()
        {
            var entities = await _saleRepository.GetAll(
                x => !x.IsDeleted,
                x => x.SaleItems, x => x.CreatedByUser);

            var viewModels = _mapper.Map<List<SaleViewModel>>(entities);
            
            // Enhance with text representations
            foreach (var vm in viewModels)
            {
                vm.PaymentMethodText = ((PaymentMethod)vm.PaymentMethod).ToString();
                vm.PaymentStatusText = ((PaymentStatus)vm.PaymentStatus).ToString();
                vm.DeliveryStatusText = ((DeliveryStatus)vm.DeliveryStatus).ToString();
            }

            return viewModels;
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