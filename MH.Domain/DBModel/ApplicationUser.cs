using Microsoft.AspNetCore.Identity;

namespace MH.Domain.DBModel
{
    public class ApplicationUser : IdentityUser<int>
    {
        public int Status { get; set; }
        public int? PositionId { get; set; }
        public virtual ICollection<IdentityUserClaim<int>> Claims { get; set; }
        public virtual ICollection<IdentityUserLogin<int>> Logins { get; set; }
        public virtual ICollection<IdentityUserToken<int>> Tokens { get; set; }
        public virtual ICollection<UserRole> UserRoles { get; set; }


        public virtual Permission CreatedByPermission { get; set; }
        public virtual Permission? UpdatedByPermission { get; set; }

        public virtual UserProfile UserProfile { get; set; }
        
        public virtual Position? Position { get; set; }
        public virtual Position CreatedByPosition { get; set; }
        public virtual Position? UpdatedByPosition { get; set; }

        public virtual ContactDetails CreatedByContactDetails { get; set; }
        public virtual ContactDetails? UpdatedByContactDetails { get; set; }
        
        public virtual Patient Patient { get; set; }
        public virtual Patient CreatedByPatient { get; set; }
        public virtual Patient? UpdatedByPatient { get; set; }
        
        public virtual MedicalHistory MedicalHistory { get; set; }
        public virtual MedicalHistory CreatedByMedicalHistory { get; set; }
        public virtual MedicalHistory? UpdatedByMedicalHistory { get; set; }
    }
}
