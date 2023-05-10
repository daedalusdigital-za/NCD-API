using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class OtpMapping : Profile
    {
        public OtpMapping()
        {
            CreateMap<Otp,OtpModel>().ReverseMap();
            CreateMap<Otp,OtpViewModel>().ReverseMap();
        }
    }
}
