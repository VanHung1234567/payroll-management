using Dapper;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Entities.Organization;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace FresherMisa.Infrastructure.Repositories
{
    /// <summary>
    /// Repository for Organization entity
    /// </summary>
    /// CREATED BY: VVHung (29/05/2026)

    public class OrganizationRepository : BaseRepository<Organization>, IOrganizationRepository
    {
        public OrganizationRepository(IConfiguration configuration) : base(configuration)
        {

        }
    }
}
