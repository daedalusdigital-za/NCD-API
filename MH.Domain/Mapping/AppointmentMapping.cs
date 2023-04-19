using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class AppointmentMapping : Profile
    {
        public AppointmentMapping()
        {
            CreateMap<Appointment,AppointmentModel>().ReverseMap();
            CreateMap<Appointment,AppointmentViewModel>()
                .ForMember(src => src.Name, dest => dest.MapFrom(x => x.Patient.Name))
                .ForMember(src => src.Surname, dest => dest.MapFrom(x => x.Patient.Surname))
                .ForMember(src => src.PhoneNumber, dest => dest.MapFrom(x => x.Patient.PhoneNumber))
                .ForMember(src => src.Gender, dest => dest.MapFrom(x => x.Patient.Gender))
                .ForMember(src => src.Age, dest => dest.MapFrom(x => x.Patient.Age))
                .ReverseMap();
        }
    }
}
