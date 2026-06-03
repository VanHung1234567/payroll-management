using FresherMisa.Application.Interfaces;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionSystem;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Repositories
{
    public interface ISalaryCompositionSystemRepository : IBaseRepository<SalaryCompositionSystem>
    {
        /// <summary>
        /// Lấy danh sách thành phần lương hệ thống theo điều kiện lọc và phân trang
        /// </summary>
        /// <param name="request">
        /// pageSize: Số bản ghi mỗi trang
        /// pageIndex: Chỉ số trang
        /// search: Từ khóa tìm kiếm
        /// sort: Sắp xếp theo
        /// salaryCompositionType: Loại thành phần lương
        /// </param>
        /// <returns>Tổng số bản ghi và danh sách dữ liệu</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<PagingResponse<SalaryCompositionSystem>> FilterAsync(SalaryCompositionSystemFilterRequest request);
    }
}
