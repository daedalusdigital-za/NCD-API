using MH.Domain.DBModel;

namespace MH.Domain.IRepository
{
    public interface ITrainingDocumentRepository : IRepository<TrainingDocument, int>
    {
        Task<List<TrainingDocument>> GetByTrainingSessionId(int trainingSessionId);
        Task<TrainingDocument?> GetById(int id);
    }
}
