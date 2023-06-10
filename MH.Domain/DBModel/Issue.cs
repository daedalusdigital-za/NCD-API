
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Issue : BaseModel<int>
    {
        public string Name { get; set; }
        public bool IsDeleted { get; set; }

        public virtual TicketDetails TicketDetails { get; set; }
    }
}
