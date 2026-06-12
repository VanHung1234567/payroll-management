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

        /// <summary>
        /// Lấy danh sách thành phần lương hệ thống theo điều kiện lọc và phân trang
        /// POST /api/SalaryCompositionSystem/filter
        /// Trả về ServiceResponse chứa danh sách dữ liệu và tổng số bản ghi
        /// </summary>
        /// <param name="request">
        /// pageSize: Số bản ghi mỗi trang
        /// pageIndex: Chỉ số trang
        /// search: Từ khóa tìm kiếm
        /// salaryCompositionType: Loại thành phần lương
        /// advancedFilters: Danh sách điều kiện lọc nâng cao
        /// sort: Sắp xếp theo
        /// </param>
        /// <returns>Danh sách thành phần lương hệ thống</returns>
        /// CREATED BY: VVHung (03/06/2026)
        [HttpPost("filter")]
        public async Task<ActionResult<ServiceResponse>> Filter(
            [FromBody] SalaryCompositionSystemFilterRequest request)
        {
            var response = await _salaryCompositionSystemService.FilterAsync(request);

            if (!response.IsSuccess)
            {
                return BadRequest(response);
            }

            return Ok(response);
        }
    }
}
