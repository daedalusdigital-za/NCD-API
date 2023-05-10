using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.UnitOfWork;
using MH.Infrastructure.DBContext;
using MH.Infrastructure.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MH.Infrastructure.UnitOfWork
{
    public class UnitOfWork : BaseUnitOfWork, IUnitOfWork
    {
        private readonly ApplicationDbContext _dbContext;

        public UnitOfWork(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }
        #region Repositories

        private IOtpRepository _otpRepository;
        public IOtpRepository OtpRepository => _otpRepository ?? new OtpRepository(_dbContext);

        private IAppointmentRepository _appointmentRepository;
        public IAppointmentRepository AppointmentRepository => _appointmentRepository ?? new AppointmentRepository(_dbContext);

        private IMedicalHistoryRepository _medicalHistoryRepository;
        public IMedicalHistoryRepository MedicalHistoryRepository => _medicalHistoryRepository ?? new MedicalHistoryRepository(_dbContext);

        private IPatientRepository _patientRepository;
        public IPatientRepository PatientRepository => _patientRepository ?? new PatientRepository(_dbContext);

        private IContactDetailsRepository _contactDetailsRepository;
        public IContactDetailsRepository ContactDetailsRepository => _contactDetailsRepository ?? new ContactDetailsRepository(_dbContext);

        private IPositionRepository _positionRepository;
        public IPositionRepository PositionRepository => _positionRepository ?? new PositionRepository(_dbContext);
        private IUserProfileRepository _userProfileRepository;
        public IUserProfileRepository UserProfileRepository => _userProfileRepository ?? new UserProfileRepository(_dbContext);
        #endregion
    }
}
