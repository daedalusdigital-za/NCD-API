using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Domain.Mapping
{
    public class IssueMapping : Profile
    {
        public IssueMapping()
        {
            CreateMap<Issue,IssueModel>().ReverseMap();
            CreateMap<Issue,IssueViewModel>().ReverseMap();
        }
    }
}
