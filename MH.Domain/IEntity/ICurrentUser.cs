using MH.Domain.DBModel;

namespace MH.Domain.IEntity
{
    public interface ICurrentUser
    {
        public ApplicationUser User { get; }
    }
}
