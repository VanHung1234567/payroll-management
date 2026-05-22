using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Services;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Services
{
    public class SalaryCompositionService : BaseService<SalaryComposition>, ISalaryCompositionService
    {
        private readonly ISalaryCompositionRepository _salaryCompositionRepository;

        public SalaryCompositionService(
            IBaseRepository<SalaryComposition> baseRepository,
            ISalaryCompositionRepository salaryCompositionRepository
            ) : base(baseRepository)
        {
            _salaryCompositionRepository = salaryCompositionRepository;
        }


        #region OVERRIDE METHODS
        protected override async Task<bool> ValidateBeforeDeleteAsync(Guid entityId)
        {
            bool hasEmployee = true;

            return !hasEmployee;
        }

        /// <summary>
        /// Validate tùy chỉnh cho SalaryComposition
        /// </summary>
        protected override List<ValidationError> ValidateCustom(SalaryComposition salaryComposition)
        {
            var errors = new List<ValidationError>();

            // Ví dụ: Kiểm tra mã phòng ban không được vượt quá 20 ký tự
            if (!string.IsNullOrEmpty(salaryComposition.SalaryCompositionCode) && salaryComposition.SalaryCompositionCode.Length > 20)
            {
                errors.Add(new ValidationError("SalaryCompositionCode", "Mã thành phần lương không được vượt quá 20 ký tự"));
            }

            return errors;
        }
        #endregion OVERRIDE METHODS
    }
}
