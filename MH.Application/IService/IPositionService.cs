using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IPositionService
    {
        Task<List<PositionViewModel>> GetAll();
        Task<PositionViewModel> GetById(int id);
        Task Add(PositionModel position);
        Task Update(PositionModel position);
        Task Delete(int id); 
    }
}
