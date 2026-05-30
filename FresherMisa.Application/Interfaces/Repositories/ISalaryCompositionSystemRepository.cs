using FresherMisa.Application.Interfaces;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionSystem;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Repositories
{
    public interface ISalaryCompositionSystemRepository : IBaseRepository<SalaryCompositionSystem>
    {
        Task<PagingResponse<SalaryCompositionSystem>> FilterAsync(SalaryCompositionSystemFilterRequest request);
    }
}
