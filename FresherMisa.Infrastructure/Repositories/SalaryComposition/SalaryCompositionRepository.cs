using Dapper;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace FresherMisa.Infrastructure.Repositories
{
    /// <summary>
    /// Repository for SalaryComposition entity
    /// </summary>
    /// CREATED BY: VVHung (29/05/2026)
    public class SalaryCompositionRepository : BaseRepository<SalaryComposition>, ISalaryCompositionRepository
    {
        public SalaryCompositionRepository(IConfiguration configuration) : base(configuration)
        {

        }
        /// <summary>
        /// Lấy danh sách thành phần lương theo điều kiện lọc và phân trang
        /// </summary>
        /// <param name="request">
        /// pageSize: Số bản ghi mỗi trang
        /// pageIndex: Chỉ số trang
        /// search: Từ khóa tìm kiếm
        /// status: Trạng thái theo dõi
        /// organizationIDs: Danh sách đơn vị áp dụng
        /// sort: Sắp xếp theo
        /// </param>
        /// <returns>Tổng số bản ghi và danh sách dữ liệu</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<PagingResponse<SalaryComposition>> FilterAsync(SalaryCompositionFilterRequest request)
        {

            var parameters = new DynamicParameters();

            parameters.Add("@v_pageIndex", request.PageIndex);
            parameters.Add("@v_pageSize", request.PageSize);
            parameters.Add("@v_search", request.Search ?? string.Empty);
            parameters.Add("@v_sort", NormalizeSort(request.Sort));
            parameters.Add("@v_status", request.Status);
            parameters.Add("@v_organizationIDs", request.OrganizationIDs ?? string.Empty);

            using var reader = await _dbConnection.QueryMultipleAsync(
                "Proc_SalaryComposition_Filter",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            var data = (await reader.ReadAsync<SalaryComposition>()).ToList();
            var total = await reader.ReadFirstAsync<long>();

            return new PagingResponse<SalaryComposition>
            {
                Total = total,
                PageIndex = request.PageIndex,
                PageSize = request.PageSize,
                Data = data
            };
        }

        /// <summary>
        /// Cập nhật trạng thái hàng loạt thành phần lương
        /// </summary>
        /// <param name="ids">Danh sách ID thành phần lương, phân tách bằng dấu ';'</param>
        /// <param name="status">
        /// 1 - Đang theo dõi
        /// 0 - Ngừng theo dõi
        /// </param>
        /// <returns>Số bản ghi bị ảnh hưởng</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<int> BulkUpdateStatusAsync(string ids, int status)
        {

            var parameters = new DynamicParameters();
            parameters.Add("@v_Ids", ids);
            parameters.Add("@v_Status", status);

            var rowAffects = await _dbConnection.ExecuteAsync(
                "Proc_BulkUpdateSalaryCompositionStatus",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return rowAffects;
        }



        /// <summary>
        /// Lấy thông tin chi tiết thành phần lương
        /// </summary>
        /// <param name="salaryCompositionID">ID thành phần lương</param>
        /// <returns>Thông tin chi tiết thành phần lương</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<SalaryComposition?> GetDetailByIdAsync(Guid salaryCompositionID)
        {

            var parameters = new DynamicParameters();
            parameters.Add("@v_SalaryCompositionID", salaryCompositionID.ToString());

            var data = await _dbConnection.QueryFirstOrDefaultAsync<SalaryComposition>(
                "Proc_SalaryComposition_GetDetailById",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return data;
        }

        /// <summary>
        /// Xóa hàng loạt thành phần lương
        /// </summary>
        /// <param name="ids">Danh sách ID thành phần lương, phân tách bằng dấu ';'</param>
        /// <returns>Số bản ghi bị ảnh hưởng</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<int> BulkDeleteAsync(string ids)
        {

            var parameters = new DynamicParameters();
            parameters.Add("@v_Ids", ids);

            var rowAffects = await _dbConnection.ExecuteAsync(
                "Proc_BulkDeleteSalaryComposition",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return rowAffects;
        }

        /// <summary>
        /// Đưa các thành phần lương hệ thống vào danh sách sử dụng
        /// </summary>
        /// <param name="systemIds">
        /// Danh sách ID thành phần lương hệ thống,
        /// phân tách bằng dấu ';'
        /// </param>
        /// <returns>Số bản ghi được thêm mới</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<int> CopyFromSystemAsync(string systemIds)
        {

            var parameters = new DynamicParameters();
            parameters.Add("@v_SystemIDs", systemIds);

            var inserted = await _dbConnection.ExecuteScalarAsync<int>(
                "Proc_CopySalaryCompositionSystemToSalaryComposition",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return inserted;
        }
    }
}
