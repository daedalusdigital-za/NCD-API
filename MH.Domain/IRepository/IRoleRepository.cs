
using MH.Domain.DBModel;

namespace MH.Domain.IRepository
{
    public interface IRoleRepository
    {
        Task<Role> GetById(int id);
    }
}
