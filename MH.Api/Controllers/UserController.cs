using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using Microsoft.AspNetCore.Authorization;
using MH.Application.Enum;
using MH.Domain.IEntity;
using AutoMapper;
using Swashbuckle.AspNetCore.Annotations;
using static Microsoft.ApplicationInsights.MetricDimensionNames.TelemetryContext;

namespace MH.Api.Controllers
{
    [Authorize]
    public class UserController : BaseController
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<Role> _roleManager;
        private readonly IUserService _userService;
        private readonly ICurrentUser _currentUser;
        private readonly IMapper _mapper;
        public UserController(UserManager<ApplicationUser> userManager, RoleManager<Role> roleManager, IUserService userService, ICurrentUser currentUser = null, IMapper mapper = null)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _userService = userService;
            _currentUser = currentUser;
            _mapper = mapper;
        }

        [HttpPost]
        [Route("Add")]
        public async Task<IActionResult> Add(RegisterModel registerModel)
        {
            var user = new ApplicationUser()
            {
                Email = registerModel.Email,
                UserName = registerModel.Email,
                PasswordHash = registerModel.Password,
                Status = 1
            };
            await CreateNewUser(user);
            return Ok();
        }
        [HttpGet]
        [Route("GetUsers")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return User data", typeof(List<UserViewModel>))]

        public async Task<IActionResult> GetUsers()
        {
            var users = await _userManager.Users
                .Include(x => x.UserRoles)
                .ThenInclude(x => x.Role)
                .Include(x => x.UserProfile)
                .Include(x => x.UserProfile.ContactDetails)
                .Include(x => x.UserProfile.ContactDetails.ContactDataType)
                .Include(x => x.UserProfile.ContactDetails.ContactType)
                .Include(x => x.UserProfile.ContactDetails.ContactEntity)
                .Include(x => x.Position)
                .Select(user => new UserViewModel {
                    Id = user.Id,
                    FirstName = user.UserProfile != null ? user.UserProfile.FirstName : "",
                    LastName = user.UserProfile != null ? user.UserProfile.LastName : "",
                    Email = user.Email,
                    PhoneNumber = user.PhoneNumber,

                    PositionName = user.Position != null ? user.Position.Name : null,
                    PositionDesc = user.Position != null ? user.Position.Description : null,

                    ContactName = user.UserProfile.ContactDetails != null ? user.UserProfile.ContactDetails.Name : null,
                    ContactDataTypeId = user.UserProfile.ContactDetails != null? user.UserProfile.ContactDetails.ContactDataTypeId : null,
                    ContactDataTypeName = user.UserProfile.ContactDetails != null ? user.UserProfile.ContactDetails.Name : null,
                    ContactTypeId = user.UserProfile.ContactDetails != null ? user.UserProfile.ContactDetails.ContactTypeId : null,
                    ContactTypeName = user.UserProfile.ContactDetails != null ? user.UserProfile.ContactDetails.Name : null,
                    ContactEntityId = user.UserProfile.ContactDetails != null ? user.UserProfile.ContactDetails.ContactEntityId : null,
                    ContactEntityName = user.UserProfile.ContactDetails != null ? user.UserProfile.ContactDetails.Name : null,
                    ContactData = user.UserProfile.ContactDetails != null ? user.UserProfile.ContactDetails.Data : null,

                    UserRoles = user.UserRoles.Select(y => y.Role.Name).ToList()
                })
                .ToListAsync();
            return Ok(users);
        }
        
        [HttpGet]
        [Route("GetUserById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return User data", typeof(UserViewModel))]
        public async Task<IActionResult> GetUserById(int id)
        {
            var user = await _userService.GetUserById(id);
            if (user == null) return BadRequest();

            return Ok(user);
        }
        [HttpPatch]
        [Route("UpdateUser")]
        public async Task<IActionResult> UpdateUser(UserModel user)
        {
            await _userService.UpdateUser(user);
            return Ok();
        }
        [HttpDelete]
        [Route("Delete")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<IActionResult> Delete(int id)
        {
            await _userService.Delete(id);
            return Ok();
        }
        [HttpPatch]
        [Route("ChangePassword")]
        public async Task<IActionResult> ChangePassword(ChangePasswordModel changePasswordModel)
        {
            if(!await _userService.CanViewOrEdit(changePasswordModel.UserId))
            {
                return Forbid();
            }
            var user = await _userManager.FindByIdAsync(changePasswordModel.UserId.ToString());
            await _userManager.ChangePasswordAsync(user, changePasswordModel.CurrentPassword, changePasswordModel.NewPassword);
            return Ok();
        }
        [HttpPatch]
        [Route("ResetPassword")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public async Task<IActionResult> ResetPassword(ResetPasswordModel resetPasswordModel)
        {
            var user = await _userManager.FindByIdAsync(_currentUser.User.Id.ToString());
            await _userManager.ChangePasswordAsync(user, resetPasswordModel.CurrentPassword, resetPasswordModel.NewPassword);
            return Ok();
        }

        private async Task CreateNewUser(ApplicationUser user)
        {
            var result = await _userManager.CreateAsync(user, user.PasswordHash);
            if (!result.Succeeded)
            {
                var errors = result.Errors.Select(x => x.Description).ToList();
                throw new Exception(errors.ToString());
            }
            await _userManager.AddToRoleAsync(user, RoleEnum.User.ToString());
        }
    }
}
