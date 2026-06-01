using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Services
{
    public interface ISalaryCompositionService : IBaseService<SalaryComposition>
    {
        Task<ServiceResponse> FilterAsync(SalaryCompositionFilterRequest request);

        Task<ServiceResponse> GetDetailByIdAsync(Guid salaryCompositionID);

        Task<ServiceResponse> BulkUpdateStatusAsync(BulkUpdateSalaryStatusRequest request);

        Task<ServiceResponse> BulkDeleteAsync(BulkDeleteSalaryCompositionRequest request);
    }
}
