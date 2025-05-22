namespace HotelApp.ViewModels
{
    public class MessageViewModel
    {
        public string Id { get; set; }
        public string SenderName { get; set; }
        public string Content { get; set; }
        public string Timestamp { get; set; }
        public bool IsOwnMessage { get; set; }
    }
}
