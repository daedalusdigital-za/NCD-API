
namespace MH.Domain.ViewModel
{
    public class TicketDetailsViewModel
    {
        public int UserId { get; set; }
        public string Subject { get; set; }
        public int PriorityId { get; set; }
        public string Priority { get; set; }
        public int StatusId { get; set; }
        public string Status { get; set; }
        public int IssueId { get; set; }
        public string Issue { get; set; }
        public string Description { get; set; }


        public DateTime DateCreated { get; set; }
    }
}
