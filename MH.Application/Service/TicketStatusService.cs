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
    public class TicketStatusService : ITicketStatusService
    {
        private readonly ITicketStatusRepository _ticketStatusRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public TicketStatusService(ITicketStatusRepository ticketStatusRepository, IMapper mapper, IUnitOfWork unitOfWork)
        {
            _ticketStatusRepository = ticketStatusRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task Add(TicketStatusModel ticketStatus)
        {
            var data = _mapper.Map<TicketStatus>(ticketStatus);
            await _unitOfWork.TicketStatusRepository.Insert(data);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<TicketStatusViewModel>> GetAll()
        {
            var data = await _unitOfWork.TicketStatusRepository.GetAll(x => !x.IsDeleted);
            var result = _mapper.Map<List<TicketStatusViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<TicketStatusViewModel> GetById(int id)
        {
            var data = await _unitOfWork.TicketStatusRepository.FindBy(x => !x.IsDeleted && x.Id == id);
            var result = _mapper.Map<TicketStatusViewModel>(data);
            return result;
        }

        public async Task Update(TicketStatusModel ticketStatus)
        {
            var existingData = await _unitOfWork.TicketStatusRepository.FindBy(x => x.Id == ticketStatus.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.Name = ticketStatus.Name;
                
                await _unitOfWork.TicketStatusRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.TicketStatusRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.TicketStatusRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  
    }
}
