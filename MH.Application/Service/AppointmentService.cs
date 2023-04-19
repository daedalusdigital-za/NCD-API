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
    public class AppointmentService : IAppointmentService
    {
        private readonly IAppointmentRepository _appointmentRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public AppointmentService(IAppointmentRepository appointmentRepository, IMapper mapper, IUnitOfWork unitOfWork)
        {
            _appointmentRepository = appointmentRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task Add(AppointmentModel appointment)
        {
            var data = _mapper.Map<Appointment>(appointment);
            await _unitOfWork.AppointmentRepository.Insert(data);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<AppointmentViewModel>> GetAll()
        {
            var data = await _unitOfWork.AppointmentRepository.GetAll(x => !x.IsDeleted);
            var result = _mapper.Map<List<AppointmentViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<AppointmentViewModel> GetById(int id)
        {
            var data = await _unitOfWork.AppointmentRepository.FindBy(x => !x.IsDeleted && x.Id == id);
            var result = _mapper.Map<AppointmentViewModel>(data);
            return result;
        }

        public async Task Update(AppointmentModel appointment)
        {
            var existingData = await _unitOfWork.AppointmentRepository.FindBy(x => x.Id == appointment.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.DateOfAppointment = appointment.DateOfAppointment;
                await _unitOfWork.AppointmentRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.AppointmentRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.AppointmentRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  
    }
}
