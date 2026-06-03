using FresherMisa.Application.Interfaces;
using FresherMisa.Application.Interfaces.Services;
using FresherMisa.Application.Services;
using FresherMisa.Entities;
using FresherMisa.Entities.GridConfig;
using FresherMisa.Entities.Enums;
using Microsoft.AspNetCore.Mvc;

namespace FresherMisa.WebAPI.Controllers
{
    [ApiController]
    public class GridConfigController : BaseController<GridConfig>
    {
        private readonly IGridConfigService _gridConfigService;

        public GridConfigController(
            IGridConfigService gridConfigService) : base(gridConfigService )
        {
            _gridConfigService = gridConfigService;
        }

        /// <summary>
        /// Lấy danh sách cấu hình cột theo GridKey
        /// GET /api/GridConfig/GridKey/{gridKey}
        /// Trả về ServiceResponse chứa danh sách cấu hình cột
        /// </summary>
        /// CREATED BY: VVHung (03/06/2026)
        [HttpGet("GridKey/{gridKey}")]
        public async Task<ActionResult<ServiceResponse>> GetByGridKey(string gridKey)
        {
            var response = await _gridConfigService.GetByGridKeyAsync(gridKey);

            return Ok(response);
        }

    }
}
