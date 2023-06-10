using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IIssueService
    {
        Task<List<IssueViewModel>> GetAll();
        Task<IssueViewModel> GetById(int id);
        Task Add(IssueModel issue);
        Task Update(IssueModel issue);
        Task Delete(int id); 
    }
}
