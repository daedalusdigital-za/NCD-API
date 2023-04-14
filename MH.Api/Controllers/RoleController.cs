using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MH.Application.Enum;
using MH.Application.Response;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Application.IService;
using Microsoft.AspNetCore.Authorization;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    public class RoleController : BaseController
    {
        private readonly RoleManager<Domain.DBModel.Role> _roleManager;
        private readonly IRoleService _roleService;
        public RoleController(RoleManager<Domain.DBModel.Role> roleManager, IRoleService roleService)
        {
            _roleManager = roleManager;
            _roleService = roleService;
        }

        [HttpGet]
        [Route("GetRoles")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Role data", typeof(List<RoleViewModel>))]
        public async Task<IActionResult> GetRoles()
        {
            var roles = (await _roleManager.Roles.ToListAsync())
                .Select(x=> new RoleViewModel 
                { 
                    Id = x.Id,
                    Name = x.Name
                });
            return Ok(roles);
        }
        
        [HttpPost]
        [Route("Add")]
        public async Task<IActionResult> Add([FromBody] RoleModel roleModel)
        {
            var role = new Role()
            {
                Name = roleModel.Name,
                NormalizedName = roleModel.Name.ToUpper(),
                ConcurrencyStamp = DateTime.Now.ToString()
            };
            await _roleManager.CreateAsync(role);
            return Ok();
        }
        
        [HttpPatch]
        [Route("Update")]
        public async Task<IActionResult> Update([FromBody] RoleModel roleModel)
        {
            var existingRole = await _roleService.GetById(roleModel.Id);
            if(existingRole != null)
            {
                var role = new Role()
                {
                    Id = existingRole.Id,
                    Name = roleModel.Name,
                    NormalizedName = roleModel.Name.ToUpper(),
                    ConcurrencyStamp = existingRole.ConcurrencyStamp
                };
                await _roleManager.UpdateAsync(role);
                return Ok();
            }
            
            return BadRequest();
        }
    }
}
