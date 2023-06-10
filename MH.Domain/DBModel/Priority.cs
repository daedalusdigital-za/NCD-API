
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Priority : BaseModel<int>
    {
        public string Name { get; set; }
        public bool IsDeleted { get; set; }
        public TicketDetails TicketDetails { get; set; }
    }
}
