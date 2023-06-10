using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Infrastructure.DBContext;

namespace MH.Infrastructure.Repository
{
    public class TicketDetailsRepository : Repository<TicketDetails, int>, ITicketDetailsRepository
    {
        private readonly ApplicationDbContext _context;

        public TicketDetailsRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
