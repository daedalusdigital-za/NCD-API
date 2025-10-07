using MH.Domain.ViewModel;
using MH.Domain.DBModel;

namespace MH.Application.IService
{
    public interface ILocationService
    {
        Task<List<ProvinceViewModel>> GetAllProvinces();
        Task<List<DistrictViewModel>> GetDistrictsByProvince(string province);
        Task<List<HospitalViewModel>> GetAllHospitals();
        Task<List<HospitalViewModel>> GetHospitalsByProvince(string province);
        Task<List<ClinicViewModel>> GetAllClinics();
        Task<List<ClinicViewModel>> GetClinicsByProvince(string province);
    }

    public class ProvinceViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public long? Population { get; set; }
        public int? HealthFacilities { get; set; }
    }

    public class DistrictViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public string ProvinceName { get; set; } = null!;
    }

    public class HospitalViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public string ProvinceName { get; set; } = null!;
        public string? DistrictName { get; set; }
        public HospitalType Type { get; set; }
        public string TypeText { get; set; } = null!;
        public HospitalLevel? Level { get; set; }
        public string? LevelText { get; set; }
        public string? Address { get; set; }
        public string? ContactNumber { get; set; }
        public string? Email { get; set; }
        public HospitalStatus Status { get; set; }
        public string StatusText { get; set; } = null!;
        public int? Capacity { get; set; }
    }

    public class ClinicViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public string ProvinceName { get; set; } = null!;
        public string? DistrictName { get; set; }
        public ClinicType Type { get; set; }
        public string TypeText { get; set; } = null!;
        public string? Address { get; set; }
        public string? ContactNumber { get; set; }
        public string? Email { get; set; }
        public ClinicStatus Status { get; set; }
        public string StatusText { get; set; } = null!;
    }
}