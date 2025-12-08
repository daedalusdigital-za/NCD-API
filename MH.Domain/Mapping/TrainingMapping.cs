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
            // ✅ Enhanced mapping to ensure ALL fields are mapped during updates
            CreateMap<TrainingSessionModel, TrainingSession>()
                .ForMember(dest => dest.Date, opt => opt.MapFrom(src => src.StartDate))
                .ForMember(dest => dest.TrainerId, opt => opt.MapFrom(src => src.TrainerId))
                .ForMember(dest => dest.ProvinceId, opt => opt.MapFrom(src => src.ProvinceId))
                .ForMember(dest => dest.TrainingName, opt => opt.MapFrom(src => src.TrainingName))
                .ForMember(dest => dest.TrainingType, opt => opt.MapFrom(src => src.TrainingType))
                .ForMember(dest => dest.Venue, opt => opt.MapFrom(src => src.Venue))
                .ForMember(dest => dest.TargetAudience, opt => opt.MapFrom(src => src.TargetAudience))
                .ForMember(dest => dest.NumberOfParticipants, opt => opt.MapFrom(src => src.NumberOfParticipants))
                .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status));
            CreateMap<TrainingSession, TrainingSessionViewModel>()
                .ForMember(dest => dest.StartDate, opt => opt.MapFrom(src => src.Date))
                .ForMember(dest => dest.ProvinceName, opt => opt.MapFrom(src => src.Province != null ? src.Province.Name : null))
                .ForMember(dest => dest.StatusText, opt => opt.MapFrom(src => src.Status.ToString()))
                .ForMember(dest => dest.CreatedByUserName, opt => opt.MapFrom(src => string.Empty));

            CreateMap<TrainerModel, Trainer>()
                .ReverseMap();
            CreateMap<Trainer, TrainerViewModel>()
                .ReverseMap();

            CreateMap<TrainingRegister, TrainingRegisterViewModel>()
                .ForMember(dest => dest.StatusText, opt => opt.MapFrom(src => src.Status.ToString()));

            // TrainingDocument mappings
            CreateMap<TrainingDocumentModel, TrainingDocument>()
                .ReverseMap();
            CreateMap<TrainingDocument, TrainingDocumentViewModel>()
                .ForMember(dest => dest.UploadedAt, opt => opt.MapFrom(src => src.DateCreated));
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