using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Domain.Mapping
{
    public class MedicalHistoryMapping : Profile
    {
        public MedicalHistoryMapping()
        {
            CreateMap<MedicalHistoryModel, MedicalHistory>();
                //.ForMember(d => d.Documents, opt => opt.MapFrom(s => {
                //    MemoryStream ms = new MemoryStream();
                //    s.Documents.CopyTo(ms);
                //    return ms.ToArray();
                //}));
            CreateMap<MedicalHistory,MedicalHistoryViewModel>().ReverseMap();
        }
    }
}
