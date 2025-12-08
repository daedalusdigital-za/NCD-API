using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IEntity;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.UnitOfWork;
using Microsoft.EntityFrameworkCore;

namespace MH.Application.Service
{
    public class TrainingSessionService : ITrainingSessionService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly ICurrentUser _currentUser;

        public TrainingSessionService(
            IUnitOfWork unitOfWork,
            IMapper mapper,
            ICurrentUser currentUser)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _currentUser = currentUser;
        }

        public async Task Add(TrainingSessionModel model)
        {
            var entity = _mapper.Map<TrainingSession>(model);
            
            // ✅ Handle audit fields safely when no authentication
            try
            {
                entity.CreatedBy = _currentUser.User.Id;
            }
            catch
            {
                // No authentication - use default value
                entity.CreatedBy = 1; // System user
            }
            entity.DateCreated = DateTime.Now;
            
            await _unitOfWork.TrainingSessionRepository.Insert(entity);
            await _unitOfWork.CommitAsync(); // ✅ Commit the transaction
        }

        public async Task<TrainingSessionViewModel> Update(TrainingSessionModel model)
        {
            var existingEntity = await _unitOfWork.TrainingSessionRepository.GetById(model.Id.Value);
            if (existingEntity == null)
                throw new ArgumentException("Training session not found");

            // ✅ Add debugging before update
            Console.WriteLine($"[SERVICE UPDATE] Before mapping - Entity TrainerId: {existingEntity.TrainerId}, ProvinceId: {existingEntity.ProvinceId}");
            Console.WriteLine($"[SERVICE UPDATE] Model data - TrainerId: {model.TrainerId}, ProvinceId: {model.ProvinceId}");
            
            // ✅ Only update fields that are provided (non-null/non-empty)
            if (model.TrainerId > 0)
                existingEntity.TrainerId = model.TrainerId;
            if (model.ProvinceId > 0)
                existingEntity.ProvinceId = model.ProvinceId;
            if (!string.IsNullOrEmpty(model.TrainingName))
                existingEntity.TrainingName = model.TrainingName;
            if (!string.IsNullOrEmpty(model.TrainingType))
                existingEntity.TrainingType = model.TrainingType;
            if (!string.IsNullOrEmpty(model.Venue))
                existingEntity.Venue = model.Venue;
            if (!string.IsNullOrEmpty(model.TargetAudience))
                existingEntity.TargetAudience = model.TargetAudience;
            if (model.NumberOfParticipants > 0)
                existingEntity.NumberOfParticipants = model.NumberOfParticipants;
            if (model.Status > 0)
                existingEntity.Status = model.Status;
            if (model.StartDate != DateTime.MinValue)
                existingEntity.Date = model.StartDate;
            
            // ✅ Handle audit fields safely when no authentication
            try
            {
                existingEntity.UpdatedBy = _currentUser.User.Id;
            }
            catch
            {
                // No authentication - use default value
                existingEntity.UpdatedBy = 1; // System user
            }
            existingEntity.LastUpdated = DateTime.Now;
            
            // ✅ Add debugging after mapping
            Console.WriteLine($"[SERVICE UPDATE] After mapping - Entity TrainerId: {existingEntity.TrainerId}, ProvinceId: {existingEntity.ProvinceId}");
            
            await _unitOfWork.TrainingSessionRepository.Update(existingEntity);
            await _unitOfWork.CommitAsync(); // ✅ This was the missing piece!
            
            Console.WriteLine($"[SERVICE UPDATE] Database update committed for ID: {model.Id}");
            
            // ✅ Return the updated entity as a view model
            var updatedViewModel = _mapper.Map<TrainingSessionViewModel>(existingEntity);
            updatedViewModel.StatusText = existingEntity.Status.ToString();
            updatedViewModel.CreatedByUserName = string.Empty;
            
            return updatedViewModel;
        }

        public async Task Delete(int id)
        {
            var existingEntity = await _unitOfWork.TrainingSessionRepository.GetById(id);
            if (existingEntity == null)
                throw new ArgumentException("Training session not found");

            existingEntity.IsDeleted = true;
            try
            {
                existingEntity.UpdatedBy = _currentUser.User.Id;
            }
            catch
            {
                existingEntity.UpdatedBy = 1; // System user
            }
            existingEntity.LastUpdated = DateTime.Now;
            await _unitOfWork.TrainingSessionRepository.Update(existingEntity);
            await _unitOfWork.CommitAsync(); // ✅ Commit the transaction
        }

        public async Task<TrainingSessionViewModel?> GetById(int id)
        {
            var entity = await _unitOfWork.TrainingSessionRepository.FindBy(
                x => x.Id == id && !x.IsDeleted);  
            
            if (entity == null) return null;

            var viewModel = _mapper.Map<TrainingSessionViewModel>(entity);
            viewModel.StatusText = entity.Status.ToString();
            viewModel.CreatedByUserName = string.Empty;
            
            return viewModel;
        }

        public async Task<List<TrainingSessionViewModel>> GetAll()
        {
            var entities = await _unitOfWork.TrainingSessionRepository.GetAll(
                x => !x.IsDeleted);

            return _mapper.Map<List<TrainingSessionViewModel>>(entities);
        }

        public async Task<List<TrainingSessionViewModel>> GetByProvince(string provinceName)
        {
            var entities = await _unitOfWork.TrainingSessionRepository.GetByProvince(provinceName);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<List<TrainingSessionViewModel>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            var entities = await _unitOfWork.TrainingSessionRepository.GetByDateRange(startDate, endDate);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<List<TrainingSessionViewModel>> GetByTrainer(int trainerId)
        {
            var entities = await _unitOfWork.TrainingSessionRepository.GetByTrainer(trainerId);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<List<TrainingSessionViewModel>> GetByStatus(TrainingStatus status)
        {
            var entities = await _unitOfWork.TrainingSessionRepository.GetByStatus(status);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<TrainingStatsModel> GetTrainingStats()
        {
            var allSessions = await _unitOfWork.TrainingSessionRepository.GetAll(x => !x.IsDeleted);
            
            var stats = new TrainingStatsModel
            {
                TotalSessions = allSessions.Count,
                CompletedSessions = allSessions.Count(x => x.Status == (int)TrainingStatus.Completed),
                InProgressSessions = allSessions.Count(x => x.Status == (int)TrainingStatus.InProgress),
                TotalParticipants = 0 // Field removed from TrainingSession
            };

            stats.CompletionRate = stats.TotalSessions > 0 ? 
                (decimal)stats.CompletedSessions / stats.TotalSessions * 100 : 0;

            // Monthly stats for the last 12 months
            var monthlyStats = allSessions
                .Where(x => x.Date >= DateTime.Now.AddMonths(-12))
                .GroupBy(x => new { x.Date.Year, x.Date.Month })
                .Select(g => new MonthlyTrainingStats
                {
                    Month = $"{g.Key.Year}-{g.Key.Month:00}",
                    Sessions = g.Count(),
                    Participants = 0 // Field removed from TrainingSession
                })
                .OrderBy(x => x.Month)
                .ToList();

            stats.MonthlyStats = monthlyStats;

            // Province stats
            var provinceStats = allSessions
                .GroupBy(x => x.ProvinceId)
                .Select(g => new ProvinceTrainingStats
                {
                    Province = g.Key.ToString(),  // ProvinceId as string for now
                    Sessions = g.Count(),
                    Participants = 0, // Field removed from TrainingSession
                    Trainers = g.Select(x => x.TrainerId).Distinct().Count()
                })
                .ToList();

            stats.ProvinceStats = provinceStats;

            return stats;
        }
    }
}