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
    public class TicketDetailsService : ITicketDetailsService
    {
        private readonly ITicketDetailsRepository _ticketDetailsRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public TicketDetailsService(ITicketDetailsRepository ticketDetailsRepository, IMapper mapper, IUnitOfWork unitOfWork)
        {
            _ticketDetailsRepository = ticketDetailsRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task Add(TicketDetailsModel ticketDetails)
        {
            var data = _mapper.Map<TicketDetails>(ticketDetails);
            await _unitOfWork.TicketDetailsRepository.Insert(data);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<TicketDetailsViewModel>> GetAll()
        {
            var data = await _unitOfWork.TicketDetailsRepository.GetAll(x => !x.IsDeleted);
            var result = _mapper.Map<List<TicketDetailsViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<TicketDetailsViewModel> GetById(int id)
        {
            var data = await _unitOfWork.TicketDetailsRepository.FindBy(x => !x.IsDeleted && x.Id == id);
            var result = _mapper.Map<TicketDetailsViewModel>(data);
            return result;
        }

        public async Task Update(TicketDetailsModel ticketDetails)
        {
            var existingData = await _unitOfWork.TicketDetailsRepository.FindBy(x => x.Id == ticketDetails.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.UserId = ticketDetails.UserId;
                existingData.Subject = ticketDetails.Subject;
                existingData.PriorityId = ticketDetails.PriorityId;
                existingData.IssueId = ticketDetails.IssueId;
                existingData.StatusId = ticketDetails.StatusId;
                
                await _unitOfWork.TicketDetailsRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.TicketDetailsRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.TicketDetailsRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  
    }
}
