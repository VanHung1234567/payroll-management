using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryComposition;
using FresherMisa.Entities.Enums;
using Microsoft.AspNetCore.Mvc;

namespace FresherMisa.WebAPI.Controllers
{
    [ApiController]
    public class SalaryCompositionController : BaseController<SalaryComposition>
    {
        private readonly ISalaryCompositionService _salaryCompositionService;

        public SalaryCompositionController(
            ISalaryCompositionService salaryCompositionService) : base(salaryCompositionService)
        {
            _salaryCompositionService = salaryCompositionService;
        }

    }
}
