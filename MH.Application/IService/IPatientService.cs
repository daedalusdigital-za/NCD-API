using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IPatientService
    {
        Task<List<PatientViewModel>> GetAll();
        Task<PatientViewModel> GetById(int id);
        Task Add(PatientModel patient);
        Task Update(PatientModel patient);
        Task Delete(int id); 
    }
}
