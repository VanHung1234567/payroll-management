using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionSystem;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Services
{
    public interface ISalaryCompositionSystemService : IBaseService<SalaryCompositionSystem>
    {
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
        Task<ServiceResponse> FilterAsync(SalaryCompositionSystemFilterRequest request);
    }
}
