using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Domain.IRepository
{
    public interface ITrainingSessionRepository : IRepository<TrainingSession, int>
    {
        Task<IReadOnlyList<TrainingSession>> GetByProvince(string province);
        Task<IReadOnlyList<TrainingSession>> GetByDateRange(DateTime startDate, DateTime endDate);
        Task<IReadOnlyList<TrainingSession>> GetByTrainer(int trainerId);
        Task<IReadOnlyList<TrainingSession>> GetByStatus(TrainingStatus status);
        Task<int> GetTotalParticipantsByTrainer(int trainerId);
        Task<int> GetCompletedSessionsByTrainer(int trainerId);
    }
}