
namespace MH.Domain.DBModel
{
    public class ContactType
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ContactDetails ContactDetails { get; set; }
    }
}
