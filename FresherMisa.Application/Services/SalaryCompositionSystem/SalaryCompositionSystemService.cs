using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.GridConfig;
using FresherMisa.Entities.SalaryCompositionSystem;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Services
{
    public class SalaryCompositionSystemService : BaseService<SalaryCompositionSystem>, ISalaryCompositionSystemService
    {
        private readonly ISalaryCompositionSystemRepository _salaryCompositionSystemRepository;

        public SalaryCompositionSystemService(
            IBaseRepository<SalaryCompositionSystem> baseRepository,
            ISalaryCompositionSystemRepository salaryCompositionSystemRepository
            ) : base(baseRepository)
        {
            _salaryCompositionSystemRepository = salaryCompositionSystemRepository;
        }

        public async Task<ServiceResponse> FilterAsync(SalaryCompositionSystemFilterRequest request)
        {
            var response = await _salaryCompositionSystemRepository.FilterAsync(request);
            return CreateSuccessResponse(response);
        }


        #region OVERRIDE METHODS
        protected override List<ValidationError> ValidateCustom(SalaryCompositionSystem entity)
        {
            return new List<ValidationError>();
        }
        #endregion OVERRIDE METHODS
    }
}
