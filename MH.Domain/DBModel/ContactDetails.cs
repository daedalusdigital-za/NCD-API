using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class ContactDetails : BaseModel<int>
    {
        public int UserProfileId { get; set; }
        public string Name { get; set; }
        public int ContactTypeId { get; set; }
        public int ContactDataTypeId { get; set; }
        public int ContactEntityId { get; set; }
        public string Data { get; set; }
        public bool IsDeleted { get; set; }

        public virtual UserProfile UserProfile { get; set; }
        public virtual ContactType ContactType { get; set; }
        public virtual ContactDataType ContactDataType { get; set; }
        public virtual ContactEntity ContactEntity { get; set; }

        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }
    }
}
