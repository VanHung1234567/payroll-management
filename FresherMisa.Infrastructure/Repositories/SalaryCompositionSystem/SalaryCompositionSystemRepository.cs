using Dapper;
using FresherMisa.Application.Extensions;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionSystem;
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
    /// Created By: dvhai (09/04/2026)
    public class SalaryCompositionSystemRepository : BaseRepository<SalaryCompositionSystem>, ISalaryCompositionSystemRepository
    {
        public SalaryCompositionSystemRepository(IConfiguration configuration) : base(configuration)
        {

        }

        public async Task<PagingResponse<SalaryCompositionSystem>> FilterAsync(SalaryCompositionSystemFilterRequest request)
        {

            var parameters = new DynamicParameters();
            parameters.Add("@v_pageIndex", request.PageIndex);
            parameters.Add("@v_pageSize", request.PageSize);
            parameters.Add("@v_search", request.Search ?? string.Empty);
            parameters.Add("@v_sort", request.Sort ?? string.Empty);
            parameters.Add("@v_SalaryCompositionType", request.SalaryCompositionType);

            using var reader = await _dbConnection.QueryMultipleAsync(
                "Proc_SalaryCompositionSystem_Filter",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            var data = (await reader.ReadAsync<SalaryCompositionSystem>()).ToList();
            var total = await reader.ReadFirstAsync<long>();

            return new PagingResponse<SalaryCompositionSystem>
            {
                Total = total,
                PageIndex = request.PageIndex,
                PageSize = request.PageSize,
                Data = data
            };
        }
    }
}
