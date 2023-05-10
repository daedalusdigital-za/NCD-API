using MH.Api.Authentication;
using MH.Infrastructure.External;

namespace MH.Api.Dependency
{
    public static class ApplicationResolutionConfiguration
    {
        public static IServiceCollection ApplicationServices(this IServiceCollection services)
        {
            services.AddSingleton<TokenHelper>();
            services.AddScoped<ISmsService, SmsService>();
            return services;
        }
    }
}
