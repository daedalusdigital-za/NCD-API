﻿using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.IService
{
    public interface IUserService
    {
        Task<UserViewModel> GetUserById(int id);
        Task<ApplicationUser> GetUserByMobileNo(string mobileNo);
        Task UpdateUser(UserUpdateModel user);
        Task Delete(int id);
        Task<bool> IsAdmin(int userId);
        Task<bool> CanViewOrEdit(int userId);
    }
}
