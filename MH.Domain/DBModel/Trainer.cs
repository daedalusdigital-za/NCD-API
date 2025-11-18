using MH.Domain.IEntity;
using MH.Domain.Model;
using System.ComponentModel.DataAnnotations.Schema;

namespace MH.Domain.DBModel
{
    public class Trainer : BaseModel<int>
    {
        // Map DateCreated property to CreatedAt column in database
        [Column("CreatedAt")]
        public new DateTime DateCreated { get; set; }
        
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? ProvinceId { get; set; }
        public string Status { get; set; } = "Active"; // Valid values: 'Active', 'Inactive', 'On Leave'
        public string? Location { get; set; }
    }
}
