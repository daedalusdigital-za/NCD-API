using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class InventoryItemRepository : Repository<InventoryItem, int>, IInventoryItemRepository
    {
        private readonly ApplicationDbContext _context;

        public InventoryItemRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IReadOnlyList<InventoryItem>> GetByCategory(InventoryCategory category)
        {
            return await _context.InventoryItems
                .Where(x => x.Category == category && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<InventoryItem>> GetLowStock()
        {
            return await _context.InventoryItems
                .Where(x => x.StockAvailable <= x.ReorderLevel && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<InventoryItem>> GetByStatus(InventoryStatus status)
        {
            return await _context.InventoryItems
                .Where(x => x.Status == status && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<bool> IsItemNumberExists(string itemNumber, int? excludeId = null)
        {
            var query = _context.InventoryItems.Where(x => x.SKU == itemNumber && !x.IsDeleted);
            
            if (excludeId.HasValue)
            {
                query = query.Where(x => x.Id != excludeId.Value);
            }
            
            return await query.AnyAsync();
        }

        public async Task<InventoryStatsModel> GetInventoryStats()
        {
            var allItems = await _context.InventoryItems
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            var stats = new InventoryStatsModel
            {
                TotalItems = allItems.Count,
                InStockItems = allItems.Count(x => x.Status == InventoryStatus.InStock),
                LowStockItems = allItems.Count(x => x.Status == InventoryStatus.LowStock),
                OutOfStockItems = allItems.Count(x => x.Status == InventoryStatus.OutOfStock),
                TotalValue = allItems.Sum(x => x.UnitPrice * x.StockAvailable)
            };

            // Category statistics
            var categoryStats = allItems
                .GroupBy(x => x.Category)
                .Select(g => new CategoryStatsModel
                {
                    Category = g.Key,
                    CategoryName = g.Key.ToString(),
                    ItemCount = g.Count(),
                    TotalValue = g.Sum(x => x.UnitPrice * x.StockAvailable)
                })
                .ToList();

            stats.CategoryStats = categoryStats;

            return stats;
        }
    }
}
