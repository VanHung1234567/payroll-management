using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application
{
    /// <summary>
    /// Extension method đăng ký DI cho Application layer.
    /// Đăng ký BaseService<> theo scoped để inject vào controller/service khi cần.
    /// </summary>
    public static class ServiceExtensions
    {
        public static IServiceCollection AddApplicationDI(
            this IServiceCollection services)
        {
            //base
            services.AddScoped(typeof(IBaseService<>), typeof(BaseService<>));
            services.AddScoped<ISalaryCompositionService, SalaryCompositionService>();
            services.AddScoped<IOrganizationService, OrganizationService>();
            services.AddScoped<ISalaryCompositionTypeService, SalaryCompositionTypeService>();
            services.AddScoped<ISalaryCompositionSystemService, SalaryCompositionSystemService>();
            services.AddScoped<IGridConfigService, GridConfigService>();
            return services;
        }
    }
}
