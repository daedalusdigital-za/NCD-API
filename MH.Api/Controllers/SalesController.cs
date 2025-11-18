using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.IRepository;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    public class SalesController : BaseController
    {
        private readonly ISaleService _saleService;

        public SalesController(ISaleService saleService)
        {
            _saleService = saleService;
        }

        [HttpPost]
        [Route("Add")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sale added successfully")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid sale data")]
        public async Task<ActionResult> Add([FromBody] SaleModel model)
        {
            try
            {
                // Generate sale number if not provided
                if (string.IsNullOrEmpty(model.SaleNumber))
                {
                    model.SaleNumber = await _saleService.GenerateSaleNumber();
                }

                await _saleService.Add(model);
                return Ok(new { message = "Sale added successfully", saleNumber = model.SaleNumber });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("Update")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sale updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Sale not found")]
        public async Task<ActionResult> Update([FromBody] SaleModel model)
        {
            try
            {
                await _saleService.Update(model);
                return Ok(new { message = "Sale updated successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("Delete")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sale deleted successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Sale not found")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            try
            {
                await _saleService.Delete(id);
                return Ok(new { message = "Sale deleted successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sale data", typeof(SaleViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Sale not found")]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            try
            {
                var result = await _saleService.GetById(id);
                if (result == null)
                    return NotFound(new { message = "Sale not found" });
                
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sales data", typeof(List<SaleViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            try
            {
                var result = await _saleService.GetAll();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByDateRange")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sales by date range", typeof(List<SaleViewModel>))]
        public async Task<ActionResult> GetByDateRange([FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            try
            {
                var result = await _saleService.GetByDateRange(startDate, endDate);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sales by province", typeof(List<SaleViewModel>))]
        public async Task<ActionResult> GetByProvince([FromQuery] int? provinceId)
        {
            try
            {
                var result = await _saleService.GetByProvince(provinceId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sales statistics", typeof(SalesStatsModel))]
        public async Task<ActionResult> GetStats()
        {
            try
            {
                var result = await _saleService.GetSalesStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetProvincialData")]
        [SwaggerResponse(StatusCodes.Status200OK, "Provincial sales data", typeof(List<ProvincialSalesData>))]
        public async Task<ActionResult> GetProvincialData()
        {
            try
            {
                var result = await _saleService.GetProvincialSalesData();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetTopProducts")]
        [SwaggerResponse(StatusCodes.Status200OK, "Top selling products", typeof(List<TopProductModel>))]
        public async Task<ActionResult> GetTopProducts([FromQuery] int limit = 10)
        {
            try
            {
                var result = await _saleService.GetTopProducts(limit);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetRecentSales")]
        [SwaggerResponse(StatusCodes.Status200OK, "Recent sales", typeof(List<SaleViewModel>))]
        public async Task<ActionResult> GetRecentSales([FromQuery] int limit = 10)
        {
            try
            {
                var result = await _saleService.GetRecentSales(limit);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetDashboardStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Sales dashboard statistics", typeof(SalesStatsModel))]
        public async Task<ActionResult> GetDashboardStats()
        {
            try
            {
                var result = await _saleService.GetSalesStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}