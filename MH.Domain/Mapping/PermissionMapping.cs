using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class PermissionMapping : Profile
    {
        public PermissionMapping()
        {
            CreateMap<PermissionViewModel, Permission>()
                .ReverseMap();
        }
    }
}
