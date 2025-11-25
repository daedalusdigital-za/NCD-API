namespace MH.Domain.ViewModel
{
    public class TrainerViewModel
    {
        public int Id { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Specialization { get; set; }
        public int? Experience { get; set; }
        public string? Certification { get; set; }
        public bool IsActive { get; set; } = true;
        public bool IsDeleted { get; set; }
        public DateTime? LastUpdated { get; set; }
        public int? UpdatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
