using MH.Domain.DBModel;
using MH.Domain.ViewModel;

namespace MH.Domain.IRepository
{
    public interface IUserRepository
    {
        Task<ApplicationUser> GetUserById(int id);
        Task<ApplicationUser> GetUserByMobileNo(string mobileNo);
        Task DeleteUserRole(UserRole userRole);
        Task AddUserRole(UserRole userRole);
        Task UpdateUserRole(UserRole userRole);
        Task UpdateUser(ApplicationUser user);
    }
}
