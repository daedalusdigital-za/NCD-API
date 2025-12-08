using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IEntity;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using Microsoft.EntityFrameworkCore;

namespace MH.Application.Service
{
    public class TrainingSessionService : ITrainingSessionService
    {
        private readonly ITrainingSessionRepository _trainingSessionRepository;
        private readonly ITrainerRepository _trainerRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUser _currentUser;

        public TrainingSessionService(
            ITrainingSessionRepository trainingSessionRepository,
            ITrainerRepository trainerRepository,
            IMapper mapper,
            ICurrentUser currentUser)
        {
            _trainingSessionRepository = trainingSessionRepository;
            _trainerRepository = trainerRepository;
            _mapper = mapper;
            _currentUser = currentUser;
        }

        public async Task Add(TrainingSessionModel model)
        {
            var entity = _mapper.Map<TrainingSession>(model);
            entity.CreatedBy = _currentUser.User.Id;
            entity.DateCreated = DateTime.Now;
            await _trainingSessionRepository.Insert(entity);
        }

        public async Task<TrainingSessionViewModel> Update(TrainingSessionModel model)
        {
            var existingEntity = await _trainingSessionRepository.GetById(model.Id.Value);
            if (existingEntity == null)
                throw new ArgumentException("Training session not found");

            // ✅ Add debugging before update
            Console.WriteLine($"[SERVICE UPDATE] Before mapping - Entity TrainerId: {existingEntity.TrainerId}, ProvinceId: {existingEntity.ProvinceId}");
            Console.WriteLine($"[SERVICE UPDATE] Model data - TrainerId: {model.TrainerId}, ProvinceId: {model.ProvinceId}");
            
            // Map the model to the existing entity
            _mapper.Map(model, existingEntity);
            
            // ✅ Explicitly ensure critical fields are updated (in case AutoMapper fails)
            existingEntity.TrainerId = model.TrainerId;
            existingEntity.ProvinceId = model.ProvinceId;
            existingEntity.TrainingName = model.TrainingName;
            existingEntity.TrainingType = model.TrainingType;
            existingEntity.Venue = model.Venue;
            existingEntity.TargetAudience = model.TargetAudience;
            existingEntity.NumberOfParticipants = model.NumberOfParticipants;
            existingEntity.Status = model.Status;
            existingEntity.Date = model.StartDate;
            
            // Set audit fields
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            
            // ✅ Add debugging after mapping
            Console.WriteLine($"[SERVICE UPDATE] After mapping - Entity TrainerId: {existingEntity.TrainerId}, ProvinceId: {existingEntity.ProvinceId}");
            
            await _trainingSessionRepository.Update(existingEntity);
            
            Console.WriteLine($"[SERVICE UPDATE] Database update completed for ID: {model.Id}");
            
            // ✅ Return the updated entity as a view model
            var updatedViewModel = _mapper.Map<TrainingSessionViewModel>(existingEntity);
            updatedViewModel.StatusText = existingEntity.Status.ToString();
            updatedViewModel.CreatedByUserName = string.Empty;
            
            return updatedViewModel;
        }

        public async Task Delete(int id)
        {
            var existingEntity = await _trainingSessionRepository.GetById(id);
            if (existingEntity == null)
                throw new ArgumentException("Training session not found");

            existingEntity.IsDeleted = true;
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            await _trainingSessionRepository.Update(existingEntity);
        }

        public async Task<TrainingSessionViewModel?> GetById(int id)
        {
            var entity = await _trainingSessionRepository.FindBy(
                x => x.Id == id && !x.IsDeleted);  
            
            if (entity == null) return null;

            var viewModel = _mapper.Map<TrainingSessionViewModel>(entity);
            viewModel.StatusText = entity.Status.ToString();
            viewModel.CreatedByUserName = string.Empty;
            
            return viewModel;
        }

        public async Task<List<TrainingSessionViewModel>> GetAll()
        {
            var entities = await _trainingSessionRepository.GetAll(
                x => !x.IsDeleted);

            return _mapper.Map<List<TrainingSessionViewModel>>(entities);
        }

        public async Task<List<TrainingSessionViewModel>> GetByProvince(string provinceName)
        {
            var entities = await _trainingSessionRepository.GetByProvince(provinceName);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<List<TrainingSessionViewModel>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            var entities = await _trainingSessionRepository.GetByDateRange(startDate, endDate);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<List<TrainingSessionViewModel>> GetByTrainer(int trainerId)
        {
            var entities = await _trainingSessionRepository.GetByTrainer(trainerId);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<List<TrainingSessionViewModel>> GetByStatus(TrainingStatus status)
        {
            var entities = await _trainingSessionRepository.GetByStatus(status);
            return _mapper.Map<List<TrainingSessionViewModel>>(entities.Where(x => !x.IsDeleted));
        }

        public async Task<TrainingStatsModel> GetTrainingStats()
        {
            var allSessions = await _trainingSessionRepository.GetAll(x => !x.IsDeleted);
            
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