using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.SalaryCompositionType;
using FresherMisa.Entities.Enums;
using Microsoft.AspNetCore.Mvc;

namespace FresherMisa.WebAPI.Controllers
{
    [ApiController]
    public class SalaryCompositionTypeController : BaseController<SalaryCompositionType>
    {
        private readonly ISalaryCompositionTypeService _salaryCompositionTypeService;

        public SalaryCompositionTypeController(
            ISalaryCompositionTypeService salaryCompositionTypeService) : base(salaryCompositionTypeService)
        {
            _salaryCompositionTypeService = salaryCompositionTypeService;
        }

    }
}
