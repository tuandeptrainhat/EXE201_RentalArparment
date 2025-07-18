using HotelApp.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


namespace HotelApp.Data
{
    public class ApplicationDbContext : IdentityDbContext<AppUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        public DbSet<RoomType> RoomTypes { get; set; }
        public DbSet<Amenity> Amenities { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<Voucher> Vouchers { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Area> Areas { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<AppUser> AppUsers { get; set; }
        public DbSet<Booking> Bookings { get; set; }
        public DbSet<CCCD> CCCDs { get; set; }
        public DbSet<Conversation> Conversations { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<TimePayment> TimePayment { get; set; }
        public DbSet<HistoryPayment> HistoryPayment { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configure relationships (unchanged)
            modelBuilder.Entity<Conversation>()
                .HasOne(c => c.Customer)
                .WithMany()
                .HasForeignKey(c => c.CustomerId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Conversation>()
                .HasOne(c => c.Admin)
                .WithMany()
                .HasForeignKey(c => c.AdminId)
                .OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<Message>()
                .HasOne(m => m.Conversation)
                .WithMany(c => c.Messages)
                .HasForeignKey(m => m.ConversationId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Message>()
                .HasOne(m => m.Sender)
                .WithMany()
                .HasForeignKey(m => m.SenderId)
                .OnDelete(DeleteBehavior.Restrict);

            // No role seeding if roles are already in the database
            modelBuilder.Entity<IdentityRole>().HasData(
                new IdentityRole
                {
                    Id = Guid.NewGuid().ToString(),
                    Name = "Admin",
                    NormalizedName = "ADMIN"
                },
                new IdentityRole
                {
                    Id = Guid.NewGuid().ToString(),
                    Name = "Client",
                    NormalizedName = "CLIENT"
                }
            );

            modelBuilder.Entity<HistoryPayment>()
            .HasKey(sc => new { sc.BookingId, sc.TimePaymentId }); // khóa chính kép

            modelBuilder.Entity<HistoryPayment>()
                .HasOne(sc => sc.Booking)
                .WithMany(s => s.History)
                .HasForeignKey(sc => sc.BookingId);

            modelBuilder.Entity<HistoryPayment>()
                .HasOne(sc => sc.TimePayment)
                .WithMany(c => c.History)
                .HasForeignKey(sc => sc.TimePaymentId);

        }

    }
}
