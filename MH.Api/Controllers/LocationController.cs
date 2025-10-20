using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    public class LocationController : BaseController
    {
        private readonly ILocationService _locationService;

        public LocationController(ILocationService locationService)
        {
            _locationService = locationService;
        }

        [HttpGet]
        [Route("GetProvinces")]
        [SwaggerResponse(StatusCodes.Status200OK, "Provinces data", typeof(List<ProvinceViewModel>))]
        public async Task<ActionResult> GetProvinces()
        {
            try
            {
                var result = await _locationService.GetAllProvinces();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetDistricts")]
        [SwaggerResponse(StatusCodes.Status200OK, "Districts by province", typeof(List<DistrictViewModel>))]
        public async Task<ActionResult> GetDistricts([FromQuery] string province)
        {
            try
            {
                var result = await _locationService.GetDistrictsByProvince(province);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetHospitals")]
        [SwaggerResponse(StatusCodes.Status200OK, "Hospitals data", typeof(List<HospitalViewModel>))]
        public async Task<ActionResult> GetHospitals()
        {
            try
            {
                var result = await _locationService.GetAllHospitals();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetHospitalsByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Hospitals by province", typeof(List<HospitalViewModel>))]
        public async Task<ActionResult> GetHospitalsByProvince([FromQuery] string province)
        {
            try
            {
                var result = await _locationService.GetHospitalsByProvince(province);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetClinics")]
        [SwaggerResponse(StatusCodes.Status200OK, "Clinics data", typeof(List<ClinicViewModel>))]
        public async Task<ActionResult> GetClinics()
        {
            try
            {
                var result = await _locationService.GetAllClinics();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetClinicsByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Clinics by province", typeof(List<ClinicViewModel>))]
        public async Task<ActionResult> GetClinicsByProvince([FromQuery] string province)
        {
            try
            {
                var result = await _locationService.GetClinicsByProvince(province);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}