using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class ApplicationUserMapping : Profile
    {
        public ApplicationUserMapping()
        {
            CreateMap<RegisterModel,ApplicationUser>()
                .ForMember(u => u.UserName, opt => opt.MapFrom(x => x.Email))
                .ForMember(u=>u.PasswordHash, opt=> opt.MapFrom(x=> x.Password))
                .ReverseMap();

            CreateMap<ApplicationUser, UserViewModel>().ReverseMap();

            CreateMap<UserRole, UserRoleViewModel>().ReverseMap();
            CreateMap<Role, RoleViewModel>().ReverseMap();
        }
    }
}
