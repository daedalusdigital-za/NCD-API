using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.IService
{
    public interface ITrainerService
    {
        Task<TrainerViewModel?> GetById(int id);
        Task<List<TrainerViewModel>> GetAll();
        Task Add(TrainerModel model);
        Task Update(TrainerModel model);
        Task Delete(int id);
    }
}
