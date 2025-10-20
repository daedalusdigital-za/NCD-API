using MH.Application.IService;
using MH.Domain.IRepository;

namespace MH.Application.IService
{
    public interface IDashboardService
    {
        Task<TrainingStatsModel> GetTrainingStats();
        Task<ProvinceStatsModel> GetProvinceStats();
        Task<NationalTotalsModel> GetNationalTotals();
        Task<EquipmentDistributionModel> GetHGTMeterDistribution();
        Task<EquipmentDistributionModel> GetHGTStripDistribution();
        Task<EquipmentStatsModel> GetEquipmentStats();
        Task<OccupationStatsModel> GetOccupationStats();
    }

    public class ProvinceStatsModel
    {
        public List<ProvinceBreakdown> ProvinceBreakdowns { get; set; } = new List<ProvinceBreakdown>();
    }

    public class ProvinceBreakdown
    {
        public string Province { get; set; } = null!;
        public int Sessions { get; set; }
        public int Participants { get; set; }
        public int Trainers { get; set; }
        public decimal Revenue { get; set; }
        public int Deliveries { get; set; }
    }

    public class NationalTotalsModel
    {
        public int TotalTrainingSessions { get; set; }
        public int TotalTrainers { get; set; }
        public int TotalParticipants { get; set; }
        public decimal CompletionRate { get; set; }
        public int TotalSales { get; set; }
        public decimal TotalRevenue { get; set; }
        public int TotalDeliveries { get; set; }
    }

    public class EquipmentDistributionModel
    {
        public string EquipmentType { get; set; } = null!;
        public int TotalOrdered { get; set; }
        public int TotalDelivered { get; set; }
        public decimal DeliveryRate { get; set; }
        public List<ProvinceDistribution> ProvinceDistribution { get; set; } = new List<ProvinceDistribution>();
        public List<ItemBreakdown> ItemBreakdown { get; set; } = new List<ItemBreakdown>();
    }

    public class ProvinceDistribution
    {
        public string Province { get; set; } = null!;
        public int Ordered { get; set; }
        public int Delivered { get; set; }
        public decimal Percentage { get; set; }
    }

    public class ItemBreakdown
    {
        public string ItemType { get; set; } = null!;
        public int Quantity { get; set; }
        public decimal Value { get; set; }
    }

    public class EquipmentStatsModel
    {
        public List<EquipmentDistributionModel> Distributions { get; set; } = new List<EquipmentDistributionModel>();
    }

    public class OccupationStatsModel
    {
        public List<OccupationBreakdown> Occupations { get; set; } = new List<OccupationBreakdown>();
    }

    public class OccupationBreakdown
    {
        public string Occupation { get; set; } = null!;
        public int Count { get; set; }
        public decimal Percentage { get; set; }
    }
}