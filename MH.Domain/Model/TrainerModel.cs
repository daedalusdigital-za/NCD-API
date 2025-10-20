namespace MH.Domain.Model
{
    public class TrainerModel
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? ProvinceId { get; set; }
        public string? Qualification { get; set; }
        public string? Experience { get; set; }
        public int Status { get; set; }
        public string? Location { get; set; }
        public string? Bio { get; set; }
    }
}
