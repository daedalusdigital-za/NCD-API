using MH.Application.Enum;
using MH.Application.IService;
using MH.Application.Response;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MH.Api.Authentication;
using MH.Domain.DBModel;
using MH.Domain.Model;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using MH.Domain.ViewModel;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    public class AuthController : BaseController
    {

        private readonly TokenHelper _jwtExt;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly RoleManager<Domain.DBModel.Role> _roleManager;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IConfiguration _configuration;
        private readonly IMapper _mapper;


        public AuthController(
            TokenHelper jwtExt,
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            RoleManager<Domain.DBModel.Role> roleManager,
            IConfiguration configuration,
            IMapper mapper,
            IHttpClientFactory httpClientFactory)
        {
            _jwtExt = jwtExt;
            _userManager = userManager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _configuration = configuration;
            _mapper = mapper;
            _httpClientFactory = httpClientFactory;
        }

        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> Register(RegisterModel registerModel)
        {
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

        [HttpPost]
        [Route("Login")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Login data", typeof(LoginResponse))]
        public async Task<IActionResult> Login([FromBody] LoginModel loginModel)
        {
            var result = await _signInManager.PasswordSignInAsync(loginModel.Email, loginModel.Password, true, false);
            if (!result.Succeeded)
            {
                return BadRequest("Incorrect username/password");
            }

            var user = await GetLoginResult(loginModel.Email);
            if (user == null) return BadRequest("User not found");

            return Ok(user);
        }
        private async Task<LoginResponse?> GetLoginResult(string email)
        {
            var existingUser = await _userManager.Users
                .Include(x => x.UserProfile)
                .Where(x => x.Email == email)
                .FirstOrDefaultAsync();
            if (existingUser != null)
            {
                var userRoles = await _userManager.GetRolesAsync(existingUser);

                var token = await _jwtExt.GetToken(existingUser, userRoles);
                return new LoginResponse()
                {
                    Token = token,
                    Id = existingUser.Id,
                    FirstName = existingUser.UserProfile != null ? existingUser.UserProfile.FirstName : null,
                    LastName = existingUser.UserProfile != null ? existingUser.UserProfile.LastName : null,
                    Email = existingUser.Email,
                    Role = userRoles.ToList()
                };
            }
            return null;
        }
    }
}
