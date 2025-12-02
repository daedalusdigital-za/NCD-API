using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Domain.UnitOfWork
{
    public interface IUnitOfWork
    {
        #region Repositories
        IPositionRepository PositionRepository { get; }
        IPriorityRepository PriorityRepository { get; }
        IContactDetailsRepository ContactDetailsRepository { get; }
        IUserProfileRepository UserProfileRepository { get; }
        ITrainerRepository TrainerRepository { get; }
        ITrainingSessionRepository TrainingSessionRepository { get; }
        ITrainingDocumentRepository TrainingDocumentRepository { get; }
        #endregion
        void ClearChangeTracker();
        void Commit();
        void Rollback();
        Task CommitAsync();
        Task RollbackAsync();
    }
}
