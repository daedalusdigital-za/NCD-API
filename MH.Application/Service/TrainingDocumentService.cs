using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.Model;
using MH.Domain.UnitOfWork;
using MH.Domain.ViewModel;
using System;
using System.IO;
using System.Threading.Tasks;

namespace MH.Application.Service
{
    public class TrainingDocumentService : ITrainingDocumentService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IConfiguration _configuration;

        public TrainingDocumentService(IUnitOfWork unitOfWork, IMapper mapper, IConfiguration configuration)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _configuration = configuration;
        }

        public async Task<TrainingDocumentViewModel> UploadPDFAsync(IFormFile file, int trainingSessionId, string documentType, string? fileName, int uploadedBy)
        {
            // Validate file
            if (file == null || file.Length == 0)
                throw new ArgumentException("File is required");

            if (file.ContentType != "application/pdf")
                throw new ArgumentException("Only PDF files are allowed");

            const long maxFileSize = 10 * 1024 * 1024; // 10MB
            if (file.Length > maxFileSize)
                throw new ArgumentException($"File size exceeds maximum allowed size of {maxFileSize / (1024 * 1024)}MB");

            // Validate training session exists
            var trainingSession = await _unitOfWork.TrainingSessionRepository.FindBy(x => x.Id == trainingSessionId);
            if (trainingSession == null)
                throw new System.Exception("Training session not found");

            // Validate document type
            var validDocumentTypes = new[] { "Register", "AttendanceSheet", "Materials" };
            if (!validDocumentTypes.Contains(documentType))
                throw new ArgumentException("Invalid document type");

            // Create file storage path
            string uploadDir = _configuration["FileStorage:UploadDirectory"] ?? "uploads/training-documents";
            string yearMonth = DateTime.UtcNow.ToString("yyyy/MM");
            string sessionDir = Path.Combine(uploadDir, yearMonth, trainingSessionId.ToString());

            if (!Directory.Exists(sessionDir))
                Directory.CreateDirectory(sessionDir);

            // Generate unique filename
            string fileNameWithoutExt = Path.GetFileNameWithoutExtension(fileName ?? file.FileName);
            string timestamp = DateTime.UtcNow.ToString("yyyyMMdd_HHmmss");
            string randomString = Path.GetRandomFileName().Substring(0, 6);
            string storedFileName = $"{documentType}_{trainingSessionId}_{timestamp}_{randomString}.pdf";
            string filePath = Path.Combine(sessionDir, storedFileName);

            // Save file to disk
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            // Create database record
            var document = new TrainingDocument
            {
                TrainingSessionId = trainingSessionId,
                FileName = fileNameWithoutExt,
                OriginalFileName = file.FileName,
                FileSize = file.Length,
                FilePath = filePath,
                DocumentType = documentType,
                MimeType = file.ContentType,
                UploadedBy = uploadedBy,
                DateCreated = DateTime.Now,
                CreatedBy = uploadedBy
            };

            await _unitOfWork.TrainingDocumentRepository.Insert(document);
            await _unitOfWork.CommitAsync();

            // Return view model
            var viewModel = _mapper.Map<TrainingDocumentViewModel>(document);
            viewModel.FileUrl = $"/api/Training/DownloadPDF/{document.Id}";
            viewModel.UploadedAt = document.DateCreated;

            return viewModel;
        }

        public async Task<byte[]> DownloadPDFAsync(int documentId)
        {
            var document = await _unitOfWork.TrainingDocumentRepository.FindBy(x => x.Id == documentId && !x.IsDeleted);
            if (document == null)
                throw new System.Exception("Document not found");

            if (!File.Exists(document.FilePath))
                throw new System.Exception("File not found on disk");

            byte[] fileBytes = await File.ReadAllBytesAsync(document.FilePath);
            return fileBytes;
        }

        public async Task<TrainingDocumentsListViewModel> GetTrainingDocumentsBySessionAsync(int trainingSessionId)
        {
            var documents = await _unitOfWork.TrainingDocumentRepository.GetByTrainingSessionId(trainingSessionId);
            var viewModels = _mapper.Map<List<TrainingDocumentViewModel>>(documents);

            foreach (var vm in viewModels)
            {
                vm.FileUrl = $"/api/Training/DownloadPDF/{vm.Id}";
                vm.UploadedAt = vm.UploadedAt; // Use the mapped value from AutoMapper
            }

            return new TrainingDocumentsListViewModel
            {
                TrainingSessionId = trainingSessionId,
                Documents = viewModels
            };
        }

        public async Task<bool> DeletePDFAsync(int documentId, int userId)
        {
            var document = await _unitOfWork.TrainingDocumentRepository.FindBy(x => x.Id == documentId && !x.IsDeleted);
            if (document == null)
                return false;

            // Check if user is admin or the original uploader
            // For now, allow if user is the uploader
            if (document.UploadedBy != userId)
            {
                throw new UnauthorizedAccessException("You do not have permission to delete this document");
            }

            // Soft delete
            document.IsDeleted = true;
            await _unitOfWork.TrainingDocumentRepository.Update(document);
            await _unitOfWork.CommitAsync();

            // Delete file from disk
            if (File.Exists(document.FilePath))
            {
                File.Delete(document.FilePath);
            }

            return true;
        }
    }
}
