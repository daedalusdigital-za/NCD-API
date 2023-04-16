using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MH.Domain.ViewModel
{
    public class MedicalHistoryViewModel
    {
        public int? Id { get; set; }
        public byte[]? Documents { get; set; }
        public string? Notes { get; set; }
        public byte[]? Perscription { get; set; }
        public int RecordedBy { get; set; }
        public int PatientId { get; set; }

        public bool IsDeleted { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
