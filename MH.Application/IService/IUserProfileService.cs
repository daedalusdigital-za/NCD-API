using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IUserProfileService
    {
        Task<List<UserProfileViewModel>> GetAll();
        Task<UserProfileViewModel> GetById(int id);
        Task<UserProfileViewModel> GetByUserId(int id);
        Task Add(UserProfileModel userProfile);
        Task Update(UserProfileModel userProfile);
        Task Delete(int id); 
    }
}
