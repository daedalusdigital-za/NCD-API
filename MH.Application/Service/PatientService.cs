using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.UnitOfWork;
using MH.Domain.ViewModel;


namespace MH.Application.Service
{
    public class PatientService : IPatientService
    {
        private readonly IPatientRepository _patientRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public PatientService(IPatientRepository patientRepository, IMapper mapper, IUnitOfWork unitOfWork)
        {
            _patientRepository = patientRepository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task Add(PatientModel patient)
        {
            var data = _mapper.Map<Patient>(patient);
            await _unitOfWork.PatientRepository.Insert(data);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<PatientViewModel>> GetAll()
        {
            var data = await _unitOfWork.PatientRepository.GetAll(x => !x.IsDeleted);
            var result = _mapper.Map<List<PatientViewModel>>(data);
            return result.OrderByDescending(x=> x.Id).ToList();
        }

        public async Task<PatientViewModel> GetById(int id)
        {
            var data = await _unitOfWork.PatientRepository.FindBy(x => !x.IsDeleted && x.Id == id);
            var result = _mapper.Map<PatientViewModel>(data);
            return result;
        }

        public async Task Update(PatientModel patient)
        {
            var existingData = await _unitOfWork.PatientRepository.FindBy(x => x.Id == patient.Id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.PatientNumber = patient.PatientNumber;

                existingData.Name = patient.Name;
                existingData.Surname = patient.Surname;
                existingData.Gender = patient.Gender;
                existingData.PhoneNumber = patient.PhoneNumber;
                existingData.Age = patient.Age;

                existingData.Gesttational = patient.Gesttational;
                existingData.DateOfBirth = patient.DateOfBirth;
                existingData.Province = patient.Province;
                existingData.District = patient.District;
                existingData.Institution = patient.Institution;


                await _unitOfWork.PatientRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.PatientRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.PatientRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  
    }
}
