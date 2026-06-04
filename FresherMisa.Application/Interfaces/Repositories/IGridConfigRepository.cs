using FresherMisa.Application.Interfaces;
using FresherMisa.Entities.GridConfig;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Repositories
{
    public interface IGridConfigRepository : IBaseRepository<GridConfig>
    {
        /// <summary>
        /// Lấy danh sách cấu hình cột theo mã màn hình/bảng.
        /// </summary>
        /// <param name="gridKey">Mã định danh của grid, ví dụ: salary_composition.</param>
        /// <returns>Danh sách cấu hình cột thuộc grid tương ứng.</returns>
        /// CREATED BY: VVHung (29/05/2026)
        Task<IEnumerable<GridConfig>> GetByGridKeyAsync(string gridKey);

        /// <summary>
        /// Lưu cấu hình cột của grid
        /// </summary>
        /// <param name="request">Thông tin cấu hình cột</param>
        /// <returns>Số bản ghi bị ảnh hưởng</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<int> SaveGridConfigAsync(SaveGridConfigRequest request);
    }
}
