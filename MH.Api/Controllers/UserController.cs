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
using MH.Application.Response;
using MH.Api.Authentication;

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
        private readonly TokenHelper _jwtExt;
        public UserController(
            UserManager<ApplicationUser> userManager, 
            RoleManager<Role> roleManager, 
            IUserService userService, 
            ICurrentUser currentUser, 
            IMapper mapper, 
            TokenHelper jwtExt
            )
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _userService = userService;
            _currentUser = currentUser;
            _mapper = mapper;
            _jwtExt = jwtExt;
        }

        [HttpPost]
        [Route("Add")]
        public async Task<IActionResult> Add(RegisterModel registerModel)
        {
            if (!await _userService.IsAdmin(_currentUser.User.Id))
            {
                return Forbid("Not authorized to add user");
            }
            var user = new ApplicationUser()
            {
                Email = registerModel.Email,
                UserName = registerModel.Email,
                PasswordHash = registerModel.Password,
                PhoneNumber = registerModel.PhoneNumber,
                Status = 1,
                UserProfile = new UserProfile()
                {
                    FirstName = registerModel.FirstName,
                    LastName = registerModel.LastName,
                }
            };
            var result = await _userManager.CreateAsync(user, user.PasswordHash);
            if (!result.Succeeded)
            {
                var errors = result.Errors.Select(x => x.Description).ToList();
                return BadRequest(errors);
            }
            await _userManager.AddToRoleAsync(user, RoleEnum.Doctor.ToString());
            return Ok();
        }
        [HttpGet]
        [Route("GetUsers")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return User data", typeof(List<UserViewModel>))]

        public async Task<IActionResult> GetUsers()
        {
            if (!await _userService.IsAdmin(_currentUser.User.Id))
            {
                return Forbid("Not authorized to get users");
            }
            var users = await _userManager.Users
                .Include(x => x.UserRoles)
                .ThenInclude(x => x.Role)
                .Include(x => x.UserProfile)
                .Include(x => x.UserProfile.ContactDetails)
                .Include(x => x.UserProfile.ContactDetails.ContactDataType)
                .Include(x => x.UserProfile.ContactDetails.ContactType)
                .Include(x => x.UserProfile.ContactDetails.ContactEntity)
                .Include(x => x.Position)
                .Where(x=> x.Status != 0)
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
            if (!await _userService.CanViewOrEdit(id))
            {
                return Forbid("Not authorized to get user");
            }
            var user = await _userService.GetUserById(id);
            if (user == null) return BadRequest();

            return Ok(user);
        }
        [HttpPatch]
        [Route("UpdateUser")]
        public async Task<IActionResult> UpdateUser(UserUpdateModel user)
        {
            if (!await _userService.CanViewOrEdit(user.Id))
            {
                return Forbid("Not authorized to update password");
            }
            await _userService.UpdateUser(user);
            return Ok();
        }
        [HttpDelete]
        [Route("Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            if (!await _userService.IsAdmin(_currentUser.User.Id))
            {
                return Forbid("Not authorized to delete user");
            }
            await _userService.Delete(id);
            return Ok();
        }
        [HttpPatch]
        [Route("ChangePassword")]
        public async Task<IActionResult> ChangePassword(ChangePasswordModel changePasswordModel)
        {
            if(!await _userService.CanViewOrEdit(changePasswordModel.UserId))
            {
                return Forbid("Not authorized to change password");
            }
            var user = await _userManager.FindByIdAsync(changePasswordModel.UserId.ToString());
            await _userManager.ChangePasswordAsync(user, changePasswordModel.CurrentPassword, changePasswordModel.NewPassword);
            return Ok();
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPatch]
        [Route("ResetPassword")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return User data", typeof(string))]
        public async Task<IActionResult> ResetPassword([FromQuery] int userId)
        {
            if(await _userService.IsAdmin(_currentUser.User.Id))
            {
                var newPassword = "654724135";
                var user = await _userManager.FindByIdAsync(userId.ToString());
                var resetToken = await _userManager.GeneratePasswordResetTokenAsync(user);
                var result = await _userManager.ResetPasswordAsync(user, resetToken, newPassword);
                if(!result.Succeeded)
                {
                    return BadRequest("Failed to reset password");
                }
                return Ok(newPassword);
            }
            return Forbid("Not authorized to reset password");
        }
    }
}
