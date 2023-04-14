using MH.Application.IService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MH.Api.Controllers
{
    [Authorize]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class PermissionController : BaseController
    {
        private readonly IPermissionService _permissionService;
        public PermissionController(IPermissionService permissionService)
        {
            _permissionService = permissionService;
        }

        [HttpGet]
        [Route("GetAllPermission")]
        public async Task<IActionResult> GetAllPermission()
        {
            var data = await _permissionService.GetAllPermission();
            return Ok(data);
        }
    }
}
