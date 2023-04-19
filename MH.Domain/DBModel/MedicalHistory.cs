using AutoMapper.Configuration.Annotations;
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class MedicalHistory : BaseModel<int>
    {
        [Ignore]
        public byte[]? Documents { get; set; }
        public string? Notes { get; set; }
        [Ignore]
        public byte[]? Perscription { get; set; }
        public int RecordedBy { get; set; }
        public int PatientId { get; set; }
        public bool IsDeleted { get; set; }


        public virtual Patient Patient { get; set; }
        public virtual ApplicationUser RecordedUser { get; set; }
        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }

    }
}
