using MH.Domain.Model;
using MH.Domain.ViewModel;
using Microsoft.AspNetCore.Http;

namespace MH.Application.IService
{
    public interface ITrainingDocumentService
    {
        Task<TrainingDocumentViewModel> UploadPDFAsync(IFormFile file, int trainingSessionId, string documentType, string? fileName, int uploadedBy);
        Task<byte[]> DownloadPDFAsync(int documentId);
        Task<TrainingDocumentsListViewModel> GetTrainingDocumentsBySessionAsync(int trainingSessionId);
        Task<bool> DeletePDFAsync(int documentId, int userId);
    }
}
