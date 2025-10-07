using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Application.IService
{
    public interface ITrainerService
    {
        Task Add(TrainerModel model);
        Task Update(TrainerModel model);
        Task Delete(int id);
        Task<TrainerViewModel?> GetById(int id);
        Task<List<TrainerViewModel>> GetAll();
        Task<List<TrainerViewModel>> GetByProvince(string province);
        Task<List<TrainerViewModel>> GetByStatus(TrainerStatus status);
        Task<TrainerStatsModel> GetTrainerStats(int trainerId);
        Task<bool> IsEmailExists(string email, int? excludeId = null);
    }
}