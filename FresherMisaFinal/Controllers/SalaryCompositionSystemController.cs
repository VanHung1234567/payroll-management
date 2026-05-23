using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionSystem;
using FresherMisa.Entities.Enums;
using Microsoft.AspNetCore.Mvc;

namespace FresherMisa.WebAPI.Controllers
{
    [ApiController]
    public class SalaryCompositionSystemController : BaseController<SalaryCompositionSystem>
    {
        private readonly ISalaryCompositionSystemService _salaryCompositionSystemService;

        public SalaryCompositionSystemController(
            ISalaryCompositionSystemService salaryCompositionSystemService) : base(salaryCompositionSystemService)
        {
            _salaryCompositionSystemService = salaryCompositionSystemService;
        }

    }
}
