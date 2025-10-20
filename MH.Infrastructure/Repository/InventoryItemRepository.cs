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
                .Where(x => x.QtyOnHand <= x.ReorderLevel && !x.IsDeleted)
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

        public async Task<InventoryItem?> GetByItemNumber(string itemNumber)
        {
            return await _context.InventoryItems
                .FirstOrDefaultAsync(x => x.ItemNumber == itemNumber && !x.IsDeleted);
        }

        public async Task<bool> IsItemNumberExists(string itemNumber, int? excludeId = null)
        {
            var query = _context.InventoryItems.Where(x => x.ItemNumber == itemNumber && !x.IsDeleted);
            
            if (excludeId.HasValue)
            {
                query = query.Where(x => x.Id != excludeId.Value);
            }
            
            return await query.AnyAsync();
        }

        public async Task UpdateStock(int id, int qtyOnHand, int qtyOnPO, int qtyOnSO, decimal unitCost)
        {
            var item = await _context.InventoryItems.FindAsync(id);
            if (item != null)
            {
                item.QtyOnHand = qtyOnHand;
                item.QtyOnPO = qtyOnPO;
                item.QtyOnSO = qtyOnSO;
                item.StockAvailable = qtyOnHand + qtyOnPO - qtyOnSO;
                item.UnitCostForQOH = unitCost;
                item.TotalCostForQOH = qtyOnHand * unitCost;
                item.LastRestocked = DateTime.Now;
                item.LastUpdated = DateTime.Now;

                // Update status based on stock levels
                if (item.StockAvailable <= 0)
                    item.Status = InventoryStatus.OutOfStock;
                else if (item.StockAvailable <= item.ReorderLevel)
                    item.Status = InventoryStatus.LowStock;
                else
                    item.Status = InventoryStatus.InStock;

                await _context.SaveChangesAsync();
            }
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
                TotalValue = allItems.Sum(x => x.TotalCostForQOH)
            };

            // Category statistics
            var categoryStats = allItems
                .GroupBy(x => x.Category)
                .Select(g => new CategoryStatsModel
                {
                    Category = g.Key,
                    CategoryName = g.Key.ToString(),
                    ItemCount = g.Count(),
                    TotalValue = g.Sum(x => x.TotalCostForQOH)
                })
                .ToList();

            stats.CategoryStats = categoryStats;

            return stats;
        }
    }
}