using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IPriorityService
    {
        Task<List<PriorityViewModel>> GetAll();
        Task<PriorityViewModel> GetById(int id);
        Task Add(PriorityModel priority);
        Task Update(PriorityModel priority);
        Task Delete(int id); 
    }
}
