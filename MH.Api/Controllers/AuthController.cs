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
using MH.Infrastructure.External;
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
        private readonly ISmsService _smsService;
        private readonly IOtpService _otpService;
        private readonly IUserService _userService;


        public AuthController(
            TokenHelper jwtExt,
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            RoleManager<Domain.DBModel.Role> roleManager,
            IConfiguration configuration,
            IMapper mapper,
            IHttpClientFactory httpClientFactory, 
            ISmsService smsService, 
            IOtpService otpService, 
            IUserService userService)
        {
            _jwtExt = jwtExt;
            _userManager = userManager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _configuration = configuration;
            _mapper = mapper;
            _httpClientFactory = httpClientFactory;
            _smsService = smsService;
            _otpService = otpService;
            _userService = userService;
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
                Status = 0,
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

            var code = new Random().Next(1000, 9999);

            await _otpService.Add(new OtpModel() { Code = code, MobileNo = registerModel.PhoneNumber });
            await _smsService.SendSms(registerModel.PhoneNumber, $"OTP is : {code}");
            
            return Ok();
        }

        [HttpPost]
        [Route("Login")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Login data", typeof(LoginResponse))]
        public async Task<IActionResult> Login([FromBody] LoginModel loginModel)
        {
            await _smsService.SendSms("", "");
            var result = await _signInManager.PasswordSignInAsync(loginModel.Email, loginModel.Password, true, false);
            if (!result.Succeeded)
            {
                return BadRequest("Incorrect username/password");
            }

            var user = await GetLoginResult(loginModel.Email);
            if (user == null) return BadRequest("User not found");

            return Ok(user);
        }

        [HttpPost]
        [Route("VeifyRegistration")]
        [SwaggerResponse(StatusCodes.Status200OK, "Return Login data", typeof(bool))]
        public async Task<bool?> VeifyRegistration([FromQuery] string mobileNo, [FromQuery] int code)
        {
            var otp = await _otpService.GetByMobileNo(mobileNo);

            if (otp == null || otp.Code != code) return false;

            var user = await _userService.GetUserByMobileNo(mobileNo);
            user.Status = 1;
            user.PhoneNumberConfirmed = true;

            await _userManager.UpdateAsync(user);
            return true;
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
