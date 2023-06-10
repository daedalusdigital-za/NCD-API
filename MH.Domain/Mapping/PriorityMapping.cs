using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class PriorityMapping : Profile
    {
        public PriorityMapping()
        {
            CreateMap<Priority,PriorityModel>().ReverseMap();
            CreateMap<Priority,PriorityViewModel>().ReverseMap();
        }
    }
}
