using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.Organization;
using FresherMisa.Entities.Enums;
using Microsoft.AspNetCore.Mvc;

namespace FresherMisa.WebAPI.Controllers
{
    [ApiController]
    public class OrganizationController : BaseController<Organization>
    {
        private readonly IOrganizationService _organizationService;

        public OrganizationController(
            IOrganizationService organizationService) : base(organizationService)
        {
            _organizationService = organizationService;
        }

    }
}
