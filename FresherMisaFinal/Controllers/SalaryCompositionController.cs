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

        [HttpPost("filter")]
        public async Task<ActionResult<ServiceResponse>> Filter([FromBody] SalaryCompositionFilterRequest request)
        {
            var response = await _salaryCompositionService.FilterAsync(request);

            return Ok(response);
        }

        [HttpGet("detail/{id}")]
        public async Task<ActionResult<ServiceResponse>> GetDetailById(Guid id)
        {
            var response = await _salaryCompositionService.GetDetailByIdAsync(id);

            return Ok(response);
        }

        [HttpGet("enum")]
        public IActionResult GetMasterData()
        {
            return Ok(new
            {
                Statuses = new[]
                {
            new { Value = 1, Label = "Đang theo dõi" },
            new { Value = 0, Label = "Ngừng theo dõi" }
                },

                Natures = new[]
                {
            new { Value = 1, Label = "Thu nhập" },
            new { Value = 2, Label = "Khấu trừ" },
            new { Value = 3, Label = "Khác" },
                },

                ValueTypes = new[]
                {
            new { Value = 1, Label = "Số" },
            new { Value = 2, Label = "Tiền tệ" },
            new { Value = 3, Label = "Phần trăm" },
            new { Value = 4, Label = "Chữ" },
            new { Value = 5, Label = "Ngày" },

                },

                
            });
        }

        [HttpPatch("update-bulk-status")]
        public async Task<ActionResult<ServiceResponse>> BulkUpdateStatus([FromBody] BulkUpdateSalaryStatusRequest request)
        {
            var response = await _salaryCompositionService.BulkUpdateStatusAsync(request);

            return Ok(response);
        }

        [HttpPost("bulk-delete")]
        public async Task<ActionResult<ServiceResponse>> BulkDelete([FromBody] BulkDeleteSalaryCompositionRequest request)
        {
            var response = await _salaryCompositionService.BulkDeleteAsync(request);

            return Ok(response);
        }

        [HttpPost("copy-from-system")]
        public async Task<ActionResult<ServiceResponse>> CopyFromSystem([FromBody] CopySystemToSalaryRequest request)
        {
            var response = await _salaryCompositionService.CopyFromSystemAsync(request);

            return Ok(response);
        }

    }
}
