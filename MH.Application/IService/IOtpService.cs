using MH.Domain.Model;
using MH.Domain.ViewModel;


namespace MH.Application.IService
{
    public interface IOtpService
    {
        Task<OtpViewModel> GetById(int id);
        Task<OtpViewModel> GetByMobileNo(string mobileNo);
        Task Add(OtpModel otp);
    }
}
