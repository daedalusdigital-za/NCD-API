
namespace MH.Domain.DBModel
{
    public class ContactDataType
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ContactDetails ContactDetails { get; set; }
    }
}
