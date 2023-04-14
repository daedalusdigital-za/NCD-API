using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Permission : BaseModel<int>
    {
        public string Name { get; set; }

        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }

    }
}
