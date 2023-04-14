
using MH.Domain.DBModel;

namespace MH.Application.IService
{
    public interface IRoleService
    {
        Task<Role> GetById(int id);
    }
}
