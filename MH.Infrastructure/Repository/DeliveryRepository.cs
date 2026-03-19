using Microsoft.EntityFrameworkCore;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.ViewModel;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class DeliveryRepository : Repository<Delivery, int>, IDeliveryRepository
    {
        private readonly ApplicationDbContext _context;

        public DeliveryRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IReadOnlyList<Delivery>> GetBySaleId(int saleId)
        {
            return await _context.Deliveries
                .Include(x => x.Sale)
                .Where(x => x.SaleId == saleId && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Delivery>> GetByProvince(string province)
        {
            return await _context.Deliveries
                .Include(x => x.Sale)
                .Where(x => x.Province.ToLower() == province.ToLower() && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Delivery>> GetByStatus(DeliveryTrackingStatus status)
        {
            return await _context.Deliveries
                .Include(x => x.Sale)
                .Where(x => x.Status == status && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Delivery>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            return await _context.Deliveries
                .Include(x => x.Sale)
                .Where(x => x.DeliveryDate >= startDate && x.DeliveryDate <= endDate && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Delivery>> GetByEquipmentType(string itemDescription)
        {
            return await _context.Deliveries
                .Include(x => x.Sale)
                .Where(x => x.ItemDescription.ToLower().Contains(itemDescription.ToLower()) && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<Delivery?> GetByDeliveryNumber(string deliveryNumber)
        {
            return await _context.Deliveries
                .Include(x => x.Sale)
                .FirstOrDefaultAsync(x => x.DeliveryNumber == deliveryNumber && !x.IsDeleted);
        }

        public async Task<bool> IsDeliveryNumberExists(string deliveryNumber, int? excludeId = null)
        {
            var query = _context.Deliveries.Where(x => x.DeliveryNumber == deliveryNumber && !x.IsDeleted);
            
            if (excludeId.HasValue)
            {
                query = query.Where(x => x.Id != excludeId.Value);
            }
            
            return await query.AnyAsync();
        }

        public async Task<DeliveryStatsModel> GetDeliveryStats()
        {
            var deliveries = await _context.Deliveries
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            var total = deliveries.Count;
            var delivered = deliveries.Count(x => x.Status == DeliveryTrackingStatus.Delivered);

            return new DeliveryStatsModel
            {
                TotalDeliveries = total,
                Pending = deliveries.Count(x => x.Status == DeliveryTrackingStatus.Pending),
                InTransit = deliveries.Count(x => x.Status == DeliveryTrackingStatus.InTransit),
                Delivered = delivered,
                Failed = deliveries.Count(x => x.Status == DeliveryTrackingStatus.Failed),
                Returned = deliveries.Count(x => x.Status == DeliveryTrackingStatus.Returned),
                DeliveryRate = total > 0 ? Math.Round((decimal)delivered / total * 100, 2) : 0
            };
        }

        public async Task<List<DeliveryByEquipmentTypeModel>> GetDeliveryStatsByEquipmentType()
        {
            var deliveries = await _context.Deliveries
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            return deliveries
                .GroupBy(x => x.ItemDescription)
                .Select(g => new DeliveryByEquipmentTypeModel
                {
                    EquipmentType = g.Key,
                    TotalOrdered = g.Sum(x => x.Quantity),
                    Pending = g.Count(x => x.Status == DeliveryTrackingStatus.Pending),
                    InTransit = g.Count(x => x.Status == DeliveryTrackingStatus.InTransit),
                    Delivered = g.Count(x => x.Status == DeliveryTrackingStatus.Delivered),
                    Failed = g.Count(x => x.Status == DeliveryTrackingStatus.Failed),
                    Returned = g.Count(x => x.Status == DeliveryTrackingStatus.Returned),
                    DeliveryRate = g.Count() > 0 
                        ? Math.Round((decimal)g.Count(x => x.Status == DeliveryTrackingStatus.Delivered) / g.Count() * 100, 2) 
                        : 0
                })
                .OrderBy(x => x.EquipmentType)
                .ToList();
        }

        public async Task<List<DeliveryByProvinceModel>> GetDeliveryStatsByProvince()
        {
            var deliveries = await _context.Deliveries
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            return deliveries
                .GroupBy(x => x.Province)
                .Select(g => new DeliveryByProvinceModel
                {
                    Province = g.Key,
                    TotalDeliveries = g.Count(),
                    Pending = g.Count(x => x.Status == DeliveryTrackingStatus.Pending),
                    InTransit = g.Count(x => x.Status == DeliveryTrackingStatus.InTransit),
                    Delivered = g.Count(x => x.Status == DeliveryTrackingStatus.Delivered),
                    Failed = g.Count(x => x.Status == DeliveryTrackingStatus.Failed),
                    Returned = g.Count(x => x.Status == DeliveryTrackingStatus.Returned),
                    DeliveryRate = g.Count() > 0 
                        ? Math.Round((decimal)g.Count(x => x.Status == DeliveryTrackingStatus.Delivered) / g.Count() * 100, 2) 
                        : 0
                })
                .OrderBy(x => x.Province)
                .ToList();
        }
    }
}
