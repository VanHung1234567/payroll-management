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

        /// <summary>
        /// Lấy danh sách thành phần lương theo điều kiện lọc và phân trang
        /// POST /api/SalaryComposition/filter
        /// Trả về ServiceResponse chứa danh sách dữ liệu và tổng số bản ghi
        /// </summary>
        /// CREATED BY: VVHung (03/06/2026)
        [HttpPost("filter")]
        public async Task<ActionResult<ServiceResponse>> Filter([FromBody] SalaryCompositionFilterRequest request)
        {
            var response = await _salaryCompositionService.FilterAsync(request);

            if (!response.IsSuccess)
            {
                return BadRequest(response);
            }

            return Ok(response);
        }

        /// <summary>
        /// Lấy thông tin chi tiết thành phần lương
        /// GET /api/SalaryComposition/detail/{id}
        /// Trả về ServiceResponse chứa thông tin chi tiết thành phần lương
        /// </summary>
        /// CREATED BY: VVHung (03/06/2026)
        [HttpGet("detail/{id}")]
        public async Task<ActionResult<ServiceResponse>> GetDetailById(Guid id)
        {
            var response = await _salaryCompositionService.GetDetailByIdAsync(id);

            if (!response.IsSuccess)
            {
                return BadRequest(response);
            }

            return Ok(response);
        }

        /// <summary>
        /// Cập nhật trạng thái hàng loạt thành phần lương
        /// PATCH /api/SalaryComposition/update-bulk-status
        /// Trả về ServiceResponse chứa kết quả cập nhật
        /// </summary>
        /// CREATED BY: VVHung (03/06/2026)
        [HttpPatch("update-bulk-status")]
        public async Task<ActionResult<ServiceResponse>> BulkUpdateStatus([FromBody] BulkUpdateSalaryStatusRequest request)
        {
            var response = await _salaryCompositionService.BulkUpdateStatusAsync(request);

            if (!response.IsSuccess)
            {
                return BadRequest(response);
            }

            return Ok(response);
        }

        /// <summary>
        /// Xóa hàng loạt thành phần lương
        /// POST /api/SalaryComposition/bulk-delete
        /// Trả về ServiceResponse chứa kết quả xóa dữ liệu
        /// </summary>
        /// CREATED BY: VVHung (03/06/2026)
        [HttpPost("bulk-delete")]
        public async Task<ActionResult<ServiceResponse>> BulkDelete([FromBody] BulkDeleteSalaryCompositionRequest request)
        {
            var response = await _salaryCompositionService.BulkDeleteAsync(request);

            if (!response.IsSuccess)
            {
                return BadRequest(response);
            }

            return Ok(response);
        }

        /// <summary>
        /// Đưa các thành phần lương hệ thống vào danh sách sử dụng
        /// POST /api/SalaryComposition/copy-from-system
        /// Trả về ServiceResponse chứa kết quả thêm mới
        /// </summary>
        /// CREATED BY: VVHung (03/06/2026)
        [HttpPost("copy-from-system")]
        public async Task<ActionResult<ServiceResponse>> CopyFromSystem([FromBody] CopySystemToSalaryRequest request)
        {
            var response = await _salaryCompositionService.CopyFromSystemAsync(request);

            if (!response.IsSuccess)
            {
                return BadRequest(response);
            }

            return Ok(response);
        }

        /// <summary>
        /// Cập nhật một phần thông tin thành phần lương
        /// PATCH /api/{controller}/{id}
        /// Trả về ServiceResponse nếu cập nhật thành công
        /// </summary>
        /// <param name="id">ID thành phần lương</param>
        /// <param name="request">Thông tin cần cập nhật</param>
        /// <returns>Kết quả cập nhật</returns>
        /// CREATED BY: VVHung (05/06/2026)
        [HttpPatch("{id}")]
        public async Task<ActionResult<ServiceResponse>> Patch(
            Guid id,
            [FromBody] SalaryCompositionPatchRequest request)
        {
            var response = await _salaryCompositionService.PatchAsync(id, request);

            if (!response.IsSuccess)
            {
                return BadRequest(response);
            }

            return Ok(response);
        }

    }
}
