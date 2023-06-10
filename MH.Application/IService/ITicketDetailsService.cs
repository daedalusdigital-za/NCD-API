using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface ITicketDetailsService
    {
        Task<List<TicketDetailsViewModel>> GetAll();
        Task<TicketDetailsViewModel> GetById(int id);
        Task Add(TicketDetailsModel ticketDetails);
        Task Update(TicketDetailsModel ticketDetails);
        Task Delete(int id); 
    }
}
