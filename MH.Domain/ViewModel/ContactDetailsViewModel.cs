
namespace MH.Domain.ViewModel
{
    public class ContactDetailsViewModel
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public int ContactTypeId { get; set; }
        public string ContactTypeName { get; set; }
        public int ContactDataTypeId { get; set; }
        public string ContactDataTypeName { get; set; }
        public int ContactEntityId { get; set; }
        public string ContactEntityName { get; set; }
        public string Data { get; set; }


        public DateTime DateCreated { get; set; }
    }
}
