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
    public class MedicalHistoryController : BaseController
    {
        private readonly IMedicalHistoryService _medicalHistoryService;
        private readonly ICurrentUser _currentUser;

        public MedicalHistoryController(IMedicalHistoryService medicalHistoryService, ICurrentUser currentUser)
        {
            _medicalHistoryService = medicalHistoryService;
            _currentUser = currentUser;
        }

        [HttpPost]
        [Route("Add")]
        public async Task<ActionResult> Add([FromForm] MedicalHistoryModel model)
        {
            await _medicalHistoryService.Add(model);
            return Ok();
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return MedicalHistory data", typeof(List<MedicalHistoryViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            var result = await _medicalHistoryService.GetAll();
            return Ok(result);
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return MedicalHistory data", typeof(MedicalHistoryViewModel))]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            var result = await _medicalHistoryService.GetById(id);
            return Ok(result);
        }

        [HttpPatch]
        [Route("Update")]
        public async Task<ActionResult> Update([FromForm] MedicalHistoryModel medicalHistory)
        {
            await _medicalHistoryService.Update(medicalHistory);
            return Ok();
        }

        [HttpDelete]
        [Route("Delete")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            await _medicalHistoryService.Delete(id);
            return Ok();
        }
    }
}
