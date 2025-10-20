using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    public class TrainerController : BaseController
    {
        private readonly ITrainerService _trainerService;

        public TrainerController(ITrainerService trainerService)
        {
            _trainerService = trainerService;
        }

        [HttpPost]
        [Route("Add")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainer added successfully")]
        public async Task<IActionResult> Add([FromBody] TrainerModel model)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            await _trainerService.Add(model);
            return Ok(new { message = "Trainer added successfully" });
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Trainer data", typeof(List<TrainerViewModel>))]
        public async Task<IActionResult> GetAll()
        {
            var result = await _trainerService.GetAll();
            return Ok(result);
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Trainer data", typeof(TrainerViewModel))]
        public async Task<IActionResult> GetById([FromQuery] int id)
        {
            var result = await _trainerService.GetById(id);
            if (result == null)
                return NotFound(new { message = "Trainer not found" });

            return Ok(result);
        }

        [HttpPatch]
        [Route("Update")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainer updated successfully")]
        public async Task<IActionResult> Update([FromBody] TrainerModel model)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                await _trainerService.Update(model);
                return Ok(new { message = "Trainer updated successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("Delete")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainer deleted successfully")]
        public async Task<IActionResult> Delete([FromQuery] int id)
        {
            try
            {
                await _trainerService.Delete(id);
                return Ok(new { message = "Trainer deleted successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}
