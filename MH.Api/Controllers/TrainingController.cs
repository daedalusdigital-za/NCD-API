using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using MH.Domain.DBModel;
using Swashbuckle.AspNetCore.Annotations;
using System.Text.Json;

namespace MH.Api.Controllers
{
    // [Authorize] // Temporarily commented for testing
    [Route("api/[controller]")]
    public class TrainingController : BaseController
    {
        private readonly ITrainingSessionService _trainingSessionService;
        private readonly ITrainingDocumentService _trainingDocumentService;

        public TrainingController(ITrainingSessionService trainingSessionService, ITrainingDocumentService trainingDocumentService)
        {
            _trainingSessionService = trainingSessionService;
            _trainingDocumentService = trainingDocumentService;
        }

        [HttpPost]
        [Route("Add")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session added successfully")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid training session data")]
        public async Task<ActionResult> Add([FromBody] TrainingSessionModel model)
        {
            try
            {
                await _trainingSessionService.Add(model);
                return Ok(new { message = "Training session added successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPatch]
        [Route("Update")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session updated successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Training session not found")]
        public async Task<ActionResult> Update()
        {
            try
            {
                // Read the raw JSON to bypass model validation
                using var reader = new StreamReader(Request.Body);
                var json = await reader.ReadToEndAsync();
                var jsonDocument = JsonDocument.Parse(json);
                var root = jsonDocument.RootElement;
                
                // Extract required ID
                if (!root.TryGetProperty("id", out var idElement) || !idElement.TryGetInt32(out int id))
                    return BadRequest(new { message = "ID is required for updates" });
                
                // Create model with only provided fields
                var model = new TrainingSessionModel { Id = id };
                
                if (root.TryGetProperty("trainerId", out var trainerIdElement) && trainerIdElement.TryGetInt32(out int trainerId))
                    model.TrainerId = trainerId;
                if (root.TryGetProperty("provinceId", out var provinceIdElement) && provinceIdElement.TryGetInt32(out int provinceId))
                    model.ProvinceId = provinceId;
                if (root.TryGetProperty("trainingName", out var trainingNameElement))
                    model.TrainingName = trainingNameElement.GetString();
                if (root.TryGetProperty("trainingType", out var trainingTypeElement))
                    model.TrainingType = trainingTypeElement.GetString();
                if (root.TryGetProperty("venue", out var venueElement))
                    model.Venue = venueElement.GetString();
                if (root.TryGetProperty("targetAudience", out var targetAudienceElement))
                    model.TargetAudience = targetAudienceElement.GetString();
                if (root.TryGetProperty("numberOfParticipants", out var participantsElement) && participantsElement.TryGetInt32(out int participants))
                    model.NumberOfParticipants = participants;
                if (root.TryGetProperty("status", out var statusElement) && statusElement.TryGetInt32(out int status))
                    model.Status = status;
                if (root.TryGetProperty("startDate", out var startDateElement) && startDateElement.TryGetDateTime(out DateTime startDate))
                    model.StartDate = startDate;
                
                // ✅ Add debugging logs
                Console.WriteLine($"[TRAINING UPDATE] Received request for ID: {model.Id}");
                Console.WriteLine($"[TRAINING UPDATE] TrainerId: {model.TrainerId}");
                Console.WriteLine($"[TRAINING UPDATE] ProvinceId: {model.ProvinceId}");
                Console.WriteLine($"[TRAINING UPDATE] Venue: {model.Venue}");
                
                var updatedSession = await _trainingSessionService.Update(model);
                
                Console.WriteLine($"[TRAINING UPDATE] Update completed successfully for ID: {model.Id}");
                Console.WriteLine($"[TRAINING UPDATE] Confirmed updated TrainerId: {updatedSession.TrainerId}");
                Console.WriteLine($"[TRAINING UPDATE] Confirmed updated ProvinceId: {updatedSession.ProvinceId}");
                
                return Ok(new { 
                    message = "Training session updated successfully",
                    data = updatedSession,
                    updatedTrainerId = updatedSession.TrainerId,
                    updatedProvinceId = updatedSession.ProvinceId
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"[TRAINING UPDATE ERROR] {ex.Message}");
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("Delete")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session deleted successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Training session not found")]
        public async Task<ActionResult> Delete([FromQuery] int id)
        {
            try
            {
                await _trainingSessionService.Delete(id);
                return Ok(new { message = "Training session deleted successfully" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetById")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training session data", typeof(TrainingSessionViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Training session not found")]
        public async Task<ActionResult> GetById([FromQuery] int id)
        {
            try
            {
                var result = await _trainingSessionService.GetById(id);
                if (result == null)
                    return NotFound(new { message = "Training session not found" });
                
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetAll")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions data", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetAll()
        {
            try
            {
                Console.WriteLine("[TRAINING CONTROLLER] GetAll called");
                var result = await _trainingSessionService.GetAll();
                Console.WriteLine($"[TRAINING CONTROLLER] GetAll returned {result.Count} records");
                return Ok(result);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"[TRAINING CONTROLLER] GetAll Exception: {ex.Message}");
                Console.WriteLine($"[TRAINING CONTROLLER] GetAll StackTrace: {ex.StackTrace}");
                if (ex.InnerException != null)
                {
                    Console.WriteLine($"[TRAINING CONTROLLER] Inner Exception: {ex.InnerException.Message}");
                }
                return BadRequest(new { message = ex.Message, stackTrace = ex.StackTrace, innerException = ex.InnerException?.Message });
            }
        }

        [HttpGet]
        [Route("GetByProvince")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by province", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByProvince([FromQuery] string provinceName)
        {
            try
            {
                var result = await _trainingSessionService.GetByProvince(provinceName);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByDateRange")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by date range", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByDateRange([FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            try
            {
                var result = await _trainingSessionService.GetByDateRange(startDate, endDate);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByTrainer")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by trainer", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByTrainer([FromQuery] int trainerId)
        {
            try
            {
                var result = await _trainingSessionService.GetByTrainer(trainerId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetByStatus")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training sessions by status", typeof(List<TrainingSessionViewModel>))]
        public async Task<ActionResult> GetByStatus([FromQuery] TrainingStatus status)
        {
            try
            {
                var result = await _trainingSessionService.GetByStatus(status);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetStats")]
        [SwaggerResponse(StatusCodes.Status200OK, "Training statistics", typeof(TrainingStatsModel))]
        public async Task<ActionResult> GetStats()
        {
            try
            {
                var result = await _trainingSessionService.GetTrainingStats();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        // PDF Upload/Download Endpoints
        [HttpPost]
        [Route("UploadPDF")]
        [Authorize]
        [Consumes("multipart/form-data")]
        [SwaggerResponse(StatusCodes.Status200OK, "PDF uploaded successfully", typeof(TrainingDocumentViewModel))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid file or training session")]
        [SwaggerResponse(StatusCodes.Status401Unauthorized, "Unauthorized")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Training session not found")]
        public async Task<IActionResult> UploadPDF([FromForm] IFormFile file, [FromForm] int trainingSessionId, [FromForm] string documentType, [FromForm] string? fileName = null)
        {
            try
            {
                // Get current user ID from JWT claims
                int userId = int.Parse(User.FindFirst("userId")?.Value ?? "0");
                
                if (userId == 0)
                    return Unauthorized(new { message = "User ID not found in token" });

                var result = await _trainingDocumentService.UploadPDFAsync(file, trainingSessionId, documentType, fileName, userId);
                return Ok(result);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new { error = "Invalid request", message = ex.Message });
            }
            catch (System.Exception ex)
            {
                return NotFound(new { error = ex.Message });
            }
        }

        [HttpGet]
        [Route("DownloadPDF/{documentId}")]
        [SwaggerResponse(StatusCodes.Status200OK, "PDF file content")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Document not found")]
        public async Task<IActionResult> DownloadPDF(int documentId)
        {
            try
            {
                byte[] fileBytes = await _trainingDocumentService.DownloadPDFAsync(documentId);
                return File(fileBytes, "application/pdf", $"training_document_{documentId}.pdf");
            }
            catch (System.Exception ex)
            {
                return NotFound(new { error = "Document not found", message = ex.Message });
            }
        }

        [HttpGet]
        [Route("{trainingSessionId}/PDFs")]
        [SwaggerResponse(StatusCodes.Status200OK, "List of training documents", typeof(TrainingDocumentsListViewModel))]
        public async Task<IActionResult> GetTrainingSessionPDFs(int trainingSessionId)
        {
            try
            {
                var result = await _trainingDocumentService.GetTrainingDocumentsBySessionAsync(trainingSessionId);
                return Ok(result);
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete]
        [Route("DeletePDF/{documentId}")]
        [Authorize]
        [SwaggerResponse(StatusCodes.Status204NoContent, "Document deleted successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Document not found")]
        [SwaggerResponse(StatusCodes.Status403Forbidden, "Forbidden - No permission to delete")]
        public async Task<IActionResult> DeletePDF(int documentId)
        {
            try
            {
                // Get current user ID from claims
                int userId = int.Parse(User.FindFirst("userId")?.Value ?? "0");
                
                if (userId == 0)
                    return Unauthorized(new { message = "User ID not found in token" });

                bool deleted = await _trainingDocumentService.DeletePDFAsync(documentId, userId);
                
                if (!deleted)
                    return NotFound(new { error = "Document not found" });

                return NoContent();
            }
            catch (UnauthorizedAccessException ex)
            {
                return Forbid(ex.Message);
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }
}