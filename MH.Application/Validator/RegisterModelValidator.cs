using FluentValidation;
using MH.Domain.Model;

namespace MH.Application.Validator
{
    public class RegisterModelValidator : AbstractValidator<RegisterModel>
    {
        public RegisterModelValidator()
        {
            RuleFor(x => x.FirstName)
                .NotNull()
                .NotEmpty()
                .WithMessage("First name must not be empty");
            RuleFor(x => x.LastName)
                .NotNull()
                .NotEmpty()
                .WithMessage("Last name must not be empty");
            RuleFor(x => x.Email)
                .NotNull()
                .NotEmpty()
                .WithMessage("Email must not be empty");
            RuleFor(x => x.PhoneNumber)
                .NotNull()
                .NotEmpty()
                .WithMessage("EPhone number must not be empty");
            RuleFor(x => x.Password)
                .NotNull()
                .NotEmpty()
                .WithMessage("Password must not be empty");
        }
    }
}
