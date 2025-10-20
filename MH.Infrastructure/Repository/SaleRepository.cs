using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class SaleRepository : Repository<Sale, int>, ISaleRepository
    {
        private readonly ApplicationDbContext _context;

        public SaleRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IReadOnlyList<Sale>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            return await _context.Sales
                .Include(x => x.SaleItems)
                .Where(x => x.SaleDate >= startDate && x.SaleDate <= endDate && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Sale>> GetByProvince(string province)
        {
            return await _context.Sales
                .Include(x => x.SaleItems)
                .Where(x => x.Province == province && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Sale>> GetByPaymentStatus(PaymentStatus status)
        {
            return await _context.Sales
                .Include(x => x.SaleItems)
                .Where(x => x.PaymentStatus == status && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Sale>> GetByDeliveryStatus(DeliveryStatus status)
        {
            return await _context.Sales
                .Include(x => x.SaleItems)
                .Where(x => x.DeliveryStatus == status && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<Sale?> GetBySaleNumber(string saleNumber)
        {
            return await _context.Sales
                .Include(x => x.SaleItems)
                .FirstOrDefaultAsync(x => x.SaleNumber == saleNumber && !x.IsDeleted);
        }

        public async Task<bool> IsSaleNumberExists(string saleNumber, int? excludeId = null)
        {
            var query = _context.Sales.Where(x => x.SaleNumber == saleNumber && !x.IsDeleted);
            
            if (excludeId.HasValue)
            {
                query = query.Where(x => x.Id != excludeId.Value);
            }
            
            return await query.AnyAsync();
        }

        public async Task<SalesStatsModel> GetSalesStats()
        {
            var currentMonth = DateTime.Now;
            var startOfMonth = new DateTime(currentMonth.Year, currentMonth.Month, 1);
            var endOfMonth = startOfMonth.AddMonths(1).AddDays(-1);

            var allSales = await _context.Sales
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            var monthlyRevenue = allSales
                .Where(x => x.SaleDate >= startOfMonth && x.SaleDate <= endOfMonth)
                .Sum(x => x.Total);

            return new SalesStatsModel
            {
                TotalSales = allSales.Count,
                MonthlyRevenue = monthlyRevenue,
                TotalRevenue = allSales.Sum(x => x.Total),
                AverageOrderValue = allSales.Count > 0 ? allSales.Average(x => x.Total) : 0,
                PendingOrders = allSales.Count(x => x.PaymentStatus == PaymentStatus.Pending),
                CompletedOrders = allSales.Count(x => x.PaymentStatus == PaymentStatus.Paid)
            };
        }

        public async Task<SalesStatsModel> GetSalesStatsByDateRange(DateTime startDate, DateTime endDate)
        {
            var sales = await _context.Sales
                .Where(x => x.SaleDate >= startDate && x.SaleDate <= endDate && !x.IsDeleted)
                .ToListAsync();

            return new SalesStatsModel
            {
                TotalSales = sales.Count,
                MonthlyRevenue = sales.Sum(x => x.Total),
                TotalRevenue = sales.Sum(x => x.Total),
                AverageOrderValue = sales.Count > 0 ? sales.Average(x => x.Total) : 0,
                PendingOrders = sales.Count(x => x.PaymentStatus == PaymentStatus.Pending),
                CompletedOrders = sales.Count(x => x.PaymentStatus == PaymentStatus.Paid)
            };
        }

        public async Task<List<ProvincialSalesData>> GetProvincialSalesData()
        {
            var salesByProvince = await _context.Sales
                .Where(x => !x.IsDeleted)
                .GroupBy(x => x.Province)
                .Select(g => new ProvincialSalesData
                {
                    Province = g.Key,
                    TotalOrdered = g.Sum(x => x.SaleItems.Sum(si => si.Quantity)),
                    TotalDelivered = g.Count(x => x.DeliveryStatus == DeliveryStatus.Delivered),
                    Revenue = g.Sum(x => x.Total),
                    OrderCount = g.Count(),
                    DeliveryRate = g.Count() > 0 ? (decimal)g.Count(x => x.DeliveryStatus == DeliveryStatus.Delivered) / g.Count() * 100 : 0
                })
                .ToListAsync();

            return salesByProvince;
        }

        public async Task<List<TopProductModel>> GetTopProducts(int limit = 10)
        {
            var topProducts = await _context.SaleItems
                .Where(x => !x.IsDeleted)
                .GroupBy(x => new { x.ProductId, x.ProductName })
                .Select(g => new TopProductModel
                {
                    ProductId = g.Key.ProductId,
                    ProductName = g.Key.ProductName,
                    QuantitySold = g.Sum(x => x.Quantity),
                    Revenue = g.Sum(x => x.TotalPrice),
                    OrderCount = g.Count()
                })
                .OrderByDescending(x => x.QuantitySold)
                .Take(limit)
                .ToListAsync();

            return topProducts;
        }

        public async Task<List<Sale>> GetRecentSales(int limit = 10)
        {
            return await _context.Sales
                .Include(x => x.SaleItems)
                .Where(x => !x.IsDeleted)
                .OrderByDescending(x => x.DateCreated)
                .Take(limit)
                .AsNoTracking()
                .ToListAsync();
        }
    }
}