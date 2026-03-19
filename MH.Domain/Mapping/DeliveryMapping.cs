using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class DeliveryMapping : Profile
    {
        public DeliveryMapping()
        {
            CreateMap<DeliveryModel, Delivery>();
            
            CreateMap<Delivery, DeliveryViewModel>()
                .ForMember(dest => dest.SaleNumber, opt => opt.MapFrom(src => src.Sale != null ? src.Sale.SaleNumber : null));
        }
    }
}
