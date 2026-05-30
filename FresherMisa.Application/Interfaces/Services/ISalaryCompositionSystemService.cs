using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionSystem;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Services
{
    public interface ISalaryCompositionSystemService : IBaseService<SalaryCompositionSystem>
    {
        Task<ServiceResponse> FilterAsync(SalaryCompositionSystemFilterRequest request);
    }
}
