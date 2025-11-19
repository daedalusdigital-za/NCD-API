using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class LocationRepository : Repository<Province, int>, ILocationRepository
    {
        private readonly ApplicationDbContext _context;

        public LocationRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IReadOnlyList<Province>> GetAllProvinces()
        {
            return await _context.Provinces
                .Where(x => !x.IsDeleted)
                .OrderBy(x => x.Name)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Clinic>> GetAllClinics()
        {
            return await _context.Clinics
                .Include(x => x.Province)
                .Where(x => !x.IsDeleted)
                .OrderBy(x => x.Province!.Name)
                .ThenBy(x => x.Name)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Clinic>> GetClinicsByProvince(string province)
        {
            return await _context.Clinics
                .Include(x => x.Province)
                .Where(x => x.Province!.Name == province && !x.IsDeleted)
                .OrderBy(x => x.Name)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<Province?> GetProvinceByCode(string code)
        {
            return await _context.Provinces
                .FirstOrDefaultAsync(x => x.Code == code && !x.IsDeleted);
        }

        public async Task<Province?> GetProvinceByName(string name)
        {
            return await _context.Provinces
                .FirstOrDefaultAsync(x => x.Name == name && !x.IsDeleted);
        }
    }
}