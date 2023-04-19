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
            if (medicalHistoryModel.Documents?.Length > 0)
            {
                medicalHistory.Documents = GetStreamData(medicalHistoryModel?.Documents);
            }
            if (medicalHistoryModel?.Perscription?.Length > 0)
            {
                medicalHistory.Perscription = GetStreamData(medicalHistoryModel?.Perscription);
            }

            medicalHistory.Notes = medicalHistoryModel?.Notes;
            medicalHistory.RecordedBy = medicalHistoryModel.RecordedBy;
            medicalHistory.PatientId = medicalHistoryModel.PatientId;

            await _unitOfWork.MedicalHistoryRepository.Insert(medicalHistory);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<MedicalHistoryViewModel>> GetAll()
        {
            var data = await _unitOfWork.MedicalHistoryRepository.GetAll(x => !x.IsDeleted);
            var result = _mapper.Map<List<MedicalHistoryViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<MedicalHistoryViewModel> GetById(int id)
        {
            var data = await _unitOfWork.MedicalHistoryRepository.FindBy(x => !x.IsDeleted && x.Id == id);
            var result = _mapper.Map<MedicalHistoryViewModel>(data);
            return result;
        }
        public async Task<MedicalHistoryViewModel> GetByPatientId(int id)
        {
            var data = await _unitOfWork.MedicalHistoryRepository.FindBy(x => !x.IsDeleted && x.PatientId == id);
            var result = _mapper.Map<MedicalHistoryViewModel>(data);
            return result;
        }

        public async Task Update(MedicalHistoryModel medicalHistoryModel)
        {
            var existingData = await _unitOfWork.MedicalHistoryRepository.FindBy(x => x.Id == medicalHistoryModel.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.Documents = GetStreamData(medicalHistoryModel?.Documents);
                existingData.Perscription = GetStreamData(medicalHistoryModel?.Perscription);

                existingData.Notes = medicalHistoryModel?.Notes;
                existingData.RecordedBy = (int)medicalHistoryModel?.RecordedBy;
                existingData.PatientId = medicalHistoryModel.PatientId;

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
