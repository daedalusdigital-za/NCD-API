using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class TicketDetailsMapping : Profile
    {
        public TicketDetailsMapping()
        {
            CreateMap<TicketDetails,TicketDetailsModel>().ReverseMap();
            CreateMap<TicketDetails,TicketDetailsViewModel>().ReverseMap();
        }
    }
}
