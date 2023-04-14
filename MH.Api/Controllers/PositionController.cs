using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.IEntity;
using MH.Domain.Model;
using Swashbuckle.AspNetCore.Annotations;
using MH.Domain.ViewModel;

namespace MH.Api.Controllers
{
    [Authorize]
    public class PositionController : BaseController
    {
        private readonly IPositionService _positionService;
        private readonly ICurrentUser _currentUser;

        public PositionController(IPositionService positionService, ICurrentUser currentUser)
        {
            _positionService = positionService;
            _currentUser = currentUser;
        }

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> Add([FromBody] PositionModel model)
        {
            await _positionService.Add(model);
            return Ok();
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Position data", typeof(List<PositionViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            var result = await _positionService.GetAll();
            return Ok(result);
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Position data", typeof(PositionViewModel))]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            var result = await _positionService.GetById(id);
            return Ok(result);
        }

        [HttpPatch]
        [Route("Update")]
        public async Task<ActionResult> Update([FromBody] PositionModel position)
        {
            await _positionService.Update(position);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            await _positionService.Delete(id);
            return Ok();
        }
    }
}
