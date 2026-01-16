using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MH.Application.IService;
using MH.Domain.Model;
using MH.Domain.ViewModel;
using Swashbuckle.AspNetCore.Annotations;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MH.Api.Controllers
{
    // [Authorize] // Temporarily commented for testing
    [Route("api/[controller]")]
    [ApiController]
    public class CreditNotesController : BaseController
    {
        private readonly ICreditNoteService _creditNoteService;

        public CreditNotesController(ICreditNoteService creditNoteService)
        {
            _creditNoteService = creditNoteService;
        }

        /// <summary>
        /// Get all credit notes with optional filtering
        /// </summary>
        [HttpGet]
        [SwaggerResponse(StatusCodes.Status200OK, "List of credit notes", typeof(List<CreditNoteViewModel>))]
        public async Task<ActionResult<List<CreditNoteViewModel>>> GetAll(
            [FromQuery] string? status = null,
            [FromQuery] int? customerId = null,
            [FromQuery] int? invoiceId = null,
            [FromQuery] DateTime? dateFrom = null,
            [FromQuery] DateTime? dateTo = null,
            [FromQuery] string? search = null)
        {
            try
            {
                var filter = new CreditNoteFilterDto
                {
                    Status = status,
                    CustomerId = customerId,
                    InvoiceId = invoiceId,
                    DateFrom = dateFrom,
                    DateTo = dateTo,
                    Search = search
                };

                var result = await _creditNoteService.GetAll(filter);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Get a specific credit note by ID
        /// </summary>
        [HttpGet("{id}")]
        [SwaggerResponse(StatusCodes.Status200OK, "Credit note data", typeof(CreditNoteViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Credit note not found")]
        public async Task<ActionResult<CreditNoteViewModel>> GetById(int id)
        {
            try
            {
                var result = await _creditNoteService.GetById(id);
                if (result == null)
                    return NotFound(new { message = "Credit note not found" });

                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Create a new credit note
        /// </summary>
        [HttpPost]
        [SwaggerResponse(StatusCodes.Status201Created, "Credit note created successfully", typeof(CreditNoteViewModel))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid data or invoice not found")]
        [SwaggerResponse(StatusCodes.Status422UnprocessableEntity, "Credit amount exceeds original amount")]
        public async Task<ActionResult<CreditNoteViewModel>> Create([FromBody] CreateCreditNoteDto dto)
        {
            try
            {
                var result = await _creditNoteService.CreateCreditNote(dto);
                return CreatedAtAction(nameof(GetById), new { id = result.Id }, result);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status422UnprocessableEntity, new { message = ex.Message });
            }
        }

        /// <summary>
        /// Update an existing credit note
        /// </summary>
        [HttpPatch("{id}")]
        [SwaggerResponse(StatusCodes.Status200OK, "Credit note updated successfully", typeof(CreditNoteViewModel))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Credit note not found")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid status transition or data")]
        public async Task<ActionResult<CreditNoteViewModel>> Update(int id, [FromBody] UpdateCreditNoteDto dto)
        {
            try
            {
                var result = await _creditNoteService.UpdateCreditNote(id, dto);
                return Ok(result);
            }
            catch (ArgumentException ex)
            {
                return NotFound(new { message = ex.Message });
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Delete a credit note (only if status is pending)
        /// </summary>
        [HttpDelete("{id}")]
        [SwaggerResponse(StatusCodes.Status204NoContent, "Credit note deleted successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Credit note not found")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Cannot delete approved/completed credit notes")]
        public async Task<ActionResult> Delete(int id)
        {
            try
            {
                await _creditNoteService.DeleteCreditNote(id);
                return NoContent();
            }
            catch (ArgumentException ex)
            {
                return NotFound(new { message = ex.Message });
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Upload a PDF document for a credit note
        /// </summary>
        [HttpPost("{id}/upload")]
        [SwaggerResponse(StatusCodes.Status200OK, "Document uploaded successfully", typeof(DocumentUploadResult))]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Credit note not found")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid file type (must be PDF)")]
        [SwaggerResponse(StatusCodes.Status413PayloadTooLarge, "File exceeds 5MB")]
        public async Task<ActionResult<DocumentUploadResult>> UploadDocument(int id, IFormFile file)
        {
            try
            {
                if (file == null || file.Length == 0)
                    return BadRequest(new { message = "No file provided" });

                var result = await _creditNoteService.UploadDocument(id, file);
                return Ok(result);
            }
            catch (ArgumentException ex)
            {
                if (ex.Message.Contains("not found"))
                    return NotFound(new { message = ex.Message });
                
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Download the credit note document
        /// </summary>
        [HttpGet("{id}/download")]
        [SwaggerResponse(StatusCodes.Status200OK, "Document file")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Credit note or document not found")]
        public async Task<ActionResult> DownloadDocument(int id)
        {
            try
            {
                var filePath = await _creditNoteService.GetDocumentPath(id);
                var fileName = Path.GetFileName(filePath);
                
                var fileBytes = await System.IO.File.ReadAllBytesAsync(filePath);
                return File(fileBytes, "application/pdf", fileName);
            }
            catch (ArgumentException ex)
            {
                return NotFound(new { message = ex.Message });
            }
            catch (FileNotFoundException ex)
            {
                return NotFound(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Approve a credit note
        /// </summary>
        [HttpPost("{id}/approve")]
        [SwaggerResponse(StatusCodes.Status200OK, "Credit note approved successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Credit note not found")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid operation")]
        public async Task<ActionResult> Approve(int id, [FromBody] ApproveDto dto)
        {
            try
            {
                await _creditNoteService.ApproveCreditNote(id, dto.ApprovedBy);
                return Ok(new { message = "Credit note approved successfully" });
            }
            catch (ArgumentException ex)
            {
                return NotFound(new { message = ex.Message });
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Reject a credit note
        /// </summary>
        [HttpPost("{id}/reject")]
        [SwaggerResponse(StatusCodes.Status200OK, "Credit note rejected successfully")]
        [SwaggerResponse(StatusCodes.Status404NotFound, "Credit note not found")]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Invalid operation")]
        public async Task<ActionResult> Reject(int id, [FromBody] RejectDto dto)
        {
            try
            {
                await _creditNoteService.RejectCreditNote(id, dto.Reason);
                return Ok(new { message = "Credit note rejected successfully" });
            }
            catch (ArgumentException ex)
            {
                return NotFound(new { message = ex.Message });
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Get credit notes by invoice ID
        /// </summary>
        [HttpGet("invoice/{invoiceId}")]
        [SwaggerResponse(StatusCodes.Status200OK, "List of credit notes for invoice", typeof(List<CreditNoteViewModel>))]
        public async Task<ActionResult<List<CreditNoteViewModel>>> GetByInvoiceId(int invoiceId)
        {
            try
            {
                var result = await _creditNoteService.GetByInvoiceId(invoiceId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }
    }

    // Helper DTOs for approve/reject actions
    public class ApproveDto
    {
        public string ApprovedBy { get; set; } = null!;
    }

    public class RejectDto
    {
        public string Reason { get; set; } = null!;
    }
}
