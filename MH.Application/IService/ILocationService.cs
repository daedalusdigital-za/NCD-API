using MH.Domain.ViewModel;
using MH.Domain.DBModel;

namespace MH.Application.IService
{
    public interface ILocationService
    {
        Task<List<ProvinceViewModel>> GetAllProvinces();
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

    public class ClinicViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public string ProvinceName { get; set; } = null!;
        public ClinicType Type { get; set; }
        public string TypeText { get; set; } = null!;
        public string? Address { get; set; }
        public string? ContactNumber { get; set; }
        public string? Email { get; set; }
        public ClinicStatus Status { get; set; }
        public string StatusText { get; set; } = null!;
    }
}