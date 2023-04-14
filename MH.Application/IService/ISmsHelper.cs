namespace MH.Application.IService
{
    public interface ISmsHelper
    {
        Task<int> SendSms(string mobileNumber);
    }
}
