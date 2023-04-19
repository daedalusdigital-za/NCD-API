
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IMedicalHistoryService
    {
        Task<List<MedicalHistoryViewModel>> GetAll();
        Task<MedicalHistoryViewModel> GetById(int id);
        Task<List<MedicalHistoryViewModel>> GetByPatientId(int patientId);
        Task Add(MedicalHistoryModel medicalHistory);
        Task Update(MedicalHistoryModel medicalHistory);
        Task Delete(int id); 
    }
}
