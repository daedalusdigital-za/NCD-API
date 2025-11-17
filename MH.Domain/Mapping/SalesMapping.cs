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
                .ForMember(dest => dest.Province, opt => opt.MapFrom(src => src.Province != null ? src.Province.Name : null))
                .ForMember(dest => dest.Hospital, opt => opt.MapFrom(src => src.CustomerName))
                .ForMember(dest => dest.CustomerContactName, opt => opt.MapFrom(src => src.CustomerName))
                .ForMember(dest => dest.CustomerContactEmail, opt => opt.MapFrom(src => src.CustomerEmail))
                .ForMember(dest => dest.CustomerContactPhone, opt => opt.MapFrom(src => src.CustomerPhone))
                .ForMember(dest => dest.PaymentMethodText, opt => opt.MapFrom(src => src.PaymentMethod.ToString()))
                .ForMember(dest => dest.PaymentStatusText, opt => opt.MapFrom(src => src.PaymentStatus.ToString()))
                .ForMember(dest => dest.DeliveryStatusText, opt => opt.MapFrom(src => src.DeliveryStatus.ToString()))
                .ForMember(dest => dest.SaleItems, opt => opt.MapFrom(src => src.SaleItems));

            CreateMap<SaleItemModel, SaleItem>()
                .ForMember(dest => dest.TotalPrice, opt => opt.MapFrom(src => src.Quantity * src.UnitPrice));
                
            CreateMap<SaleItem, SaleItemViewModel>();

            CreateMap<Delivery, DeliveryViewModel>()
                .ForMember(dest => dest.StatusText, opt => opt.MapFrom(src => src.Status.ToString()));
        }
    }

    public class DeliveryViewModel
    {
        public int? Id { get; set; }
        public string DeliveryNumber { get; set; } = null!;
        public int SaleId { get; set; }
        public string InstitutionName { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string ItemDescription { get; set; } = null!;
        public int Quantity { get; set; }
        public DateTime DeliveryDate { get; set; }
        public string InvoiceNumber { get; set; } = null!;
        public DeliveryTrackingStatus Status { get; set; }
        public string? StatusText { get; set; }
        public string? DriverName { get; set; }
        public string? VehicleNumber { get; set; }
        public string? RecipientName { get; set; }
        public DateTime? ReceivedDate { get; set; }
        public string? Notes { get; set; }
        public DateTime DateCreated { get; set; }
    }
}