using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IContactDetailsService
    {
        Task<List<ContactDetailsViewModel>> GetAll();
        Task<ContactDetailsViewModel> GetByUserId(int userId);
        Task Add(ContactDetailsModel contactDetails);
        Task Update(ContactDetailsModel contactDetails);
        Task Delete(int id); 
    }
}
