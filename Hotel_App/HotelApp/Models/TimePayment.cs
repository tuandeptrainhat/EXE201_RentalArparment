namespace HotelApp.Models
{
    public class TimePayment
    {
        public int Id { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }

        public ICollection<HistoryPayment> History { get; set; }
    }
}
