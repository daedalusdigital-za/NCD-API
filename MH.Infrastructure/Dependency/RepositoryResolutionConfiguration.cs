using Microsoft.Extensions.DependencyInjection;
using MH.Domain.IRepository;
using MH.Infrastructure.Repository;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Dependency
{
    public static class RepositoryResolutionConfiguration
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
        {
            #region Repositories
            services.AddScoped<IOtpRepository, OtpRepository>();
            services.AddScoped<IAppointmentRepository, AppointmentRepository>();
            services.AddScoped<IMedicalHistoryRepository, MedicalHistoryRepository>();
            services.AddScoped<IPatientRepository, PatientRepository>();
            services.AddScoped<IContactDetailsRepository, ContactDetailsRepository>();
            services.AddScoped<IPositionRepository, PositionRepository>();
            services.AddScoped<IRoleRepository, RoleRepository>();
            services.AddScoped<IUserProfileRepository, UserProfileRepository>();
            //services.AddScoped(typeof(Domain.IRepository.IRepository<typeof(Script),int>), typeof(Repository.Repository<typeof(Script),int>));
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IRepository<Permission, int>, Repository<Permission,int>>();
            #endregion
            return services;
        }
    }
}
