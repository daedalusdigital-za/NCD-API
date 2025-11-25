using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class TrainingDocumentRepository : Repository<TrainingDocument, int>, ITrainingDocumentRepository
    {
        private new readonly ApplicationDbContext _context;

        public TrainingDocumentRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<List<TrainingDocument>> GetByTrainingSessionId(int trainingSessionId)
        {
            var docs = await GetAll(x => x.TrainingSessionId == trainingSessionId && !x.IsDeleted);
            return docs.ToList();
        }

        public async Task<TrainingDocument?> GetById(int id)
        {
            return await FindBy(x => x.Id == id && !x.IsDeleted);
        }
    }
}
