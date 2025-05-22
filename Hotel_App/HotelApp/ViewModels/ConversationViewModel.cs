namespace HotelApp.ViewModels
{
    public class ConversationViewModel
    {
        public string ConversationId { get; set; }
        public string OtherUserEmail { get; set; }
        public string OtherUserName { get; set; }
        public string LastMessage { get; set; }
        public DateTime LastMessageTime { get; set; }
    }
}
