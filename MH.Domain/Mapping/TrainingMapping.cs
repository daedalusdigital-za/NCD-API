using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class TrainingMapping : Profile
    {
        public TrainingMapping()
        {
            CreateMap<TrainingSessionModel, TrainingSession>();
            CreateMap<TrainingSession, TrainingSessionViewModel>()
                .ForMember(dest => dest.TrainerName, opt => opt.MapFrom(src => src.Trainer != null ? src.Trainer.Name : string.Empty))
                .ForMember(dest => dest.StatusText, opt => opt.MapFrom(src => src.Status.ToString()))
                .ForMember(dest => dest.CreatedByUserName, opt => opt.MapFrom(src => 
                    src.CreatedByUser != null && src.CreatedByUser.UserProfile != null ? 
                    src.CreatedByUser.UserProfile.FirstName + " " + src.CreatedByUser.UserProfile.LastName : string.Empty));

            CreateMap<TrainerModel, Trainer>();
            CreateMap<Trainer, TrainerViewModel>()
                .ForMember(dest => dest.StatusText, opt => opt.MapFrom(src => src.Status.ToString()))
                .ForMember(dest => dest.CreatedByUserName, opt => opt.MapFrom(src => 
                    src.CreatedByUser != null && src.CreatedByUser.UserProfile != null ? 
                    src.CreatedByUser.UserProfile.FirstName + " " + src.CreatedByUser.UserProfile.LastName : string.Empty));

            CreateMap<TrainingRegister, TrainingRegisterViewModel>()
                .ForMember(dest => dest.StatusText, opt => opt.MapFrom(src => src.Status.ToString()));
        }
    }

    public class TrainingRegisterViewModel
    {
        public int? Id { get; set; }
        public string SessionTitle { get; set; } = null!;
        public string Trainer { get; set; } = null!;
        public DateTime Date { get; set; }
        public string Venue { get; set; } = null!;
        public int Participants { get; set; }
        public string Duration { get; set; } = null!;
        public TrainingRegisterStatus Status { get; set; }
        public string? StatusText { get; set; }
        public string Topic { get; set; } = null!;
        public decimal AttendanceRate { get; set; }
        public int CertificatesIssued { get; set; }
        public string? RegisterFile { get; set; }
        public DateTime DateCreated { get; set; }
    }
}