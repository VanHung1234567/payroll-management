using Dapper;
using FresherMisa.Application.Extensions;
using FresherMisa.Application.Interfaces.Repositories;
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
    }
}
