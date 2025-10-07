using MH.Application.IService;
using MH.Application.Mail;
using MH.Application.Service;
using MH.Domain.Constant;
using MH.Domain.IEntity;
using MH.Domain.UnitOfWork;
using MH.Infrastructure.UnitOfWork;
using Microsoft.Extensions.DependencyInjection;
using System.Configuration;

namespace MH.Application.Dependency
{
    public static class ServiceResolutionConfiguration
    {
        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            #region Services
            services.AddScoped<IIssueService, IssueService>();
            services.AddScoped<ITicketDetailsService, TicketDetailsService>();
            services.AddScoped<IPriorityService, PriorityService>();
            services.AddScoped<ITicketStatusService, TicketStatusService>();
            services.AddScoped<IOtpService, OtpService>();
            services.AddScoped<IAppointmentService, AppointmentService>();
            services.AddScoped<IMedicalHistoryService, MedicalHistoryService>();
            services.AddScoped<IPatientService, PatientService>();
            services.AddScoped<IContactDetailsService, ContactDetailsService>();
            services.AddScoped<IPositionService, PositionService>();
            services.AddScoped<IUserProfileService, UserProfileService>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<ICurrentUser, CurrentUser>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IPermissionService, PermissionService>();
            services.AddScoped<IMailHelper, MailHelper>();
            services.AddScoped<IRoleService, RoleService>();

            // New services for NDCANGU functionality
            services.AddScoped<ITrainingSessionService, TrainingSessionService>();
            services.AddScoped<ITrainerService, TrainerService>();
            services.AddScoped<IInventoryItemService, InventoryItemService>();
            services.AddScoped<ISaleService, SaleService>();
            services.AddScoped<ILocationService, LocationService>();
            services.AddScoped<IDashboardService, DashboardService>();
            #endregion

            return services;
        }
    }
}
