using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Domain.IRepository
{
    public interface ITrainerRepository : IRepository<Trainer, int>
    {
        Task<IReadOnlyList<Trainer>> GetByProvince(string province);
        Task<IReadOnlyList<Trainer>> GetByStatus(TrainerStatus status);
        Task<Trainer?> GetByEmail(string email);
        Task<bool> IsEmailExists(string email, int? excludeId = null);
        Task<TrainerStatsModel> GetTrainerStats(int trainerId);
    }

    public class TrainerStatsModel
    {
        public int TotalSessions { get; set; }
        public int CompletedSessions { get; set; }
        public int TotalParticipants { get; set; }
        public decimal CompletionRate { get; set; }
        public DateTime? LastSessionDate { get; set; }
    }
}