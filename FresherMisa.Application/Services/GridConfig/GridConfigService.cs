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


        #region OVERRIDE METHODS
        protected override List<ValidationError> ValidateCustom(GridConfig entity)
        {
            return new List<ValidationError>();
        }
        #endregion OVERRIDE METHODS
    }
}
