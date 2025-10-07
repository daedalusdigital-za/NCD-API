using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IEntity;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.Service
{
    public class TrainerService : ITrainerService
    {
        private readonly ITrainerRepository _trainerRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUser _currentUser;

        public TrainerService(
            ITrainerRepository trainerRepository,
            IMapper mapper,
            ICurrentUser currentUser)
        {
            _trainerRepository = trainerRepository;
            _mapper = mapper;
            _currentUser = currentUser;
        }

        public async Task Add(TrainerModel model)
        {
            var entity = _mapper.Map<Trainer>(model);
            entity.CreatedBy = _currentUser.User.Id;
            entity.DateCreated = DateTime.Now;
            await _trainerRepository.Insert(entity);
        }

        public async Task Update(TrainerModel model)
        {
            var existingEntity = await _trainerRepository.GetById(model.Id.Value);
            if (existingEntity == null)
                throw new ArgumentException("Trainer not found");

            _mapper.Map(model, existingEntity);
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            await _trainerRepository.Update(existingEntity);
        }

        public async Task Delete(int id)
        {
            var existingEntity = await _trainerRepository.GetById(id);
            if (existingEntity == null)
                throw new ArgumentException("Trainer not found");

            existingEntity.IsDeleted = true;
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;
            await _trainerRepository.Update(existingEntity);
        }

        public async Task<TrainerViewModel?> GetById(int id)
        {
            var entity = await _trainerRepository.FindBy(
                x => x.Id == id && !x.IsDeleted,
                x => x.CreatedByUser);
            
            if (entity == null) return null;

            var viewModel = _mapper.Map<TrainerViewModel>(entity);
            viewModel.StatusText = entity.Status.ToString();
            viewModel.CreatedByUserName = entity.CreatedByUser?.UserProfile?.FirstName + " " + entity.CreatedByUser?.UserProfile?.LastName;
            
            // Get training session counts
            var stats = await _trainerRepository.GetTrainerStats(id);
            viewModel.TotalTrainingSessions = stats.TotalSessions;
            viewModel.CompletedSessions = stats.CompletedSessions;
            
            return viewModel;
        }

        public async Task<List<TrainerViewModel>> GetAll()
        {
            var entities = await _trainerRepository.GetAll(
                x => !x.IsDeleted,
                x => x.CreatedByUser);

            var viewModels = _mapper.Map<List<TrainerViewModel>>(entities);
            
            // Enhance with status text and session counts
            foreach (var vm in viewModels)
            {
                vm.StatusText = ((TrainerStatus)vm.Status).ToString();
                var stats = await _trainerRepository.GetTrainerStats(vm.Id.Value);
                vm.TotalTrainingSessions = stats.TotalSessions;
                vm.CompletedSessions = stats.CompletedSessions;
            }

            return viewModels;
        }

        public async Task<List<TrainerViewModel>> GetByProvince(string province)
        {
            var entities = await _trainerRepository.GetByProvince(province);
            return _mapper.Map<List<TrainerViewModel>>(entities);
        }

        public async Task<List<TrainerViewModel>> GetByStatus(TrainerStatus status)
        {
            var entities = await _trainerRepository.GetByStatus(status);
            return _mapper.Map<List<TrainerViewModel>>(entities);
        }

        public async Task<TrainerStatsModel> GetTrainerStats(int trainerId)
        {
            return await _trainerRepository.GetTrainerStats(trainerId);
        }

        public async Task<bool> IsEmailExists(string email, int? excludeId = null)
        {
            return await _trainerRepository.IsEmailExists(email, excludeId);
        }
    }
}