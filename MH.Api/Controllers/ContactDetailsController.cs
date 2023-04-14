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
    public class ContactDetailsController : BaseController
    {
        private readonly IContactDetailsService _contactDetailsService;
        private readonly ICurrentUser _currentUser;

        public ContactDetailsController(IContactDetailsService contactDetailsService, ICurrentUser currentUser)
        {
            _contactDetailsService = contactDetailsService;
            _currentUser = currentUser;
        }

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> Add([FromBody] ContactDetailsModel model)
        {
            await _contactDetailsService.Add(model);
            return Ok();
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return ContactDetails data", typeof(List<ContactDetailsViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            var result = await _contactDetailsService.GetAll();
            return Ok(result);
        }

        [HttpGet]
        [Route("GetByUserId")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return ContactDetails data", typeof(ContactDetailsViewModel))]
        public async Task<ActionResult> GetByUserId([FromQuery] int userId)
        {
            var result = await _contactDetailsService.GetByUserId(userId);
            return Ok(result);
        }

        [HttpPatch]
        [Route("Update")]
        public async Task<ActionResult> Update([FromBody] ContactDetailsModel contactDetails)
        {
            await _contactDetailsService.Update(contactDetails);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            await _contactDetailsService.Delete(id);
            return Ok();
        }
    }
}
