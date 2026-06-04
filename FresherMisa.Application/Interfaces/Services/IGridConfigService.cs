using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.GridConfig;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Interfaces.Services
{
    public interface IGridConfigService : IBaseService<GridConfig>
    {
        /// <summary>
        /// Lấy danh sách cấu hình cột theo GridKey.
        /// </summary>
        /// <param name="gridKey">Mã định danh của grid.</param>
        /// <returns>Danh sách cấu hình cột của grid.</returns>
        /// CREATED BY: VVHung (29/05/2026)
        Task<ServiceResponse> GetByGridKeyAsync(string gridKey);

        /// <summary>
        /// Lưu cấu hình cột của grid
        /// </summary>
        /// <param name="request">Thông tin cấu hình cột</param>
        /// <returns>Kết quả lưu cấu hình</returns>
        /// CREATED BY: VVHung (03/06/2026)
        Task<ServiceResponse> SaveGridConfigAsync(
            SaveGridConfigRequest request
        );

    }
}
