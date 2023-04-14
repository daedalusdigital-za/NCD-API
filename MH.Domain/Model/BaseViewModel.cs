using MH.Domain.IEntity;

namespace MH.Domain.Model
{
    public class BaseViewModel<TId> : IBaseEntity<TId>
    {
        public TId? Id { get; set; }
    }
}
