namespace MH.Domain.ViewModel
{
    public class TrainerViewModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? ProvinceId { get; set; }
        public int Status { get; set; }
        public string? StatusText { get; set; }
        public string? Location { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
    }
}
