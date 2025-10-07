using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    public class DashboardController : BaseController
    {
        private readonly IDashboardService _dashboardService;

        public DashboardController(IDashboardService dashboardService)
        {
            _dashboardService = dashboardService;
        }

        [HttpGet]
        [Route("GetTrainingStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training statistics", typeof(TrainingStatsModel))]
        public async Task<ActionResult> GetTrainingStats()
        {
            try
            {
                var result = await _dashboardService.GetTrainingStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetProvinceStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Province statistics", typeof(ProvinceStatsModel))]
        public async Task<ActionResult> GetProvinceStats()
        {
            try
            {
                var result = await _dashboardService.GetProvinceStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetNationalTotals")]
        [SwaggerResponse(StatusCodes.Status200OK, "National totals", typeof(NationalTotalsModel))]
        public async Task<ActionResult> GetNationalTotals()
        {
            try
            {
                var result = await _dashboardService.GetNationalTotals();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetHGTMeterDistribution")]
        [SwaggerResponse(StatusCodes.Status200OK, "HGT Meter distribution", typeof(EquipmentDistributionModel))]
        public async Task<ActionResult> GetHGTMeterDistribution()
        {
            try
            {
                var result = await _dashboardService.GetHGTMeterDistribution();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetHGTStripDistribution")]
        [SwaggerResponse(StatusCodes.Status200OK, "HGT Strip distribution", typeof(EquipmentDistributionModel))]
        public async Task<ActionResult> GetHGTStripDistribution()
        {
            try
            {
                var result = await _dashboardService.GetHGTStripDistribution();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetEquipmentStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Equipment statistics", typeof(EquipmentStatsModel))]
        public async Task<ActionResult> GetEquipmentStats()
        {
            try
            {
                var result = await _dashboardService.GetEquipmentStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetOccupationStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Occupation statistics", typeof(OccupationStatsModel))]
        public async Task<ActionResult> GetOccupationStats()
        {
            try
            {
                var result = await _dashboardService.GetOccupationStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}