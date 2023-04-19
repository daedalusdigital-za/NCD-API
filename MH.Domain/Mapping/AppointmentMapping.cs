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
                //.ForMember(src => src.Name, dest => dest.MapFrom(x => $"{x.User.UserProfile.FirstName} {x.User.UserProfile.LastName}"))
                //.ForMember(src => src.PhoneNumber, dest => dest.MapFrom(x => x.User.PhoneNumber))
                //.ForMember(src => src.Email, dest => dest.MapFrom(x => x.User.Email))
                .ReverseMap();
        }
    }
}
