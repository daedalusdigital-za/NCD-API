namespace MH.Domain.ViewModel
{
    public class TrainerViewModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? ProvinceId { get; set; }  // Changed back to ProvinceId to match database
        public int Status { get; set; } = 1;   // 1 = Active
        public string? Location { get; set; }
        // Removed: Qualification, Experience, Bio - not in database
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
    }
}
