using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class TrainerRepository : Repository<Trainer, int>, ITrainerRepository
    {
        private new readonly ApplicationDbContext _context;

        public TrainerRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
