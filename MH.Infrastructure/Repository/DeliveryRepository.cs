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
                .Include(x => x.Sale)
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            return deliveries
                .GroupBy(x => x.ItemDescription)
                .Select(g => {
                    var totalOrdered = g.Sum(x => x.Quantity);
                    var totalDelivered = g.Where(x => x.Status == DeliveryTrackingStatus.Delivered).Sum(x => x.Quantity);
                    
                    return new DeliveryByEquipmentTypeModel
                    {
                        EquipmentType = g.Key,
                        TotalOrdered = totalOrdered,
                        TotalDelivered = totalDelivered,
                        DeliveryRate = totalOrdered > 0 
                            ? Math.Round((decimal)totalDelivered / totalOrdered * 100, 2) 
                            : 0,
                        ProvinceDistribution = g
                            .GroupBy(d => d.Province)
                            .Select(pg => {
                                var ordered = pg.Sum(x => x.Quantity);
                                var delivered = pg.Where(x => x.Status == DeliveryTrackingStatus.Delivered).Sum(x => x.Quantity);
                                return new ProvinceDistributionModel
                                {
                                    Province = pg.Key,
                                    Ordered = ordered,
                                    Delivered = delivered,
                                    Percentage = ordered > 0 ? Math.Round((decimal)delivered / ordered * 100, 1) : 0
                                };
                            })
                            .OrderBy(p => p.Province)
                            .ToList(),
                        ItemBreakdown = g
                            .GroupBy(d => d.ItemDescription)
                            .Select(ig => new ItemBreakdownModel
                            {
                                ItemType = ig.Key,
                                Quantity = ig.Sum(x => x.Quantity),
                                Value = ig.Sum(x => x.Sale != null ? x.Sale.Total : 0)
                            })
                            .ToList()
                    };
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

        public async Task<AllEquipmentOrderStats> GetAllEquipmentOrderStats()
        {
            // Get all sales with their items and inventory
            var saleItems = await _context.SaleItems
                .Include(si => si.Sale)
                .Include(si => si.InventoryItem)
                .Where(si => !si.IsDeleted && si.Sale != null && !si.Sale.IsDeleted)
                .ToListAsync();

            // Get all deliveries
            var deliveries = await _context.Deliveries
                .Where(d => !d.IsDeleted && d.Status == DeliveryTrackingStatus.Delivered)
                .ToListAsync();

            // Group by inventory item (equipment type)
            var equipmentStats = saleItems
                .Where(si => si.InventoryItem != null)
                .GroupBy(si => new { 
                    Name = si.InventoryItem!.Name, 
                    Category = si.InventoryItem.Category.ToString() 
                })
                .Select(g => {
                    var itemName = g.Key.Name;
                    var totalOrdered = g.Sum(si => si.Quantity);
                    var totalOrderValue = g.Sum(si => si.TotalPrice);
                    
                    // Find matching deliveries by item description
                    var matchingDeliveries = deliveries
                        .Where(d => d.ItemDescription.Contains(itemName, StringComparison.OrdinalIgnoreCase))
                        .ToList();
                    
                    var totalDelivered = matchingDeliveries.Sum(d => d.Quantity);
                    var deliveredValue = matchingDeliveries.Sum(d => d.Quantity * (totalOrderValue / (totalOrdered > 0 ? totalOrdered : 1)));
                    
                    // Province breakdown from sales (using CustomerName as proxy for institution)
                    var provinceBreakdown = g
                        .Where(si => si.Sale != null)
                        .GroupBy(si => ExtractProvince(si.Sale!.CustomerName))
                        .Select(pg => {
                            var ordered = pg.Sum(si => si.Quantity);
                            var provinceDeliveries = matchingDeliveries
                                .Where(d => d.Province.Equals(pg.Key, StringComparison.OrdinalIgnoreCase))
                                .Sum(d => d.Quantity);
                            
                            return new OrderProvinceBreakdown
                            {
                                Province = pg.Key,
                                Ordered = ordered,
                                Delivered = provinceDeliveries,
                                Percentage = ordered > 0 ? Math.Round((decimal)provinceDeliveries / ordered * 100, 1) : 0,
                                OrderValue = pg.Sum(si => si.TotalPrice)
                            };
                        })
                        .OrderBy(p => p.Province)
                        .ToList();
                    
                    return new OrderDeliveryStatsModel
                    {
                        EquipmentType = itemName,
                        Category = g.Key.Category,
                        TotalOrdered = totalOrdered,
                        TotalDelivered = totalDelivered,
                        PendingDelivery = totalOrdered - totalDelivered,
                        DeliveryRate = totalOrdered > 0 ? Math.Round((decimal)totalDelivered / totalOrdered * 100, 2) : 0,
                        TotalOrderValue = totalOrderValue,
                        DeliveredValue = deliveredValue,
                        ProvinceDistribution = provinceBreakdown
                    };
                })
                .OrderBy(e => e.Category)
                .ThenBy(e => e.EquipmentType)
                .ToList();

            var totalItemsOrdered = equipmentStats.Sum(e => e.TotalOrdered);
            var totalItemsDelivered = equipmentStats.Sum(e => e.TotalDelivered);

            return new AllEquipmentOrderStats
            {
                TotalEquipmentTypes = equipmentStats.Count,
                TotalItemsOrdered = totalItemsOrdered,
                TotalItemsDelivered = totalItemsDelivered,
                OverallDeliveryRate = totalItemsOrdered > 0 
                    ? Math.Round((decimal)totalItemsDelivered / totalItemsOrdered * 100, 2) 
                    : 0,
                TotalOrderValue = equipmentStats.Sum(e => e.TotalOrderValue),
                EquipmentBreakdown = equipmentStats
            };
        }

        private static string ExtractProvince(string customerName)
        {
            // Try to extract province from customer name
            var provinces = new[] { "Gauteng", "KwaZulu-Natal", "Western Cape", "Eastern Cape", 
                                   "Limpopo", "Mpumalanga", "North West", "Free State", "Northern Cape" };
            
            foreach (var province in provinces)
            {
                if (customerName.Contains(province, StringComparison.OrdinalIgnoreCase))
                    return province;
            }
            
            return "Unknown";
        }
    }
}
