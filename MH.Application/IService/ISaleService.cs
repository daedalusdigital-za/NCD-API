using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Application.IService
{
    public interface ISaleService
    {
        Task Add(SaleModel model);
        Task Update(SaleModel model);
        Task Delete(int id);
        Task<SaleViewModel?> GetById(int id);
        Task<List<SaleViewModel>> GetAll();
        Task<List<SaleViewModel>> GetByDateRange(DateTime startDate, DateTime endDate);
        Task<List<SaleViewModel>> GetByProvince(string province);
        Task<SalesStatsModel> GetSalesStats();
        Task<List<ProvincialSalesData>> GetProvincialSalesData();
        Task<List<TopProductModel>> GetTopProducts(int limit = 10);
        Task<List<SaleViewModel>> GetRecentSales(int limit = 10);
        Task<bool> IsSaleNumberExists(string saleNumber, int? excludeId = null);
        Task<string> GenerateSaleNumber();
    }
}