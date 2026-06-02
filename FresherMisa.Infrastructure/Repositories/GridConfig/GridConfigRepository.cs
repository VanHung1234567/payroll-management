using Dapper;
using FresherMisa.Application.Extensions;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Entities.GridConfig;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace FresherMisa.Infrastructure.Repositories
{
    /// <summary>
    /// Repository for Department entity
    /// </summary>
    /// CREATED BY: VVHung (29/05/2026)
    public class GridConfigRepository : BaseRepository<GridConfig>, IGridConfigRepository
    {
        public GridConfigRepository(IConfiguration configuration) : base(configuration)
        {

        }

        public async Task<IEnumerable<GridConfig>> GetByGridKeyAsync(string gridKey)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@v_GridKey", gridKey);

            var data = await _dbConnection.QueryAsync<GridConfig>(
                "Proc_GridConfig_GetByGridKey",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return data;
        }
    }
}
