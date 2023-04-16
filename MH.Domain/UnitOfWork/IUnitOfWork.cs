using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Domain.UnitOfWork
{
    public interface IUnitOfWork
    {
        #region Repositories
        IPositionRepository PositionRepository { get; }
        IAppointmentRepository AppointmentRepository { get; }
        IMedicalHistoryRepository MedicalHistoryRepository { get; }
        IPatientRepository PatientRepository { get; }
        IContactDetailsRepository ContactDetailsRepository { get; }
        IUserProfileRepository UserProfileRepository { get; }
        #endregion
        void ClearChangeTracker();
        void Commit();
        void Rollback();
        Task CommitAsync();
        Task RollbackAsync();
    }
}
