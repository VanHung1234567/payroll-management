using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.Enums;
using FresherMisa.Entities.GridConfig;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Services
{
    public class GridConfigService : BaseService<GridConfig>, IGridConfigService
    {
        private readonly IGridConfigRepository _gridConfigRepository;

        public GridConfigService(
            IBaseRepository<GridConfig> baseRepository,
            IGridConfigRepository gridConfigRepository
            ) : base(baseRepository)
        {
            _gridConfigRepository = gridConfigRepository;
        }

        /// <summary>
        /// Lấy danh sách cấu hình cột theo GridKey
        /// </summary>
        /// <param name="gridKey">Mã định danh của grid</param>
        /// <returns>Danh sách cấu hình cột</returns>
        /// CREATED BY: VVHung (29/05/2026)
        public async Task<ServiceResponse> GetByGridKeyAsync(string gridKey)
        {
            if (string.IsNullOrWhiteSpace(gridKey))
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "GridKey không được để trống"
                );
            }

            var data = await _gridConfigRepository.GetByGridKeyAsync(gridKey);

            return CreateSuccessResponse(data);
        }

        /// <summary>
        /// Lưu cấu hình cột của grid
        /// </summary>
        /// <param name="request">Thông tin cấu hình cột</param>
        /// <returns>Kết quả lưu cấu hình</returns>
        /// CREATED BY: VVHung (03/06/2026)
        public async Task<ServiceResponse> SaveGridConfigAsync(SaveGridConfigRequest request)
        {
            if (string.IsNullOrWhiteSpace(request.GridKey))
            {
                return CreateErrorResponse(
                    ResponseCode.BadRequest,
                    "GridKey không được để trống"
                );
            }

            var rowAffects =
                await _gridConfigRepository.SaveGridConfigAsync(request);

            return CreateSuccessResponse(new
            {
                Updated = rowAffects
            });
        }


        #region OVERRIDE METHODS

        #endregion OVERRIDE METHODS
    }
}
