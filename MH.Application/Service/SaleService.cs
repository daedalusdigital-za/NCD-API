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
            
            // Calculate totals
            entity.Subtotal = entity.SaleItems?.Sum(x => x.TotalPrice) ?? 0;
            entity.TaxAmount = entity.Subtotal * 0.15m; // 15% VAT
            entity.Total = entity.Subtotal + entity.TaxAmount - entity.Discount;
            
            // Set each sale item's calculated total
            if (entity.SaleItems != null)
            {
                foreach (var item in entity.SaleItems)
                {
                    item.TotalPrice = item.Quantity * item.UnitPrice;
                    item.DateCreated = DateTime.Now;
                    item.CreatedBy = _currentUser.User.Id;
                }
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

            var viewModel = _mapper.Map<SaleViewModel>(entity);
            viewModel.PaymentMethodText = GetPaymentMethodText(entity.PaymentMethod);
            viewModel.PaymentStatusText = GetPaymentStatusText(entity.PaymentStatus);
            viewModel.DeliveryStatusText = GetDeliveryStatusText(entity.DeliveryStatus);
            
            return viewModel;
        }

        public async Task<List<SaleViewModel>> GetAll()
        {
            var entities = await _saleRepository.GetAll(
                x => !x.IsDeleted,
                x => x.SaleItems);

            var viewModels = _mapper.Map<List<SaleViewModel>>(entities);
            
            // Enhance with text representations
            foreach (var vm in viewModels)
            {
                vm.PaymentMethodText = GetPaymentMethodText((int)vm.PaymentMethod);
                vm.PaymentStatusText = GetPaymentStatusText((int)vm.PaymentStatus);
                vm.DeliveryStatusText = GetDeliveryStatusText((int)vm.DeliveryStatus);
            }

            return viewModels;
        }

        private string GetPaymentMethodText(int paymentMethod)
        {
            return paymentMethod switch
            {
                1 => "Cash",
                2 => "Credit Card",
                3 => "Bank Transfer",
                4 => "Government Contract",
                _ => "Unknown"
            };
        }

        private string GetPaymentStatusText(int paymentStatus)
        {
            return paymentStatus switch
            {
                0 => "Pending",
                1 => "Paid",
                2 => "Overdue",
                3 => "Cancelled",
                _ => "Unknown"
            };
        }

        private string GetDeliveryStatusText(int deliveryStatus)
        {
            return deliveryStatus switch
            {
                0 => "Pending",
                1 => "Delivered",
                2 => "In Transit",
                3 => "Cancelled",
                _ => "Unknown"
            };
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