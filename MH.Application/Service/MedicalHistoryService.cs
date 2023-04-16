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
        public async Task Add(MedicalHistoryModel medicalHistory)
        {
            var data = _mapper.Map<MedicalHistory>(medicalHistory);
            data.Documents = GetStreamData(medicalHistory?.Documents);
            data.Perscription = GetStreamData(medicalHistory?.Perscription);
            await _unitOfWork.MedicalHistoryRepository.Insert(data);
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

        public async Task Update(MedicalHistoryModel medicalHistory)
        {
            var existingData = await _unitOfWork.MedicalHistoryRepository.FindBy(x => x.Id == medicalHistory.Id && !x.IsDeleted);
            if(existingData != null)
            {
                //existingData.Name = server.Name;
                

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
            using (var ms = new MemoryStream())
            {
                data.CopyTo(ms);
                return ms.ToArray();
            }

        }

    }
}
