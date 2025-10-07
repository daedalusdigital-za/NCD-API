using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class InventoryMapping : Profile
    {
        public InventoryMapping()
        {
            CreateMap<InventoryItemModel, InventoryItem>();
            CreateMap<InventoryItem, InventoryItemViewModel>()
                .ForMember(dest => dest.CategoryText, opt => opt.MapFrom(src => src.Category.ToString()))
                .ForMember(dest => dest.StatusText, opt => opt.MapFrom(src => src.Status.ToString()))
                .ForMember(dest => dest.CreatedByUserName, opt => opt.MapFrom(src => 
                    src.CreatedByUser != null && src.CreatedByUser.UserProfile != null ? 
                    src.CreatedByUser.UserProfile.FirstName + " " + src.CreatedByUser.UserProfile.LastName : string.Empty));

            // Product mappings commented out until ProductModel and ProductViewModel are created
            // CreateMap<ProductModel, Product>();
            // CreateMap<Product, ProductViewModel>();
        }
    }
}