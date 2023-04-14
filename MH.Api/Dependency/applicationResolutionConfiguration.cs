using MH.Api.Authentication;
using MH.Application.IService;
using MH.Application.Service;
using MH.Domain.DBModel;
using MH.Domain.IRepository;

namespace MH.Api.Dependency
{
    public static class ApplicationResolutionConfiguration
    {
        public static IServiceCollection ApplicationServices(this IServiceCollection services)
        {
            services.AddSingleton<TokenHelper>();
            return services;
        }
    }
}
