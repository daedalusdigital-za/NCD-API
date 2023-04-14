
namespace MH.Domain.DBModel
{
    public class ContactEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ContactDetails ContactDetails { get; set; }
    }
}
