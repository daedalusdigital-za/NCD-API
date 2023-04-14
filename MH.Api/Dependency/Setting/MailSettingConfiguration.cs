using MH.Domain.Constant;
using MH.Domain.Settings;

namespace MH.Api.Dependency.Setting
{
    public static class MailSettingConfiguration
    {
        public static IServiceCollection AddMailSettingService(this IServiceCollection services, IConfiguration configuration)
        {
            var mailSettings = configuration.GetSection(ConfigOptions.MailSettingsConfigName).Get<MailSettings>();
            services.AddSingleton(mailSettings);

            return services;
        }
    }
}
