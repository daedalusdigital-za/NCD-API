using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MH.Infrastructure.External
{
    public interface ISmsService
    {
        Task SendSms(string sendTo, string body);
    }
}
