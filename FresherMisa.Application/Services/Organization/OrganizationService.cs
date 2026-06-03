using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Repositories;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.GridConfig;
using FresherMisa.Entities.Organization;
using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa.Application.Services
{
    public class OrganizationService : BaseService<Organization>, IOrganizationService
    {
        private readonly IOrganizationRepository _organizationRepository;

        public OrganizationService(
            IBaseRepository<Organization> baseRepository,
            IOrganizationRepository organizationRepository
            ) : base(baseRepository)
        {
            _organizationRepository = organizationRepository;
        }


        #region OVERRIDE METHODS

        #endregion OVERRIDE METHODS
    }
}
