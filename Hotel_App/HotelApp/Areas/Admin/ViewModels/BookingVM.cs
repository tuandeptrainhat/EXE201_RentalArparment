namespace HotelApp.Areas.Admin.ViewModels
{
    public class BookingVM
    {
        public int Id { get; set; }
        public int RoomId { get; set; }
        public string UserName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int BookingStatus { get; set; }
        public int? PayType { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}