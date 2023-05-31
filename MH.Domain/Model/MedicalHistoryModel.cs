using AutoMapper.Configuration.Annotations;
using Microsoft.AspNetCore.Http;

namespace MH.Domain.Model
{
    public class MedicalHistoryModel
    {
        public int? Id { get; set; }
        public string? Notes { get; set; }
        public int RecordedBy { get; set; }
        public int PatientId { get; set; }

        //public string? Province { get; set; }
        public string? AtInstitution { get; set; }
        public int? Glucose { get; set; }
        public string? HBA1C { get; set; }
        public int? KeyTone { get; set; }
        public int? TotalColestorl { get; set; }
        public int? UricAcid { get; set; }
        public int? Lactate { get; set; }
        public int? BloodPressue { get; set; }
        public string? Recomendations { get; set; }
        public string? Symptoms { get; set; }
        public int? Remidies { get; set; }
        //public string Gender { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public bool? IsMedicated { get; set; }
    }
}
