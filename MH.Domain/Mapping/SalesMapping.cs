using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class SalesMapping : Profile
    {
        public SalesMapping()
        {
            CreateMap<SaleModel, Sale>()
                .ForMember(dest => dest.SaleItems, opt => opt.MapFrom(src => src.SaleItems));
                
            CreateMap<Sale, SaleViewModel>()
                .ForMember(dest => dest.SaleItems, opt => opt.MapFrom(src => src.SaleItems))
                .ForMember(dest => dest.CreditNotes, opt => opt.MapFrom(src => 
                    src.CreditNotes != null 
                        ? src.CreditNotes.Where(cn => !cn.IsDeleted).ToList() 
                        : new List<CreditNote>()));

            CreateMap<SaleItemModel, SaleItem>()
                .ForMember(dest => dest.TotalPrice, opt => opt.MapFrom(src => src.Quantity * src.UnitPrice));
                
            CreateMap<SaleItem, SaleItemViewModel>()
                .ForMember(dest => dest.InventoryItemName, opt => opt.MapFrom(src => src.InventoryItem != null ? src.InventoryItem.Description : null));
        }
    }
}