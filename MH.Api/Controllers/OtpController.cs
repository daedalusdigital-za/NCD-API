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
    public class OtpController : BaseController
    {
        private readonly IOtpService _otpService;
        private readonly ICurrentUser _currentUser;

        public OtpController(IOtpService otpService, ICurrentUser currentUser)
        {
            _otpService = otpService;
            _currentUser = currentUser;
        }

        //[HttpPost]
        //[Route("Add")]
        //public async Task<ActionResult> Add([FromBody] OtpModel model)
        //{
        //    await _otpService.Add(model);
        //    return Ok();
        //}

        //[HttpGet]
        //[Route("GetAll")]
        //[SwaggerResponse(StatusCodes.Status200OK, "Return Otp data", typeof(List<OtpViewModel>))]
        //public async Task<ActionResult> GetAll()
        //{
        //    var result = await _otpService.GetAll();
        //    return Ok(result);
        //}

        //[HttpGet]
        //[Route("GetById")]
        //[SwaggerResponse(StatusCodes.Status200OK, "Return Otp data", typeof(OtpViewModel))]
        //public async Task<ActionResult> GetById([FromQuery] int id)
        //{
        //    var result = await _otpService.GetById(id);
        //    return Ok(result);
        //}

        //[HttpPatch]
        //[Route("Update")]
        //public async Task<ActionResult> Update([FromBody] OtpModel otp)
        //{
        //    await _otpService.Update(otp);
        //    return Ok();
        //}

        //[HttpDelete]
        //[Route("Delete")]
        //public async Task<ActionResult> Delete([FromQuery] int id)
        //{
        //    await _otpService.Delete(id);
        //    return Ok();
        //}
    }
}
