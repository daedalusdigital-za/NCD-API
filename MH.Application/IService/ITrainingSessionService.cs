using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;

namespace MH.Application.IService
{
    public interface ITrainingSessionService
    {
        Task Add(TrainingSessionModel model);
        Task Update(TrainingSessionModel model);
        Task Delete(int id);
        Task<TrainingSessionViewModel?> GetById(int id);
        Task<List<TrainingSessionViewModel>> GetAll();
        Task<List<TrainingSessionViewModel>> GetByProvince(string province);
        Task<List<TrainingSessionViewModel>> GetByDateRange(DateTime startDate, DateTime endDate);
        Task<List<TrainingSessionViewModel>> GetByTrainer(int trainerId);
        Task<List<TrainingSessionViewModel>> GetByStatus(TrainingStatus status);
        Task<TrainingStatsModel> GetTrainingStats();
    }

    public class TrainingStatsModel
    {
        public int TotalSessions { get; set; }
        public int CompletedSessions { get; set; }
        public int InProgressSessions { get; set; }
        public int TotalParticipants { get; set; }
        public decimal CompletionRate { get; set; }
        public List<MonthlyTrainingStats> MonthlyStats { get; set; } = new List<MonthlyTrainingStats>();
        public List<ProvinceTrainingStats> ProvinceStats { get; set; } = new List<ProvinceTrainingStats>();
    }

    public class MonthlyTrainingStats
    {
        public string Month { get; set; } = null!;
        public int Sessions { get; set; }
        public int Participants { get; set; }
    }

    public class ProvinceTrainingStats
    {
        public string Province { get; set; } = null!;
        public int Sessions { get; set; }
        public int Participants { get; set; }
        public int Trainers { get; set; }
    }
}