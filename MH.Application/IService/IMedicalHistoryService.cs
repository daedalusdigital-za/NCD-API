using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IMedicalHistoryService
    {
        Task<List<MedicalHistoryViewModel>> GetAll();
        Task<MedicalHistoryViewModel> GetById(int id);
        Task<MedicalHistoryViewModel> GetByPatientId(int id);
        Task Add(MedicalHistoryModel medicalHistory);
        Task Update(MedicalHistoryModel medicalHistory);
        Task Delete(int id); 
    }
}
