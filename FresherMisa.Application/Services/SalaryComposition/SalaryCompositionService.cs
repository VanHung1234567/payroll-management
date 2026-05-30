using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.Enums;
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

        public async Task<ServiceResponse> FilterAsync(SalaryCompositionFilterRequest request)
        {
            var response = await _salaryCompositionRepository.FilterAsync(request);

            return CreateSuccessResponse(response);
        }

        public async Task<ServiceResponse> GetDetailByIdAsync(Guid salaryCompositionID)
        {
            if (salaryCompositionID == Guid.Empty)
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "Id không hợp lệ"
                );
            }

            var data = await _salaryCompositionRepository.GetDetailByIdAsync(salaryCompositionID);

            if (data == null)
            {
                return CreateErrorResponse(
                    ResponseCode.NotFound,
                    "Không tìm thấy thành phần lương"
                );
            }

            return CreateSuccessResponse(data);
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

            if (string.IsNullOrWhiteSpace(entity.OrganizationIDs))
            {
                errors.Add(new ValidationError(
                    "OrganizationIDs",
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
