using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class TicketDetails : BaseModel<int>
    {
        public int UserId { get; set; }
        public string Subject { get; set; }
        public int PriorityId { get; set; }
        public int StatusId { get; set; }
        public int IssueId { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }

        public ApplicationUser User { get; set; }
        public virtual Priority Priority { get; set; }
        public virtual TicketStatus Status { get; set; }
        public virtual Issue Issue { get; set; }

        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdatedByUser { get; set; }
    }
}
