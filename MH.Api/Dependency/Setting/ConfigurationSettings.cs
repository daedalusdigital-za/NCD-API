using MH.Domain.Configuration;
using MH.Domain.Constant;

namespace MH.Api.Dependency.Setting
{
    public static class ConfigurationSettings
    {
        public static IServiceCollection AddConfigurationService(this IServiceCollection services, IConfiguration configuration)
        {
            var mailSettings = configuration.GetSection(ConfigOptions.MailSettingsConfigName).Get<MailSettings>();
            services.AddSingleton(mailSettings);

            services.Configure<TwilioConfiguration>(configuration.GetSection(ConfigOptions.Twilio));


            return services;
        }
    }
}
