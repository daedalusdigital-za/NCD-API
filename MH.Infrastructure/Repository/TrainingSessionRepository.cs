using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class TrainingSessionRepository : Repository<TrainingSession, int>, ITrainingSessionRepository
    {
        private readonly ApplicationDbContext _context;

        public TrainingSessionRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IReadOnlyList<TrainingSession>> GetByProvince(string provinceName)
        {
            return await _context.TrainingSession
                // .Include(x => x.Trainer) // Temporarily disabled
                .Where(x => x.Province == provinceName && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<TrainingSession>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            return await _context.TrainingSession
                // .Include(x => x.Trainer) // Temporarily disabled
                .Where(x => x.Date >= startDate && x.Date <= endDate && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<TrainingSession>> GetByTrainer(int trainerId)
        {
            return await _context.TrainingSession
                // .Include(x => x.Trainer) // Temporarily disabled
                .Where(x => x.TrainerId == trainerId && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<TrainingSession>> GetByStatus(TrainingStatus status)
        {
            return await _context.TrainingSession
                // .Include(x => x.Trainer) // Temporarily disabled
                .Where(x => x.Status == (int)status && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<int> GetCompletedSessionsByTrainer(int trainerId)
        {
            return await _context.TrainingSession
                .Where(x => x.TrainerId == trainerId && x.Status == (int)TrainingStatus.Completed && !x.IsDeleted)
                .CountAsync();
        }
    }
}