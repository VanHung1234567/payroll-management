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

        [HttpPost("filter")]
        public async Task<ActionResult<ServiceResponse>> Filter([FromBody] SalaryCompositionSystemFilterRequest request)
        {
            var response = await _salaryCompositionSystemService.FilterAsync(request);
            return Ok(response);
        }
    }
}
