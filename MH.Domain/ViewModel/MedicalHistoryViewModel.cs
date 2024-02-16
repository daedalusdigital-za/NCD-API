
namespace MH.Domain.ViewModel
{
    public class MedicalHistoryViewModel
    {
        public int? Id { get; set; }
        //public byte[]? Documents { get; set; }
        public string? Notes { get; set; }
        //public byte[]? Perscription { get; set; }
        public int RecordedBy { get; set; }
        public int PatientId { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string PhoneNumber { get; set; }
        public double Age { get; set; }
        //public DateTime? LastAppointmentDate { get; set; }
        //public DateTime? NextAppointmentDate { get; set; }

        public string? Province { get; set; }
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
        public string Gender { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public bool? IsMedicated { get; set; }



        public bool IsDeleted { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
