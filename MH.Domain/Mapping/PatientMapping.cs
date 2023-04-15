using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class PatientMapping : Profile
    {
        public PatientMapping()
        {
            CreateMap<Patient,PatientModel>().ReverseMap();
            CreateMap<Patient, PatientViewModel>()
                .ForMember(src => src.Name, dest => dest.MapFrom(x => $"{x.User.UserProfile.FirstName} {x.User.UserProfile.LastName}"));
        }
    }
}
