using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class CreditNoteMapping : Profile
    {
        public CreditNoteMapping()
        {
            // Entity to ViewModel mappings
            CreateMap<CreditNote, CreditNoteViewModel>()
                .ForMember(dest => dest.UploadedDocument, opt => opt.MapFrom(src => 
                    !string.IsNullOrEmpty(src.DocumentFileName) 
                        ? new UploadedDocumentViewModel
                        {
                            FileName = src.DocumentFileName,
                            FileUrl = src.DocumentFileUrl ?? string.Empty,
                            UploadedDate = src.DocumentUploadedDate ?? DateTime.MinValue
                        }
                        : null));

            CreateMap<CreditNote, CreditNoteSummaryViewModel>();

            // DTO to Entity mappings
            CreateMap<CreateCreditNoteDto, CreditNote>()
                .ForMember(dest => dest.Id, opt => opt.Ignore())
                .ForMember(dest => dest.CreditNoteNumber, opt => opt.Ignore())
                .ForMember(dest => dest.InvoiceNumber, opt => opt.Ignore())
                .ForMember(dest => dest.CustomerId, opt => opt.Ignore())
                .ForMember(dest => dest.CustomerName, opt => opt.Ignore())
                .ForMember(dest => dest.OriginalAmount, opt => opt.Ignore())
                .ForMember(dest => dest.Status, opt => opt.Ignore())
                .ForMember(dest => dest.DateCreated, opt => opt.Ignore())
                .ForMember(dest => dest.CreatedBy, opt => opt.Ignore())
                .ForMember(dest => dest.LastUpdated, opt => opt.Ignore())
                .ForMember(dest => dest.UpdatedBy, opt => opt.Ignore())
                .ForMember(dest => dest.IsDeleted, opt => opt.Ignore());

            CreateMap<UpdateCreditNoteDto, CreditNote>()
                .ForAllMembers(opt => opt.Condition((src, dest, srcMember) => srcMember != null));
        }
    }
}
