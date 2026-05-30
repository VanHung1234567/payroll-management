using Dapper;
using FresherMisa.Application.Extensions;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
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
    public class SalaryCompositionRepository : BaseRepository<SalaryComposition>, ISalaryCompositionRepository
    {
        public SalaryCompositionRepository(IConfiguration configuration) : base(configuration)
        {

        }
        public async Task<PagingResponse<SalaryComposition>> FilterAsync(SalaryCompositionFilterRequest request)
        {

            var parameters = new DynamicParameters();

            parameters.Add("@v_pageIndex", request.PageIndex);
            parameters.Add("@v_pageSize", request.PageSize);
            parameters.Add("@v_search", request.Search ?? string.Empty);
            parameters.Add("@v_sort", request.Sort ?? string.Empty);
            parameters.Add("@v_status", request.Status);
            parameters.Add("@v_organizationIDs", request.OrganizationIDs ?? string.Empty);

            using var reader = await _dbConnection.QueryMultipleAsync(
                "Proc_SalaryComposition_Filter",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            var data = (await reader.ReadAsync<SalaryComposition>()).ToList();
            var total = await reader.ReadFirstAsync<long>();

            return new PagingResponse<SalaryComposition>
            {
                Total = total,
                PageIndex = request.PageIndex,
                PageSize = request.PageSize,
                Data = data
            };
        }

        public async Task<SalaryComposition?> GetDetailByIdAsync(Guid salaryCompositionID)
        {

            var parameters = new DynamicParameters();
            parameters.Add("@v_SalaryCompositionID", salaryCompositionID.ToString());

            var data = await _dbConnection.QueryFirstOrDefaultAsync<SalaryComposition>(
                "Proc_SalaryComposition_GetDetailById",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return data;
        }
    }
}
