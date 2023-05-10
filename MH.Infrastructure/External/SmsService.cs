using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.Identity.Client;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace MH.Infrastructure.External
{
    public class SmsService : ISmsService
    {
        private readonly TwilioConfiguration _twilioConfiguration;
        public SmsService(IOptions<TwilioConfiguration> twilioConfiguration)
        {
            _twilioConfiguration = twilioConfiguration.Value;
        }
        public async Task SendSms(string sendTo, string body)
        {
            TwilioClient.Init(_twilioConfiguration.Sid, _twilioConfiguration.Token);

            var response = MessageResource.Create(
                body: body,
                from: new PhoneNumber(_twilioConfiguration.PhoneNumber),
                to: new PhoneNumber(sendTo)
            );
        }
    }
}
