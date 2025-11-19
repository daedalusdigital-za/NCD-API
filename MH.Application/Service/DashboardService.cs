using MH.Application.IService;
using MH.Domain.IRepository;

namespace MH.Application.Service
{
    public class DashboardService : IDashboardService
    {
        private readonly ITrainingSessionService _trainingService;
        private readonly ISaleService _saleService;
        private readonly IInventoryItemService _inventoryService;
        private readonly ILocationRepository _locationRepository;

        public DashboardService(
            ITrainingSessionService trainingService,
            ISaleService saleService,
            IInventoryItemService inventoryService,
            ILocationRepository locationRepository)
        {
            _trainingService = trainingService;
            _saleService = saleService;
            _inventoryService = inventoryService;
            _locationRepository = locationRepository;
        }

        public async Task<TrainingStatsModel> GetTrainingStats()
        {
            return await _trainingService.GetTrainingStats();
        }

        public async Task<ProvinceStatsModel> GetProvinceStats()
        {
            var provinces = await _locationRepository.GetAllProvinces();
            var trainingStats = await _trainingService.GetTrainingStats();
            var salesData = await _saleService.GetProvincialSalesData();

            var provinceBreakdowns = new List<ProvinceBreakdown>();

            foreach (var province in provinces)
            {
                var provinceTraining = trainingStats.ProvinceStats.FirstOrDefault(x => x.Province == province.Name);
                var provinceSales = salesData.FirstOrDefault(x => x.Province == province.Name);

                provinceBreakdowns.Add(new ProvinceBreakdown
                {
                    Province = province.Name,
                    Sessions = provinceTraining?.Sessions ?? 0,
                    Participants = provinceTraining?.Participants ?? 0,
                    Trainers = provinceTraining?.Trainers ?? 0,
                    Revenue = provinceSales?.Revenue ?? 0,
                    Deliveries = provinceSales?.TotalDelivered ?? 0
                });
            }

            return new ProvinceStatsModel
            {
                ProvinceBreakdowns = provinceBreakdowns
            };
        }

        public async Task<NationalTotalsModel> GetNationalTotals()
        {
            var trainingStats = await _trainingService.GetTrainingStats();
            var salesStats = await _saleService.GetSalesStats();

            return new NationalTotalsModel
            {
                TotalTrainingSessions = trainingStats.TotalSessions,
                TotalTrainers = trainingStats.ProvinceStats.Sum(x => x.Trainers),
                TotalParticipants = trainingStats.TotalParticipants,
                CompletionRate = trainingStats.CompletionRate,
                TotalSales = salesStats.TotalSales,
                TotalRevenue = salesStats.TotalRevenue,
                TotalDeliveries = salesStats.CompletedOrders
            };
        }

        public async Task<EquipmentDistributionModel> GetHGTMeterDistribution()
        {
            // This would typically come from actual equipment distribution data
            // For now, creating sample data structure
            var salesData = await _saleService.GetProvincialSalesData();

            var provinceDistribution = salesData.Select(x => new ProvinceDistribution
            {
                Province = x.Province,
                Ordered = x.TotalOrdered,
                Delivered = x.TotalDelivered,
                Percentage = x.TotalOrdered > 0 ? (decimal)x.TotalDelivered / x.TotalOrdered * 100 : 0
            }).ToList();

            return new EquipmentDistributionModel
            {
                EquipmentType = "HGT Meters",
                TotalOrdered = provinceDistribution.Sum(x => x.Ordered),
                TotalDelivered = provinceDistribution.Sum(x => x.Delivered),
                DeliveryRate = provinceDistribution.Sum(x => x.Ordered) > 0 ? 
                    (decimal)provinceDistribution.Sum(x => x.Delivered) / provinceDistribution.Sum(x => x.Ordered) * 100 : 0,
                ProvinceDistribution = provinceDistribution,
                ItemBreakdown = new List<ItemBreakdown>
                {
                    new ItemBreakdown { ItemType = "Standard HGT Meters", Quantity = 500, Value = 25000 },
                    new ItemBreakdown { ItemType = "Advanced HGT Meters", Quantity = 200, Value = 15000 }
                }
            };
        }

        public async Task<EquipmentDistributionModel> GetHGTStripDistribution()
        {
            var salesData = await _saleService.GetProvincialSalesData();

            var provinceDistribution = salesData.Select(x => new ProvinceDistribution
            {
                Province = x.Province,
                Ordered = x.TotalOrdered * 50, // Assume 50 strips per meter order
                Delivered = x.TotalDelivered * 50,
                Percentage = x.TotalOrdered > 0 ? (decimal)x.TotalDelivered / x.TotalOrdered * 100 : 0
            }).ToList();

            return new EquipmentDistributionModel
            {
                EquipmentType = "HGT Strips",
                TotalOrdered = provinceDistribution.Sum(x => x.Ordered),
                TotalDelivered = provinceDistribution.Sum(x => x.Delivered),
                DeliveryRate = provinceDistribution.Sum(x => x.Ordered) > 0 ? 
                    (decimal)provinceDistribution.Sum(x => x.Delivered) / provinceDistribution.Sum(x => x.Ordered) * 100 : 0,
                ProvinceDistribution = provinceDistribution,
                ItemBreakdown = new List<ItemBreakdown>
                {
                    new ItemBreakdown { ItemType = "Standard Test Strips", Quantity = 25000, Value = 125000 },
                    new ItemBreakdown { ItemType = "Quality Control Strips", Quantity = 10000, Value = 75000 }
                }
            };
        }

        public async Task<EquipmentStatsModel> GetEquipmentStats()
        {
            var hgtMeterDist = await GetHGTMeterDistribution();
            var hgtStripDist = await GetHGTStripDistribution();

            return new EquipmentStatsModel
            {
                Distributions = new List<EquipmentDistributionModel> { hgtMeterDist, hgtStripDist }
            };
        }

        public async Task<OccupationStatsModel> GetOccupationStats()
        {
            // This would typically come from user profile data or training registration data
            // For now, creating sample data based on typical healthcare occupations
            return new OccupationStatsModel
            {
                Occupations = new List<OccupationBreakdown>
                {
                    new OccupationBreakdown { Occupation = "Nurses", Count = 450, Percentage = 35.5m },
                    new OccupationBreakdown { Occupation = "Community Health Workers", Count = 380, Percentage = 30.0m },
                    new OccupationBreakdown { Occupation = "Doctors", Count = 200, Percentage = 15.8m },
                    new OccupationBreakdown { Occupation = "Pharmacists", Count = 120, Percentage = 9.5m },
                    new OccupationBreakdown { Occupation = "Laboratory Technicians", Count = 75, Percentage = 5.9m },
                    new OccupationBreakdown { Occupation = "Other Healthcare Workers", Count = 42, Percentage = 3.3m }
                }
            };
        }
    }
}