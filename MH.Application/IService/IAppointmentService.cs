using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IAppointmentService
    {
        Task<List<AppointmentViewModel>> GetAll();
        Task<AppointmentViewModel> GetById(int id);
        Task Add(AppointmentModel appointment);
        Task Update(AppointmentModel appointment);
        Task Delete(int id); 
    }
}
