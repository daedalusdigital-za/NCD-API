using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class PositionMapping : Profile
    {
        public PositionMapping()
        {
            CreateMap<Position,PositionModel>().ReverseMap();
            CreateMap<Position,PositionViewModel>().ReverseMap();
        }
    }
}
