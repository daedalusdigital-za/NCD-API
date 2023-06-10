using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface ITicketStatusService
    {
        Task<List<TicketStatusViewModel>> GetAll();
        Task<TicketStatusViewModel> GetById(int id);
        Task Add(TicketStatusModel ticketStatus);
        Task Update(TicketStatusModel ticketStatus);
        Task Delete(int id); 
    }
}
