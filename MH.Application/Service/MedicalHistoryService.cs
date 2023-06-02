using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.UnitOfWork;
using MH.Domain.ViewModel;
using Microsoft.AspNetCore.Http;

namespace MH.Application.Service
{
    public class MedicalHistoryService : IMedicalHistoryService
    {
        private readonly IMedicalHistoryRepository _medicalHistoryRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public MedicalHistoryService(IMedicalHistoryRepository medicalHistoryRepository, IMapper mapper, IUnitOfWork unitOfWork)
        {
            _medicalHistoryRepository = medicalHistoryRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task Add(MedicalHistoryModel medicalHistoryModel)
        {
            var medicalHistory = new MedicalHistory();
            medicalHistory.RecordedBy = medicalHistoryModel.RecordedBy;
            medicalHistory.PatientId = medicalHistoryModel.PatientId;

            medicalHistory.AtInstitution = medicalHistoryModel.AtInstitution;
            medicalHistory.Glucose = medicalHistoryModel.Glucose;
            medicalHistory.HBA1C = medicalHistoryModel.HBA1C;
            medicalHistory.KeyTone = medicalHistoryModel.KeyTone;
            medicalHistory.TotalColestorl = medicalHistoryModel.TotalColestorl;
            medicalHistory.UricAcid = medicalHistoryModel.UricAcid;
            medicalHistory.Lactate = medicalHistoryModel.Lactate;
            medicalHistory.BloodPressue = medicalHistoryModel.BloodPressue;
            medicalHistory.Recomendations = medicalHistoryModel.Recomendations;
            medicalHistory.Remidies = medicalHistoryModel.Remidies;
            medicalHistory.NextAppointmentDate = medicalHistoryModel.NextAppointmentDate;
            medicalHistory.IsMedicated = medicalHistoryModel.IsMedicated;

            await _unitOfWork.MedicalHistoryRepository.Insert(medicalHistory);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<MedicalHistoryViewModel>> GetAll()
        {
            var data = await _unitOfWork.MedicalHistoryRepository.GetAll(x => !x.IsDeleted, y=> y.Patient);
            var result = _mapper.Map<List<MedicalHistoryViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<MedicalHistoryViewModel> GetById(int id)
        {
            var data = await _unitOfWork.MedicalHistoryRepository.FindBy(x => !x.IsDeleted && x.Id == id, y => y.Patient);
            var result = _mapper.Map<MedicalHistoryViewModel>(data);
            return result;
        }
        public async Task<List<MedicalHistoryViewModel>> GetByPatientId(int patientId)
        {
            var data = await _unitOfWork.MedicalHistoryRepository.GetAll(x => !x.IsDeleted && x.PatientId == patientId, y => y.Patient);
            var result = _mapper.Map<List<MedicalHistoryViewModel>>(data);
            return result;
        }

        public async Task Update(MedicalHistoryModel medicalHistoryModel)
        {
            var existingData = await _unitOfWork.MedicalHistoryRepository.FindBy(x => x.Id == medicalHistoryModel.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.RecordedBy = (int)medicalHistoryModel?.RecordedBy;
                existingData.PatientId = medicalHistoryModel.PatientId;

                existingData.AtInstitution = medicalHistoryModel.AtInstitution;
                existingData.Glucose = medicalHistoryModel.Glucose;
                existingData.HBA1C = medicalHistoryModel.HBA1C;
                existingData.KeyTone = medicalHistoryModel.KeyTone;
                existingData.TotalColestorl = medicalHistoryModel.TotalColestorl;
                existingData.UricAcid = medicalHistoryModel.UricAcid;
                existingData.Lactate = medicalHistoryModel.Lactate;
                existingData.BloodPressue = medicalHistoryModel.BloodPressue;
                existingData.Recomendations = medicalHistoryModel.Recomendations;
                existingData.Remidies = medicalHistoryModel.Remidies;
                existingData.NextAppointmentDate = medicalHistoryModel.NextAppointmentDate;
                existingData.IsMedicated = medicalHistoryModel.IsMedicated;

                await _unitOfWork.MedicalHistoryRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.MedicalHistoryRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.MedicalHistoryRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  

        private byte[] GetStreamData(IFormFile? data)
        {
            if(data is null) return null;
            using var ms = new MemoryStream();
            data.CopyTo(ms);
            return ms.ToArray();

        }

    }
}
