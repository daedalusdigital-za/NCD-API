using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.UnitOfWork;
using MH.Domain.ViewModel;
using MH.Infrastructure.UnitOfWork;

namespace MH.Application.Service
{
    public class TrainerService : ITrainerService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public TrainerService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<TrainerViewModel?> GetById(int id)
        {
            var trainer = await _unitOfWork.TrainerRepository.FindBy(x => x.Id == id && x.Status == 1);
            if (trainer == null)
                return null;

            return _mapper.Map<TrainerViewModel>(trainer);
        }

        public async Task<List<TrainerViewModel>> GetAll()
        {
            var trainers = await _unitOfWork.TrainerRepository.GetAll(x => x.Status == 1);
            return _mapper.Map<List<TrainerViewModel>>(trainers);
        }

        public async Task Add(TrainerModel model)
        {
            var trainer = _mapper.Map<Trainer>(model);
            trainer.Status = 1;
            trainer.CreatedDate = DateTime.Now;

            await _unitOfWork.TrainerRepository.Insert(trainer);
            await _unitOfWork.CommitAsync();
        }

        public async Task Update(TrainerModel model)
        {
            var trainer = await _unitOfWork.TrainerRepository.FindBy(x => x.Id == model.Id);
            if (trainer == null)
                throw new System.Exception($"Trainer with ID {model.Id} not found");

            trainer.Name = model.Name;
            trainer.Email = model.Email;
            trainer.Phone = model.Phone;
            trainer.Province = model.Province;
            trainer.Status = model.Status;
            trainer.UpdatedDate = DateTime.Now;

            _unitOfWork.TrainerRepository.Update(trainer);
            await _unitOfWork.CommitAsync();
        }

        public async Task Delete(int id)
        {
            var trainer = await _unitOfWork.TrainerRepository.FindBy(x => x.Id == id);
            if (trainer == null)
                throw new System.Exception($"Trainer with ID {id} not found");

            _unitOfWork.TrainerRepository.Delete(trainer);
            await _unitOfWork.CommitAsync();
        }
    }
}
