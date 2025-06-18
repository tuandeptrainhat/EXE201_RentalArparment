namespace HotelApp.Models
{
    public class HistoryPayment
    {
        public int BookingId { get; set; }
        public int TimePaymentId { get; set; }

        public DateTime CreateAt { get; set; }
        public int Status { get; set; }

        public Booking Booking { get; set; }
        public TimePayment TimePayment { get; set; }

    }
}