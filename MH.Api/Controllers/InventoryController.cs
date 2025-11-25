using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    [Authorize]
    public class InventoryController : BaseController
    {
        private readonly IInventoryItemService _inventoryService;

        public InventoryController(IInventoryItemService inventoryService)
        {
            _inventoryService = inventoryService;
        }

        [HttpPost]
        [Route("Add")]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory item added successfully")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid inventory item data")]
        public async Task<ActionResult> Add([FromBody] InventoryItemModel model)
        {
            try
            {
                // Check if SKU already exists
                var itemExists = await _inventoryService.IsItemNumberExists(model.SKU);
                if (itemExists)
                {
                    return BadRequest(new { message = "SKU already exists" });
                }

                await _inventoryService.Add(model);
                return Ok(new { message = "Inventory item added successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("Update")]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory item updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Inventory item not found")]
        public async Task<ActionResult> Update([FromBody] InventoryItemModel model)
        {
            try
            {
                // Check if SKU already exists for another item
                var itemExists = await _inventoryService.IsItemNumberExists(model.SKU, model.Id);
                if (itemExists)
                {
                    return BadRequest(new { message = "SKU already exists" });
                }

                await _inventoryService.Update(model);
                return Ok(new { message = "Inventory item updated successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("UpdateStock")]
        [SwaggerResponse(StatusCodes.Status200OK, "Stock updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Inventory item not found")]
        public async Task<ActionResult> UpdateStock([FromBody] InventoryUpdateStockModel model)
        {
            try
            {
                await _inventoryService.UpdateStock(model);
                return Ok(new { message = "Stock updated successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("Delete")]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory item deleted successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Inventory item not found")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            try
            {
                await _inventoryService.Delete(id);
                return Ok(new { message = "Inventory item deleted successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetById")]
        [AllowAnonymous]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory item data", typeof(InventoryItemViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Inventory item not found")]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            try
            {
                var result = await _inventoryService.GetById(id);
                if (result == null)
                    return NotFound(new { message = "Inventory item not found" });
                
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetAll")]
        [AllowAnonymous]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory items data", typeof(List<InventoryItemViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            try
            {
                var result = await _inventoryService.GetAll();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByCategory")]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory items by category", typeof(List<InventoryItemViewModel>))]
        public async Task<ActionResult> GetByCategory([FromQuery] InventoryCategory category)
        {
            try
            {
                var result = await _inventoryService.GetByCategory(category);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetLowStock")]
        [SwaggerResponse(StatusCodes.Status200OK, "Low stock items", typeof(List<InventoryItemViewModel>))]
        public async Task<ActionResult> GetLowStock()
        {
            try
            {
                var result = await _inventoryService.GetLowStock();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByStatus")]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory items by status", typeof(List<InventoryItemViewModel>))]
        public async Task<ActionResult> GetByStatus([FromQuery] InventoryStatus status)
        {
            try
            {
                var result = await _inventoryService.GetByStatus(status);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Inventory statistics", typeof(InventoryStatsModel))]
        public async Task<ActionResult> GetStats()
        {
            try
            {
                var result = await _inventoryService.GetInventoryStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}