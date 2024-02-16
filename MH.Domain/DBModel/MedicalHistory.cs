using AutoMapper.Configuration.Annotations;
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class MedicalHistory : BaseModel<int>
    {
        [Ignore]
        public byte[]? Perscription { get; set; }
        public int RecordedBy { get; set; }
        public int PatientId { get; set; }

        public string? AtInstitution { get; set; }
        public double? Glucose { get; set; }
        public double? HBA1C { get; set; }
        public double? KeyTone { get; set; }
        public double? TotalColestorl { get; set; }
        public double? UricAcid { get; set; }
        public double? Lactate { get; set; }
        public int? BloodPressue { get; set; }
        public string? Recomendations { get; set; }
        public int? Remidies { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public bool? IsMedicated { get; set; }


        public bool IsDeleted { get; set; }


        public virtual Patient Patient { get; set; }
        public virtual ApplicationUser RecordedUser { get; set; }
        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }

    }
}
