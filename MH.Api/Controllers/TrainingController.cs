using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    public class TrainingController : BaseController
    {
        private readonly ITrainingSessionService _trainingSessionService;

        public TrainingController(ITrainingSessionService trainingSessionService)
        {
            _trainingSessionService = trainingSessionService;
        }

        [HttpPost]
        [Route("Add")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session added successfully")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid training session data")]
        public async Task<ActionResult> Add([FromBody] TrainingSessionModel model)
        {
            try
            {
                await _trainingSessionService.Add(model);
                return Ok(new { message = "Training session added successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("Update")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Training session not found")]
        public async Task<ActionResult> Update([FromBody] TrainingSessionModel model)
        {
            try
            {
                await _trainingSessionService.Update(model);
                return Ok(new { message = "Training session updated successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("Delete")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session deleted successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Training session not found")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            try
            {
                await _trainingSessionService.Delete(id);
                return Ok(new { message = "Training session deleted successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session data", typeof(TrainingSessionViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Training session not found")]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            try
            {
                var result = await _trainingSessionService.GetById(id);
                if (result == null)
                    return NotFound(new { message = "Training session not found" });
                
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions data", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            try
            {
                var result = await _trainingSessionService.GetAll();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by province", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByProvince([FromQuery] int provinceId)
        {
            try
            {
                var result = await _trainingSessionService.GetByProvince(provinceId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByDateRange")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by date range", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByDateRange([FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            try
            {
                var result = await _trainingSessionService.GetByDateRange(startDate, endDate);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByTrainer")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by trainer", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByTrainer([FromQuery] int trainerId)
        {
            try
            {
                var result = await _trainingSessionService.GetByTrainer(trainerId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByStatus")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by status", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByStatus([FromQuery] TrainingStatus status)
        {
            try
            {
                var result = await _trainingSessionService.GetByStatus(status);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training statistics", typeof(TrainingStatsModel))]
        public async Task<ActionResult> GetStats()
        {
            try
            {
                var result = await _trainingSessionService.GetTrainingStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}