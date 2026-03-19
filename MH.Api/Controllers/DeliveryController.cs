using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using Swashbuckle.AspNetCore.Annotations;

namespace MH.Api.Controllers
{
    // [Authorize]
    [Route("api/[controller]")]
    public class DeliveryController : BaseController
    {
        private readonly IDeliveryService _deliveryService;

        public DeliveryController(IDeliveryService deliveryService)
        {
            _deliveryService = deliveryService;
        }

        [HttpPost]
        [Route("Add")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery added successfully")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid delivery data")]
        public async Task<ActionResult> Add([FromBody] DeliveryModel model)
        {
            try
            {
                await _deliveryService.Add(model);
                return Ok(new { message = "Delivery added successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("Update")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Delivery not found")]
        public async Task<ActionResult> Update([FromBody] DeliveryModel model)
        {
            try
            {
                await _deliveryService.Update(model);
                return Ok(new { message = "Delivery updated successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("UpdateStatus")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery status updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Delivery not found")]
        public async Task<ActionResult> UpdateStatus([FromBody] DeliveryStatusUpdateModel model)
        {
            try
            {
                await _deliveryService.UpdateStatus(model);
                return Ok(new { message = "Delivery status updated successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("Delete")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery deleted successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Delivery not found")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            try
            {
                await _deliveryService.Delete(id);
                return Ok(new { message = "Delivery deleted successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery data", typeof(DeliveryViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Delivery not found")]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            try
            {
                var result = await _deliveryService.GetById(id);
                if (result == null)
                    return NotFound(new { message = "Delivery not found" });
                
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "All deliveries", typeof(List<DeliveryViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            try
            {
                var result = await _deliveryService.GetAll();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetBySaleId")]
        [SwaggerResponse(StatusCodes.Status200OK, "Deliveries for sale", typeof(List<DeliveryViewModel>))]
        public async Task<ActionResult> GetBySaleId([FromQuery] int saleId)
        {
            try
            {
                var result = await _deliveryService.GetBySaleId(saleId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Deliveries by province", typeof(List<DeliveryViewModel>))]
        public async Task<ActionResult> GetByProvince([FromQuery] string province)
        {
            try
            {
                var result = await _deliveryService.GetByProvince(province);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByStatus")]
        [SwaggerResponse(StatusCodes.Status200OK, "Deliveries by status", typeof(List<DeliveryViewModel>))]
        public async Task<ActionResult> GetByStatus([FromQuery] DeliveryTrackingStatus status)
        {
            try
            {
                var result = await _deliveryService.GetByStatus(status);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByDateRange")]
        [SwaggerResponse(StatusCodes.Status200OK, "Deliveries within date range", typeof(List<DeliveryViewModel>))]
        public async Task<ActionResult> GetByDateRange([FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            try
            {
                var result = await _deliveryService.GetByDateRange(startDate, endDate);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByEquipmentType")]
        [SwaggerResponse(StatusCodes.Status200OK, "Deliveries by equipment type", typeof(List<DeliveryViewModel>))]
        public async Task<ActionResult> GetByEquipmentType([FromQuery] string itemDescription)
        {
            try
            {
                var result = await _deliveryService.GetByEquipmentType(itemDescription);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery statistics", typeof(DeliveryStatsModel))]
        public async Task<ActionResult> GetStats()
        {
            try
            {
                var result = await _deliveryService.GetDeliveryStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStatsByEquipmentType")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery statistics by equipment type", typeof(List<DeliveryByEquipmentTypeModel>))]
        public async Task<ActionResult> GetStatsByEquipmentType()
        {
            try
            {
                var result = await _deliveryService.GetDeliveryStatsByEquipmentType();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStatsByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Delivery statistics by province", typeof(List<DeliveryByProvinceModel>))]
        public async Task<ActionResult> GetStatsByProvince()
        {
            try
            {
                var result = await _deliveryService.GetDeliveryStatsByProvince();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}
