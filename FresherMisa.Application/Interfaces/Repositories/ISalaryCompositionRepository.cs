using FresherMisa.Application.Interfaces;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Repositories
{
    public interface ISalaryCompositionRepository : IBaseRepository<SalaryComposition>
    {
        Task<PagingResponse<SalaryComposition>> FilterAsync(SalaryCompositionFilterRequest request);

        Task<SalaryComposition?> GetDetailByIdAsync(Guid salaryCompositionID);

        Task<int> BulkUpdateStatusAsync(string ids, int status);

        Task<int> BulkDeleteAsync(string ids);
    }
}
