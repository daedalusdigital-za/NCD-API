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
    public class PriorityService : IPriorityService
    {
        private readonly IPriorityRepository _priorityRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public PriorityService(IPriorityRepository priorityRepository, IMapper mapper, IUnitOfWork unitOfWork)
        {
            _priorityRepository = priorityRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task Add(PriorityModel priority)
        {
            var data = _mapper.Map<Priority>(priority);
            await _unitOfWork.PriorityRepository.Insert(data);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<PriorityViewModel>> GetAll()
        {
            var data = await _unitOfWork.PriorityRepository.GetAll(x => !x.IsDeleted);
            var result = _mapper.Map<List<PriorityViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<PriorityViewModel> GetById(int id)
        {
            var data = await _unitOfWork.PriorityRepository.FindBy(x => !x.IsDeleted && x.Id == id);
            var result = _mapper.Map<PriorityViewModel>(data);
            return result;
        }

        public async Task Update(PriorityModel priority)
        {
            var existingData = await _unitOfWork.PriorityRepository.FindBy(x => x.Id == priority.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.Name = priority.Name;
                

                await _unitOfWork.PriorityRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.PriorityRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.PriorityRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  
    }
}
