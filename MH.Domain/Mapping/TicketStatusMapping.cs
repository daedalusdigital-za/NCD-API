using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class TicketStatusMapping : Profile
    {
        public TicketStatusMapping()
        {
            CreateMap<TicketStatus,TicketStatusModel>().ReverseMap();
            CreateMap<TicketStatus,TicketStatusViewModel>().ReverseMap();
        }
    }
}
