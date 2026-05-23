using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Services;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Entities;
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


        #region OVERRIDE METHODS
        protected override List<ValidationError> ValidateCustom(GridConfig entity)
        {
            return new List<ValidationError>();
        }
        #endregion OVERRIDE METHODS
    }
}
