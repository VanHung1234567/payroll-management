using Dapper;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionSystem;
using Microsoft.Extensions.Configuration;
using System.Text.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace FresherMisa.Infrastructure.Repositories
{
    /// <summary>
    /// Repository for SalaryCompositionSystem entity
    /// </summary>
    /// CREATED BY: VVHung (29/05/2026)

    public class SalaryCompositionSystemRepository : BaseRepository<SalaryCompositionSystem>, ISalaryCompositionSystemRepository
    {
        public SalaryCompositionSystemRepository(IConfiguration configuration) : base(configuration)
        {

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
        public async Task<PagingResponse<SalaryCompositionSystem>> FilterAsync(
            SalaryCompositionSystemFilterRequest request)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@v_pageIndex", request.PageIndex);
            parameters.Add("@v_pageSize", request.PageSize);
            parameters.Add("@v_search", request.Search ?? string.Empty);
            parameters.Add("@v_sort", request.Sort ?? string.Empty);
            parameters.Add("@v_SalaryCompositionType", request.SalaryCompositionType);
            parameters.Add(
                "@v_advancedFilters",
                JsonSerializer.Serialize(request.AdvancedFilters ?? new())
            );

            using var reader = await _dbConnection.QueryMultipleAsync(
                "Proc_SalaryCompositionSystem_Filter",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            var data = (await reader.ReadAsync<SalaryCompositionSystem>()).ToList();
            var total = await reader.ReadFirstAsync<long>();

            return new PagingResponse<SalaryCompositionSystem>
            {
                Total = total,
                PageIndex = request.PageIndex,
                PageSize = request.PageSize,
                Data = data
            };
        }
    }
}
