using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Services
{
    public interface ISalaryCompositionService : IBaseService<SalaryComposition>
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
        Task<ServiceResponse> FilterAsync(SalaryCompositionFilterRequest request);

        /// <summary>
        /// Lấy thông tin chi tiết thành phần lương
        /// </summary>
        /// <param name="salaryCompositionID">ID thành phần lương</param>
        /// <returns>Thông tin chi tiết thành phần lương</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<ServiceResponse> GetDetailByIdAsync(Guid salaryCompositionID);

        /// <summary>
        /// Cập nhật trạng thái hàng loạt thành phần lương
        /// </summary>
        /// <param name="request">
        /// ids: Danh sách ID thành phần lương
        /// status:
        /// 1 - Đang theo dõi
        /// 0 - Ngừng theo dõi
        /// </param>
        /// <returns>Số bản ghi được cập nhật</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<ServiceResponse> BulkUpdateStatusAsync(BulkUpdateSalaryStatusRequest request);

        /// <summary>
        /// Xóa hàng loạt thành phần lương
        /// </summary>
        /// <param name="request">
        /// ids: Danh sách ID thành phần lương cần xóa
        /// </param>
        /// <returns>Số bản ghi được xóa</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<ServiceResponse> BulkDeleteAsync(BulkDeleteSalaryCompositionRequest request);

        /// <summary>
        /// Đưa thành phần lương hệ thống vào danh sách sử dụng
        /// </summary>
        /// <param name="request">
        /// systemIds: Danh sách ID thành phần lương hệ thống
        /// organizationID: ID đơn vị áp dụng
        /// </param>
        /// <returns>Số bản ghi được thêm mới</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<ServiceResponse> CopyFromSystemAsync(CopySystemToSalaryRequest request);

        /// <summary>
        /// Cập nhật một phần thông tin thành phần lương
        /// </summary>
        /// <param name="id">ID thành phần lương</param>
        /// <param name="request">Thông tin cần cập nhật</param>
        /// <returns>Kết quả cập nhật</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<ServiceResponse> PatchAsync(Guid id, SalaryCompositionPatchRequest request);
    }
}
