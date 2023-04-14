using AutoMapper;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MH.Application.IService
{
    public interface IPermissionService
    {
        Task<List<PermissionViewModel>> GetAllPermission();
    }
}
