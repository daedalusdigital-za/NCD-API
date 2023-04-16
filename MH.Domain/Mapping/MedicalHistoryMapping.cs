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
            CreateMap<MedicalHistory,MedicalHistoryModel>()
                .ForSourceMember(x => x.Documents, y => y.DoNotValidate())
                .ForSourceMember(x => x.Perscription, y => y.DoNotValidate());
            CreateMap<MedicalHistory,MedicalHistoryViewModel>().ReverseMap();
        }
    }
}
