using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.UnitOfWork;
using MH.Domain.ViewModel;


namespace MH.Application.Service
{
    public class PositionService : IPositionService
    {
        private readonly IPositionRepository _positionRepository;
        private readonly IMapper _mapper;



        private readonly IUnitOfWork _unitOfWork;

        public PositionService(IPositionRepository positionRepository, IMapper mapper, IUnitOfWork unitOfWork)
        {
            _positionRepository = positionRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task Add(PositionModel position)
        {
            var data = _mapper.Map<Position>(position);
            await _unitOfWork.PositionRepository.Insert(data);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<PositionViewModel>> GetAll()
        {
            var data = await _unitOfWork.PositionRepository.GetAll(x => !x.IsDeleted);
            var result = _mapper.Map<List<PositionViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<PositionViewModel> GetById(int id)
        {
            var data = await _unitOfWork.PositionRepository.FindBy(x => !x.IsDeleted && x.Id == id);
            var result = _mapper.Map<PositionViewModel>(data);
            return result;
        }

        public async Task Update(PositionModel position)
        {
            var existingData = await _unitOfWork.PositionRepository.FindBy(x => x.Id == position.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.Name = position.Name;
                existingData.Description = position.Description;
                
                await _unitOfWork.PositionRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.PositionRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.PositionRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  
    }
}
