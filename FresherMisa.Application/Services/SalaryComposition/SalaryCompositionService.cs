using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Helpers;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.Enums;
using FresherMisa.Entities.SalaryComposition;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Services
{
    public class SalaryCompositionService : BaseService<SalaryComposition>, ISalaryCompositionService
    {
        private readonly ISalaryCompositionRepository _salaryCompositionRepository;
        private static readonly HashSet<string> AllowedSortFields = new(StringComparer.OrdinalIgnoreCase)
        {
            "SalaryCompositionCode",
            "SalaryCompositionName",
            "OrganizationNames",
            "SalaryCompositionType",
            "CreatedDate"
        };

        private static readonly HashSet<string> AllowedAdvancedFilterFields = new(StringComparer.OrdinalIgnoreCase)
        {
            "SalaryCompositionCode",
            "SalaryCompositionName",
            "OrganizationNames",
            "SalaryCompositionType",
            "Nature",
            "TaxType",
            "IsTaxReduction",
            "NormFormula",
            "ValueType",
            "ValueFormula",
            "Description",
            "PayslipDisplayType",
            "CreatedSource",
            "Status"
        };

        public SalaryCompositionService(
            IBaseRepository<SalaryComposition> baseRepository,
            ISalaryCompositionRepository salaryCompositionRepository
            ) : base(baseRepository)
        {
            _salaryCompositionRepository = salaryCompositionRepository;
        }

        /// <summary>
        /// Lấy danh sách thành phần lương theo điều kiện lọc và phân trang
        /// </summary>
        /// <param name="request">
        /// pageSize: Số bản ghi mỗi trang
        /// pageIndex: Chỉ số trang
        /// search: Từ khóa tìm kiếm
        /// status: Trạng thái theo dõi
        /// organizationIDs: Danh sách ID đơn vị áp dụng
        /// sort: Sắp xếp theo
        /// </param>
        /// <returns>Tổng số bản ghi và danh sách dữ liệu</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<ServiceResponse> FilterAsync(SalaryCompositionFilterRequest request)
        {
            var sortResult = QueryInputNormalizer.NormalizeSort(request.Sort, AllowedSortFields);
            if (!sortResult.IsValid)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, sortResult.Error);
            }

            var filterResult = QueryInputNormalizer.ValidateAdvancedFilterFields(
                request.AdvancedFilters,
                AllowedAdvancedFilterFields);
            if (!filterResult.IsValid)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, filterResult.Error);
            }

            var organizationResult = QueryInputNormalizer.NormalizeGuidList(request.OrganizationIDs);
            if (!organizationResult.IsValid)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, organizationResult.Error);
            }

            request.Search = QueryInputNormalizer.NormalizeSearch(request.Search);
            request.Sort = sortResult.Sort;
            request.OrganizationIDs = organizationResult.Value;

            var response = await _salaryCompositionRepository.FilterAsync(request);

            return CreateSuccessResponse(response);
        }

        /// <summary>
        /// Lấy thông tin chi tiết thành phần lương
        /// </summary>
        /// <param name="salaryCompositionID">ID thành phần lương</param>
        /// <returns>Thông tin chi tiết thành phần lương</returns>
        /// CREATED BY: VVHung (03/06/2026)
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

        /// <summary>
        /// Cập nhật trạng thái hàng loạt thành phần lương
        /// </summary>
        /// <param name="request">
        /// ids: Danh sách ID thành phần lương
        /// status:
        ///     1 - Đang theo dõi
        ///     0 - Ngừng theo dõi
        /// </param>
        /// <returns>Kết quả cập nhật trạng thái</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<ServiceResponse> BulkUpdateStatusAsync(BulkUpdateSalaryStatusRequest request)
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

        /// <summary>
        /// Xóa hàng loạt thành phần lương
        /// </summary>
        /// <param name="request">
        /// ids: Danh sách ID thành phần lương cần xóa
        /// </param>
        /// <returns>Kết quả xóa dữ liệu</returns>
        /// CREATED BY: VVHung (03/06/2026)
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

        /// <summary>
        /// Đưa các thành phần lương hệ thống vào danh sách sử dụng
        /// </summary>
        /// <param name="request">
        /// salaryCompositionSystemIDs:
        ///     Danh sách ID thành phần lương hệ thống
        /// </param>
        /// <returns>Kết quả thêm mới dữ liệu</returns>
        /// CREATED BY: VVHung (03/06/2026)
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

            try
            {
                var rowAffects = await _salaryCompositionRepository
                    .CopyFromSystemAsync(systemIds);

                return CreateSuccessResponse(new
                {
                    Inserted = rowAffects,
                    TotalSelected = request.SalaryCompositionSystemIDs.Count,
                });
            }
            catch (MySqlException ex) when (ex.SqlState == "45000")
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    ex.Message
                );
            }
        }

        /// <summary>
        /// Cập nhật một phần thông tin thành phần lương
        /// </summary>
        /// <param name="id">ID thành phần lương</param>
        /// <param name="request">Thông tin cần cập nhật</param>
        /// <returns>Kết quả cập nhật</returns>
        /// CREATED BY: VVHung (05/06/2026)
        public async Task<ServiceResponse> PatchAsync(Guid id, SalaryCompositionPatchRequest request)
        {
            if (id == Guid.Empty)
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "Id không hợp lệ"
                );
            }

            if (request == null)
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "Dữ liệu cập nhật không được để trống"
                );
            }

            var organizationResult = QueryInputNormalizer.NormalizeGuidList(request.OrganizationIDs);
            if (!organizationResult.IsValid)
            {
                return CreateErrorResponse(ResponseCode.BadRequest, organizationResult.Error);
            }

            request.OrganizationIDs = organizationResult.Value;

            var rowAffects = await _salaryCompositionRepository.PatchAsync(id, request);

            if (rowAffects <= 0)
            {
                return CreateErrorResponse(
                    ResponseCode.NotFound,
                    "Không tìm thấy thành phần lương"
                );
            }

            return CreateSuccessResponse(new
            {
                Updated = rowAffects
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

        #endregion OVERRIDE METHODS
    }
}
