using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Domain.IRepository
{
    public interface ISaleRepository : IRepository<Sale, int>
    {
        Task<IReadOnlyList<Sale>> GetByDateRange(DateTime startDate, DateTime endDate);
        Task<IReadOnlyList<Sale>> GetByProvince(string province);
        Task<IReadOnlyList<Sale>> GetByPaymentStatus(PaymentStatus status);
        Task<IReadOnlyList<Sale>> GetByDeliveryStatus(DeliveryStatus status);
        Task<Sale?> GetBySaleNumber(string saleNumber);
        Task<bool> IsSaleNumberExists(string saleNumber, int? excludeId = null);
        Task<SalesStatsModel> GetSalesStats();
        Task<SalesStatsModel> GetSalesStatsByDateRange(DateTime startDate, DateTime endDate);
        Task<List<ProvincialSalesData>> GetProvincialSalesData();
        Task<List<TopProductModel>> GetTopProducts(int limit = 10);
        Task<List<Sale>> GetRecentSales(int limit = 10);
    }

    public class SalesStatsModel
    {
        public int TotalSales { get; set; }
        public decimal MonthlyRevenue { get; set; }
        public decimal TotalRevenue { get; set; }
        public decimal AverageOrderValue { get; set; }
        public int PendingOrders { get; set; }
        public int CompletedOrders { get; set; }
    }

    public class ProvincialSalesData
    {
        public string Province { get; set; } = null!;
        public int TotalOrdered { get; set; }
        public int TotalDelivered { get; set; }
        public decimal Revenue { get; set; }
        public int OrderCount { get; set; }
        public decimal DeliveryRate { get; set; }
    }

    public class TopProductModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public int QuantitySold { get; set; }
        public decimal Revenue { get; set; }
        public int OrderCount { get; set; }
    }
}