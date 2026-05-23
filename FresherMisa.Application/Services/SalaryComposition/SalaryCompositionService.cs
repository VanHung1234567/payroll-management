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
        //protected override async Task<bool> ValidateBeforeDeleteAsync(Guid entityId)
        //{
        //    return Task.FromResult(true);
        //}

        /// <summary>
        /// Validate tùy chỉnh cho SalaryComposition
        /// </summary>
        protected override List<ValidationError> ValidateCustom(SalaryComposition entity)
        {
            var errors = new List<ValidationError>();

            if (string.IsNullOrWhiteSpace(entity.SalaryCompositionCode))
            {
                errors.Add(new ValidationError(
                    "SalaryCompositionCode",
                    "Mã TPL không được để trống"
                ));
            }
            else if (entity.SalaryCompositionCode.Length > 255)
            {
                errors.Add(new ValidationError(
                    "SalaryCompositionCode",
                    "Mã TPL tối đa 255 ký tự"
                ));
            }

            if (string.IsNullOrWhiteSpace(entity.SalaryCompositionName))
            {
                errors.Add(new ValidationError(
                    "SalaryCompositionName",
                    "Tên TPL không được để trống"
                ));
            }
            else if (entity.SalaryCompositionName.Length > 255)
            {
                errors.Add(new ValidationError(
                    "SalaryCompositionName",
                    "Tên TPL tối đa 255 ký tự"
                ));
            }

            if (entity.OrganizationID == Guid.Empty)
            {
                errors.Add(new ValidationError(
                    "OrganizationID",
                    "Đơn vị áp dụng không được để trống"
                ));
            }

            if (entity.SalaryCompositionTypeID == Guid.Empty)
            {
                errors.Add(new ValidationError(
                    "SalaryCompositionTypeID",
                    "Loại thành phần không được để trống"
                ));
            }

            if (entity.Nature == null || entity.Nature <= 0)
            {
                errors.Add(new ValidationError(
                    "Nature",
                    "Tính chất không được để trống"
                ));
            }

            return errors;
        }
        #endregion OVERRIDE METHODS
    }
}
