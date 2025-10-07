using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
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
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid trainer data")]
        public async Task<ActionResult> Add([FromBody] TrainerModel model)
        {
            try
            {
                // Check if email already exists
                var emailExists = await _trainerService.IsEmailExists(model.Email);
                if (emailExists)
                {
                    return BadRequest(new { message = "Email already exists" });
                }

                await _trainerService.Add(model);
                return Ok(new { message = "Trainer added successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("Update")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainer updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Trainer not found")]
        public async Task<ActionResult> Update([FromBody] TrainerModel model)
        {
            try
            {
                // Check if email already exists for another trainer
                var emailExists = await _trainerService.IsEmailExists(model.Email, model.Id);
                if (emailExists)
                {
                    return BadRequest(new { message = "Email already exists" });
                }

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
        [SwaggerResponse(StatusCodes.Status404NotFound, "Trainer not found")]
        public async Task<ActionResult> Delete([FromQuery] int id)
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

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainer data", typeof(TrainerViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Trainer not found")]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            try
            {
                var result = await _trainerService.GetById(id);
                if (result == null)
                    return NotFound(new { message = "Trainer not found" });
                
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainers data", typeof(List<TrainerViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            try
            {
                var result = await _trainerService.GetAll();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainers by province", typeof(List<TrainerViewModel>))]
        public async Task<ActionResult> GetByProvince([FromQuery] string province)
        {
            try
            {
                var result = await _trainerService.GetByProvince(province);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByStatus")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainers by status", typeof(List<TrainerViewModel>))]
        public async Task<ActionResult> GetByStatus([FromQuery] TrainerStatus status)
        {
            try
            {
                var result = await _trainerService.GetByStatus(status);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Trainer statistics", typeof(TrainerStatsModel))]
        public async Task<ActionResult> GetStats([FromQuery] int id)
        {
            try
            {
                var result = await _trainerService.GetTrainerStats(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}