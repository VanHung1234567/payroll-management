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

        public async Task<ServiceResponse> BulkUpdateStatusAsync(
    BulkUpdateSalaryStatusRequest request)
        {
            if (request == null || request.Ids == null || request.Ids.Count == 0)
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "Vui lòng chọn ít nhất một bản ghi"
                );
            }

            if (request.Status != 0 && request.Status != 1)
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "Trạng thái không hợp lệ"
                );
            }

            var ids = string.Join(";", request.Ids);

            var rowAffects = await _salaryCompositionRepository
                .BulkUpdateStatusAsync(ids, request.Status);

            return CreateSuccessResponse(new
            {
                Updated = rowAffects,
                TotalSelected = request.Ids.Count
            });
        }

        public async Task<ServiceResponse> BulkDeleteAsync(BulkDeleteSalaryCompositionRequest request)
        {
            if (request == null || request.Ids == null || request.Ids.Count == 0)
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "Vui lòng chọn ít nhất một bản ghi"
                );
            }

            var ids = string.Join(";", request.Ids);

            var rowAffects = await _salaryCompositionRepository.BulkDeleteAsync(ids);

            return CreateSuccessResponse(new
            {
                Deleted = rowAffects,
                Skipped = request.Ids.Count - rowAffects,
                TotalSelected = request.Ids.Count
            });
        }

        public async Task<ServiceResponse> CopyFromSystemAsync(CopySystemToSalaryRequest request)
        {
            if (request == null ||
                request.SalaryCompositionSystemIDs == null ||
                request.SalaryCompositionSystemIDs.Count == 0)
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "Vui lòng chọn ít nhất một thành phần hệ thống"
                );
            }

            var systemIds = string.Join(";", request.SalaryCompositionSystemIDs);

            var rowAffects = await _salaryCompositionRepository
                .CopyFromSystemAsync(systemIds);

            return CreateSuccessResponse(new
            {
                Inserted = rowAffects,
                TotalSelected = request.SalaryCompositionSystemIDs.Count,
            });
        }

        #region OVERRIDE METHODS
        protected override async Task<bool> ValidateBeforeDeleteAsync(Guid entityId)
        {
            var entity = await _salaryCompositionRepository.GetDetailByIdAsync(entityId);

            if (entity == null)
            {
                return false;
            }

            // CreatedSource = 2: Mặc định / từ hệ thống => không cho xóa
            if (entity.CreatedSource == CreatedSource.System)
            {
                return false;
            }

            return true;
        }

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
