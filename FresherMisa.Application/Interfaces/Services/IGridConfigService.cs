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

    }
}
