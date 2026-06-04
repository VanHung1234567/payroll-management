using Dapper;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Entities.GridConfig;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace FresherMisa.Infrastructure.Repositories
{
    /// <summary>
    /// Repository for GridConfig entity
    /// </summary>
    /// CREATED BY: VVHung (29/05/2026)
    public class GridConfigRepository : BaseRepository<GridConfig>, IGridConfigRepository
    {
        public GridConfigRepository(IConfiguration configuration) : base(configuration)
        {

        }

        /// <summary>
        /// Lấy danh sách cấu hình cột theo GridKey
        /// </summary>
        /// <param name="gridKey">Mã định danh của grid</param>
        /// <returns>Danh sách cấu hình cột</returns>
        /// CREATED BY: VVHung (03/06/2026)
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

        public async Task<int> SaveGridConfigAsync(SaveGridConfigRequest request)
        {
            var json = JsonConvert.SerializeObject(request.Columns);

            var parameters = new DynamicParameters();

            parameters.Add("@v_GridKey", request.GridKey);
            parameters.Add("@v_Columns", json);

            return await _dbConnection.ExecuteAsync(
                "Proc_GridConfig_Save",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }
    }
}
