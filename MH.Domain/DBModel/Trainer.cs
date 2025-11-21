using MH.Domain.IEntity;
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Trainer : BaseModel<int>
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? ProvinceId { get; set; }
        public int Status { get; set; } = 1;
        public string? Location { get; set; }

        // Temporarily comment out navigation properties to avoid schema conflicts
        // public virtual ICollection<TrainingSession> TrainingSessions { get; set; } = new List<TrainingSession>();
    }
}
