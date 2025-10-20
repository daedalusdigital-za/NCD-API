using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Application.Service
{
    public class LocationService : ILocationService
    {
        private readonly ILocationRepository _locationRepository;
        private readonly IMapper _mapper;

        public LocationService(
            ILocationRepository locationRepository,
            IMapper mapper)
        {
            _locationRepository = locationRepository;
            _mapper = mapper;
        }

        public async Task<List<ProvinceViewModel>> GetAllProvinces()
        {
            var entities = await _locationRepository.GetAllProvinces();
            return _mapper.Map<List<ProvinceViewModel>>(entities);
        }

        public async Task<List<DistrictViewModel>> GetDistrictsByProvince(string province)
        {
            var entities = await _locationRepository.GetDistrictsByProvince(province);
            var viewModels = _mapper.Map<List<DistrictViewModel>>(entities);
            
            // Add province name to each district
            foreach (var vm in viewModels)
            {
                var district = entities.FirstOrDefault(x => x.Id == vm.Id);
                vm.ProvinceName = district?.Province?.Name ?? string.Empty;
            }
            
            return viewModels;
        }

        public async Task<List<HospitalViewModel>> GetAllHospitals()
        {
            var entities = await _locationRepository.GetAllHospitals();
            var viewModels = _mapper.Map<List<HospitalViewModel>>(entities);
            
            // Enhance with text representations
            foreach (var vm in viewModels)
            {
                var hospital = entities.FirstOrDefault(x => x.Id == vm.Id);
                if (hospital != null)
                {
                    vm.ProvinceName = hospital.Province?.Name ?? string.Empty;
                    vm.DistrictName = hospital.District?.Name;
                    vm.TypeText = hospital.Type.ToString();
                    vm.LevelText = hospital.Level?.ToString();
                    vm.StatusText = hospital.Status.ToString();
                }
            }
            
            return viewModels;
        }

        public async Task<List<HospitalViewModel>> GetHospitalsByProvince(string province)
        {
            var entities = await _locationRepository.GetHospitalsByProvince(province);
            var viewModels = _mapper.Map<List<HospitalViewModel>>(entities);
            
            // Enhance with text representations
            foreach (var vm in viewModels)
            {
                var hospital = entities.FirstOrDefault(x => x.Id == vm.Id);
                if (hospital != null)
                {
                    vm.ProvinceName = hospital.Province?.Name ?? string.Empty;
                    vm.DistrictName = hospital.District?.Name;
                    vm.TypeText = hospital.Type.ToString();
                    vm.LevelText = hospital.Level?.ToString();
                    vm.StatusText = hospital.Status.ToString();
                }
            }
            
            return viewModels;
        }

        public async Task<List<ClinicViewModel>> GetAllClinics()
        {
            var entities = await _locationRepository.GetAllClinics();
            var viewModels = _mapper.Map<List<ClinicViewModel>>(entities);
            
            // Enhance with text representations
            foreach (var vm in viewModels)
            {
                var clinic = entities.FirstOrDefault(x => x.Id == vm.Id);
                if (clinic != null)
                {
                    vm.ProvinceName = clinic.Province?.Name ?? string.Empty;
                    vm.DistrictName = clinic.District?.Name;
                    vm.TypeText = clinic.Type.ToString();
                    vm.StatusText = clinic.Status.ToString();
                }
            }
            
            return viewModels;
        }

        public async Task<List<ClinicViewModel>> GetClinicsByProvince(string province)
        {
            var entities = await _locationRepository.GetClinicsByProvince(province);
            var viewModels = _mapper.Map<List<ClinicViewModel>>(entities);
            
            // Enhance with text representations
            foreach (var vm in viewModels)
            {
                var clinic = entities.FirstOrDefault(x => x.Id == vm.Id);
                if (clinic != null)
                {
                    vm.ProvinceName = clinic.Province?.Name ?? string.Empty;
                    vm.DistrictName = clinic.District?.Name;
                    vm.TypeText = clinic.Type.ToString();
                    vm.StatusText = clinic.Status.ToString();
                }
            }
            
            return viewModels;
        }
    }
}