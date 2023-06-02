namespace MH.Domain.Model
{
    public class MedicalHistoryModel
    {
        public int? Id { get; set; }
        public int RecordedBy { get; set; }
        public int PatientId { get; set; }

        //public string? Province { get; set; }
        public string? AtInstitution { get; set; }
        public double? Glucose { get; set; }
        public double? HBA1C { get; set; }
        public double? KeyTone { get; set; }
        public double? TotalColestorl { get; set; }
        public double? UricAcid { get; set; }
        public double? Lactate { get; set; }
        public double? BloodPressue { get; set; }
        public string? Recomendations { get; set; } 
        public int? Remidies { get; set; }
        //public string Gender { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public bool? IsMedicated { get; set; }
    }
}
