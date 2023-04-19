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
            CreateMap<MedicalHistory,MedicalHistoryViewModel>()
                .ForMember(src => src.PatientName, dest => dest.MapFrom(x => $"{x.Patient.User.UserProfile.FirstName} {x.Patient.User.UserProfile.LastName}"))
                .ForMember(src => src.PatientPhoneNumber, dest => dest.MapFrom(x => x.Patient.User.PhoneNumber))
                .ForMember(src => src.PatientPhoneNumber, dest => dest.MapFrom(x => x.Patient.User.PhoneNumber))
                .ReverseMap();
        }
    }
}
