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

        [HttpGet("GridKey/{gridKey}")]
        public async Task<ActionResult<ServiceResponse>> GetByGridKey(string gridKey)
        {
            var response = await _gridConfigService.GetByGridKeyAsync(gridKey);

            return Ok(response);
        }

    }
}
