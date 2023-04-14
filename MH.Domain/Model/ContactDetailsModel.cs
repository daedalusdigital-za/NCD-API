
namespace MH.Domain.Model
{
    public class ContactDetailsModel
    {
        public int Userid { get; set; }
        public string Name { get; set; }
        public int ContactTypeId { get; set; }
        public int ContactDataTypeId { get; set; }
        public int ContactEntityId { get; set; }
        public string Data { get; set; }

    }
}
