using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class MedicalHistoryMapping : Profile
    {
        public MedicalHistoryMapping()
        {
            CreateMap<MedicalHistoryModel, MedicalHistory>();
            CreateMap<MedicalHistory, MedicalHistoryViewModel>()
                .ForMember(src => src.Name, dest => dest.MapFrom(x => x.Patient.Name))
                .ForMember(src => src.Surname, dest => dest.MapFrom(x => x.Patient.Surname))
                .ForMember(src => src.PhoneNumber, dest => dest.MapFrom(x => x.Patient.PhoneNumber))
                .ForMember(src => src.Gender, dest => dest.MapFrom(x => x.Patient.Gender))
                .ForMember(src => src.Age, dest => dest.MapFrom(x => x.Patient.Age))
                .ForMember(src => src.Age, dest => dest.MapFrom(x => x.Patient.Age))
                .ForMember(src => src.LastAppointmentDate, dest => dest.MapFrom(x => x.Patient.LastAppointmentDate))
                .ForMember(src => src.NextAppointmentDate, dest => dest.MapFrom(x => x.Patient.NextAppointmentDate))
                .ReverseMap();
        }
    }
}
