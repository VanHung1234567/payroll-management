using FresherMisa.Application.Interfaces;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Repositories
{
    public interface ISalaryCompositionRepository : IBaseRepository<SalaryComposition>
    {
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
        Task<PagingResponse<SalaryComposition>> FilterAsync(SalaryCompositionFilterRequest request);

        /// <summary>
        /// Lấy chi tiết thành phần lương theo ID, bao gồm danh sách đơn vị áp dụng.
        /// </summary>
        /// <param name="salaryCompositionID">ID thành phần lương.</param>
        /// <returns>Thông tin chi tiết thành phần lương.</returns>
        /// CREATED BY: VVHung (29/05/2026)

        Task<SalaryComposition?> GetDetailByIdAsync(Guid salaryCompositionID);

        /// <summary>
        /// Cập nhật trạng thái hàng loạt cho các thành phần lương.
        /// </summary>
        /// <param name="ids">Danh sách ID thành phần lương, phân tách bằng dấu chấm phẩy.</param>
        /// <param name="status">Trạng thái cần cập nhật: 1 - Đang theo dõi, 0 - Ngừng theo dõi.</param>
        /// <returns>Số bản ghi được cập nhật.</returns>
        /// CREATED BY: VVHung (29/05/2026)
        Task<int> BulkUpdateStatusAsync(string ids, int status);

        /// <summary>
        /// Xóa hàng loạt các thành phần lương tự thêm.
        /// </summary>
        /// <param name="ids">Danh sách ID thành phần lương, phân tách bằng dấu chấm phẩy.</param>
        /// <returns>Số bản ghi được xóa.</returns>
        /// CREATED BY: VVHung (29/05/2026)
        Task<int> BulkDeleteAsync(string ids);

        /// <summary>
        /// Đưa các thành phần lương hệ thống vào danh sách thành phần lương sử dụng.
        /// </summary>
        /// <param name="systemIds">Danh sách ID thành phần lương hệ thống, phân tách bằng dấu chấm phẩy.</param>
        /// <returns>Số bản ghi được thêm mới.</returns>
        /// CREATED BY: VVHung (29/05/2026)
        Task<int> CopyFromSystemAsync(string systemIds);
    }
}
