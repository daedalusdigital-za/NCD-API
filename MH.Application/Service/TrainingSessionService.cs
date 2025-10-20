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

        public async Task Update(TrainingSessionModel model)
        {
            var existingEntity = await _trainingSessionRepository.GetById(model.Id.Value);
            if (existingEntity == null)
                throw new ArgumentException("Training session not found");

            _mapper.Map(model, existingEntity);
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            await _trainingSessionRepository.Update(existingEntity);
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
                x => x.Id == id && !x.IsDeleted,
                x => x.Trainer, x => x.CreatedByUser);
            
            if (entity == null) return null;

            var viewModel = _mapper.Map<TrainingSessionViewModel>(entity);
            viewModel.TrainerName = entity.Trainer?.Name;
            viewModel.StatusText = entity.Status.ToString();
            viewModel.CreatedByUserName = entity.CreatedByUser?.UserProfile?.FirstName + " " + entity.CreatedByUser?.UserProfile?.LastName;
            
            return viewModel;
        }

        public async Task<List<TrainingSessionViewModel>> GetAll()
        {
            var entities = await _trainingSessionRepository.GetAll(
                x => !x.IsDeleted,
                x => x.Trainer, x => x.CreatedByUser);

            return _mapper.Map<List<TrainingSessionViewModel>>(entities);
        }

        public async Task<List<TrainingSessionViewModel>> GetByProvince(string province)
        {
            var entities = await _trainingSessionRepository.GetByProvince(province);
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
                CompletedSessions = allSessions.Count(x => x.Status == TrainingStatus.Completed),
                InProgressSessions = allSessions.Count(x => x.Status == TrainingStatus.InProgress),
                TotalParticipants = allSessions.Sum(x => x.NumberOfParticipants)
            };

            stats.CompletionRate = stats.TotalSessions > 0 ? 
                (decimal)stats.CompletedSessions / stats.TotalSessions * 100 : 0;

            // Monthly stats for the last 12 months
            var monthlyStats = allSessions
                .Where(x => x.StartDate >= DateTime.Now.AddMonths(-12))
                .GroupBy(x => new { x.StartDate.Year, x.StartDate.Month })
                .Select(g => new MonthlyTrainingStats
                {
                    Month = $"{g.Key.Year}-{g.Key.Month:00}",
                    Sessions = g.Count(),
                    Participants = g.Sum(x => x.NumberOfParticipants)
                })
                .OrderBy(x => x.Month)
                .ToList();

            stats.MonthlyStats = monthlyStats;

            // Province stats
            var provinceStats = allSessions
                .GroupBy(x => x.Province)
                .Select(g => new ProvinceTrainingStats
                {
                    Province = g.Key,
                    Sessions = g.Count(),
                    Participants = g.Sum(x => x.NumberOfParticipants),
                    Trainers = g.Select(x => x.TrainerId).Distinct().Count()
                })
                .ToList();

            stats.ProvinceStats = provinceStats;

            return stats;
        }
    }
}