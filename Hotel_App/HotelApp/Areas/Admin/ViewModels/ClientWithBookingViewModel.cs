using HotelApp.Models;

public class ClientWithBookingViewModel
{
    public AppUser User { get; set; }
    public List<BookingInfo> Bookings { get; set; }

    public class BookingInfo
    {
        public DateTime CheckIn { get; set; }
        public DateTime? NgayTraPhong { get; set; }
        public string RoomCode { get; set; }
        public int RoomId { get; set; }
    }
}
