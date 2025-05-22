namespace HotelApp.ViewModels
{
    public class ChatViewModel
    {
        public string ConversationId { get; set; }
        public string OtherUserEmail { get; set; }
        public string OtherUserName { get; set; }
        public string LastMessage { get; set; }
        public DateTime LastMessageTime { get; set; }
        public List<ConversationViewModel> Conversations { get; set; } = new List<ConversationViewModel>();
        public List<MessageViewModel> Messages { get; set; } = new List<MessageViewModel>();
    }
}
