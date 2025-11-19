using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Domain.IRepository
{
    public interface ILocationRepository : IRepository<Province, int>
    {
        Task<IReadOnlyList<Province>> GetAllProvinces();
        Task<IReadOnlyList<Clinic>> GetAllClinics();
        Task<IReadOnlyList<Clinic>> GetClinicsByProvince(string province);
        Task<Province?> GetProvinceByCode(string code);
        Task<Province?> GetProvinceByName(string name);
    }
}