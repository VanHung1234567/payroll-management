using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Helpers;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.Enums;
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
        private static readonly HashSet<string> AllowedSortFields = new(StringComparer.OrdinalIgnoreCase)
        {
            "SalaryCompositionCode",
            "SalaryCompositionName",
            "SalaryCompositionType",
            "CreatedDate"
        };

        private static readonly HashSet<string> AllowedAdvancedFilterFields = new(StringComparer.OrdinalIgnoreCase)
        {
            "SalaryCompositionCode",
            "SalaryCompositionName",
            "SalaryCompositionType",
            "Nature",
            "TaxType",
            "IsTaxReduction",
            "NormFormula",
            "ValueType",
            "ValueFormula",
            "Description",
            "PayslipDisplayType"
        };

        public SalaryCompositionSystemService(
            IBaseRepository<SalaryCompositionSystem> baseRepository,
            ISalaryCompositionSystemRepository salaryCompositionSystemRepository
            ) : base(baseRepository)
        {
            _salaryCompositionSystemRepository = salaryCompositionSystemRepository;
        }

        /// <summary>
        /// Lấy danh sách thành phần lương hệ thống theo điều kiện lọc và phân trang
        /// </summary>
        /// <param name="request">
        /// pageSize: Số bản ghi mỗi trang
        /// pageIndex: Chỉ số trang
        /// search: Từ khóa tìm kiếm
        /// salaryCompositionType: Loại thành phần lương
        /// advancedFilters: Danh sách điều kiện lọc nâng cao
        /// sort: Sắp xếp theo
        /// </param>
        /// <returns>Tổng số bản ghi và danh sách dữ liệu</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<ServiceResponse> FilterAsync(
            SalaryCompositionSystemFilterRequest request)
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

            request.Search = QueryInputNormalizer.NormalizeSearch(request.Search);
            request.Sort = sortResult.Sort;

            var response = await _salaryCompositionSystemRepository.FilterAsync(request);

            return CreateSuccessResponse(response);
        }


        #region OVERRIDE METHODS

        #endregion OVERRIDE METHODS
    }
}
