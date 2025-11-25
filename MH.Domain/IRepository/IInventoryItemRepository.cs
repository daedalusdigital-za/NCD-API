using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Domain.IRepository
{
    public interface IInventoryItemRepository : IRepository<InventoryItem, int>
    {
        Task<IReadOnlyList<InventoryItem>> GetByCategory(InventoryCategory category);
        Task<IReadOnlyList<InventoryItem>> GetLowStock();
        Task<IReadOnlyList<InventoryItem>> GetByStatus(InventoryStatus status);
        Task<bool> IsItemNumberExists(string itemNumber, int? excludeId = null);
        Task<InventoryStatsModel> GetInventoryStats();
    }

    public class InventoryStatsModel
    {
        public int TotalItems { get; set; }
        public int InStockItems { get; set; }
        public int LowStockItems { get; set; }
        public int OutOfStockItems { get; set; }
        public decimal TotalValue { get; set; }
        public List<CategoryStatsModel> CategoryStats { get; set; } = new List<CategoryStatsModel>();
    }

    public class CategoryStatsModel
    {
        public InventoryCategory Category { get; set; }
        public string CategoryName { get; set; } = null!;
        public int ItemCount { get; set; }
        public decimal TotalValue { get; set; }
    }
}