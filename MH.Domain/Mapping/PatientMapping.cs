using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class PatientMapping : Profile
    {
        public PatientMapping()
        {
            CreateMap<PatientModel,Patient>();
            CreateMap<Patient, PatientViewModel>();
        }
    }
}
