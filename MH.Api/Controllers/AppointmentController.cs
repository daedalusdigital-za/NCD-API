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
    public class AppointmentController : BaseController
    {
        private readonly IAppointmentService _appointmentService;
        private readonly ICurrentUser _currentUser;

        public AppointmentController(IAppointmentService appointmentService, ICurrentUser currentUser)
        {
            _appointmentService = appointmentService;
            _currentUser = currentUser;
        }

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> Add([FromBody] AppointmentModel model)
        {
            await _appointmentService.Add(model);
            return Ok();
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Appointment data", typeof(List<AppointmentViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            var result = await _appointmentService.GetAll();
            return Ok(result);
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Appointment data", typeof(AppointmentViewModel))]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            var result = await _appointmentService.GetById(id);
            return Ok(result);
        }

        [HttpGet]
        [Route("GetByPatientId")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Appointments data", typeof(List<AppointmentViewModel>))]
        public async Task<ActionResult> GetByPatientId([FromQuery] int patientId)
        {
            var result = await _appointmentService.GetByPatientId(patientId);
            return Ok(result);
        }

        [HttpPatch]
        [Route("Update")]
        public async Task<ActionResult> Update([FromBody] AppointmentModel appointment)
        {
            await _appointmentService.Update(appointment);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            await _appointmentService.Delete(id);
            return Ok();
        }
    }
}
