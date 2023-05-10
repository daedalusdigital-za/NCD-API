using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Otp : BaseModel<int>
    {
        public int Code { get; set; }
        public string MobileNo { get; set; }
    }
}
