using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class TrainerRepository : Repository<Trainer, int>, ITrainerRepository
    {
        private readonly ApplicationDbContext _context;

        public TrainerRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IReadOnlyList<Trainer>> GetByProvince(string province)
        {
            return await _context.Trainers
                .Where(x => x.Province == province && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Trainer>> GetByStatus(TrainerStatus status)
        {
            return await _context.Trainers
                .Where(x => x.Status == status && !x.IsDeleted)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<Trainer?> GetByEmail(string email)
        {
            return await _context.Trainers
                .FirstOrDefaultAsync(x => x.Email == email && !x.IsDeleted);
        }

        public async Task<bool> IsEmailExists(string email, int? excludeId = null)
        {
            var query = _context.Trainers.Where(x => x.Email == email && !x.IsDeleted);
            
            if (excludeId.HasValue)
            {
                query = query.Where(x => x.Id != excludeId.Value);
            }
            
            return await query.AnyAsync();
        }

        public async Task<TrainerStatsModel> GetTrainerStats(int trainerId)
        {
            var totalSessions = await _context.TrainingSessions
                .Where(x => x.TrainerId == trainerId && !x.IsDeleted)
                .CountAsync();

            var completedSessions = await _context.TrainingSessions
                .Where(x => x.TrainerId == trainerId && x.Status == TrainingStatus.Completed && !x.IsDeleted)
                .CountAsync();

            var totalParticipants = await _context.TrainingSessions
                .Where(x => x.TrainerId == trainerId && !x.IsDeleted)
                .SumAsync(x => x.NumberOfParticipants);

            var lastSessionDate = await _context.TrainingSessions
                .Where(x => x.TrainerId == trainerId && !x.IsDeleted)
                .OrderByDescending(x => x.StartDate)
                .Select(x => x.StartDate)
                .FirstOrDefaultAsync();

            var completionRate = totalSessions > 0 ? (decimal)completedSessions / totalSessions * 100 : 0;

            return new TrainerStatsModel
            {
                TotalSessions = totalSessions,
                CompletedSessions = completedSessions,
                TotalParticipants = totalParticipants,
                CompletionRate = completionRate,
                LastSessionDate = lastSessionDate == default ? null : lastSessionDate
            };
        }
    }
}