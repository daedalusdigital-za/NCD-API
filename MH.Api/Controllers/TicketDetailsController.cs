using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.IEntity;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    public class TicketDetailsController : BaseController
    {
        private readonly ITicketDetailsService _ticketDetailsService;
        private readonly ICurrentUser _currentUser;

        public TicketDetailsController(ITicketDetailsService ticketDetailsService, ICurrentUser currentUser)
        {
            _ticketDetailsService = ticketDetailsService;
            _currentUser = currentUser;
        }

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> Add([FromBody] TicketDetailsModel model)
        {
            await _ticketDetailsService.Add(model);
            return Ok();
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return TicketDetails data", typeof(List<TicketDetailsViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            var result = await _ticketDetailsService.GetAll();
            return Ok(result);
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return TicketDetails data", typeof(TicketDetailsViewModel))]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            var result = await _ticketDetailsService.GetById(id);
            return Ok(result);
        }

        [HttpPatch]
        [Route("Update")]
        public async Task<ActionResult> Update([FromBody] TicketDetailsModel ticketDetails)
        {
            await _ticketDetailsService.Update(ticketDetails);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            await _ticketDetailsService.Delete(id);
            return Ok();
        }
    }
}
