using System;
using System.ComponentModel.DataAnnotations;

namespace HotelApp.Models
{
    public class Message
    {
        [Key]
        public string Id { get; set; } = Guid.NewGuid().ToString();

        [Required]
        public string ConversationId { get; set; }

        [Required]
        public string SenderId { get; set; }

        [Required]
        public string Content { get; set; }

        [Required]
        public DateTime Timestamp { get; set; }

        public bool IsRead { get; set; }

        public AppUser Sender { get; set; }
        public Conversation Conversation { get; set; }
    }
}