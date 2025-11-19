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
                    vm.TypeText = clinic.Type.ToString();
                    vm.StatusText = clinic.Status.ToString();
                }
            }
            
            return viewModels;
        }
    }
}