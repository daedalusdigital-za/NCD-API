using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Emit;
using MH.Domain.DBModel;
using MH.Domain.IEntity;

namespace MH.Infrastructure.DBContext
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser, Role, int, IdentityUserClaim<int>, UserRole, IdentityUserLogin<int>,
    IdentityRoleClaim<int>, IdentityUserToken<int>>
    {
        private ICurrentUser _currentUser;
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options, ICurrentUser currentUser) : base(options)
        {
            _currentUser = currentUser;
            ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
            this.ChangeTracker.LazyLoadingEnabled = false;
        }

        public DbSet<Permission> Permission { get; set; }
        public DbSet<Otp> Otp { get; set; }
        
        // New entities for comprehensive API
        public DbSet<TrainingSession> TrainingSessions { get; set; }
        public DbSet<Trainer> Trainers { get; set; }
        public DbSet<TrainingRegister> TrainingRegisters { get; set; }
        public DbSet<Province> Provinces { get; set; }
        public DbSet<District> Districts { get; set; }
        public DbSet<Hospital> Hospitals { get; set; }
        public DbSet<Clinic> Clinics { get; set; }
        public DbSet<InventoryItem> InventoryItems { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Sale> Sales { get; set; }
        public DbSet<SaleItem> SaleItems { get; set; }
        public DbSet<Delivery> Deliveries { get; set; }
        public DbSet<FileEntity> Files { get; set; }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.Entity<ApplicationUser>(b =>
            {
                // Each User can have many UserClaims
                b.HasMany(e => e.Claims)
                    .WithOne()
                    .HasForeignKey(uc => uc.UserId)
                    .IsRequired();

                // Each User can have many UserLogins
                b.HasMany(e => e.Logins)
                    .WithOne()
                    .HasForeignKey(ul => ul.UserId)
                    .IsRequired();

                // Each User can have many UserTokens
                b.HasMany(e => e.Tokens)
                    .WithOne()
                    .HasForeignKey(ut => ut.UserId)
                    .IsRequired();

                // Each User can have many entries in the UserRole join table
                b.HasMany(e => e.UserRoles)
                    .WithOne(e => e.User)
                    .HasForeignKey(ur => ur.UserId)
                    .IsRequired();
            });

            builder.Entity<Role>(b =>
            {
                // Each Role can have many entries in the UserRole join table
                b.HasMany(e => e.UserRoles)
                    .WithOne(e => e.Role)
                    .HasForeignKey(ur => ur.RoleId)
                    .IsRequired();
            });

        builder.ApplyConfigurationsFromAssembly(typeof(ApplicationDbContext).Assembly);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.EnableSensitiveDataLogging()
            //    .LogTo(Console.WriteLine);
        }
        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        {

            foreach (var item in ChangeTracker.Entries<IAuditable>())
            {
                switch (item.State)
                {
                    case EntityState.Added:
                        item.Entity.DateCreated = DateTime.Now;
                        item.Entity.CreatedBy = item.Entity.CreatedBy != 0 ? item.Entity.CreatedBy : _currentUser.User.Id;
                        item.Entity.UpdatedBy = item.Entity.UpdatedBy != null ? item.Entity.UpdatedBy : _currentUser.User.Id;
                        break;
                    case EntityState.Modified:
                        item.Entity.LastUpdated = DateTime.Now;
                        item.Entity.UpdatedBy = item.Entity.UpdatedBy != null ? item.Entity.UpdatedBy : _currentUser.User.Id;
                        break;
                }
            }

            return base.SaveChangesAsync(cancellationToken);
        }
    }
}