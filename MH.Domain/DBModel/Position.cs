using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Position : BaseModel<int>
    {
        public string Name { get; set; }
        public string? Description { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ApplicationUser? User { get; set; }
        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }
    }
}
