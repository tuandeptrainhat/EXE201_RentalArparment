using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelApp.Models
{
    public class Conversation
    {
        [Key]
        public string Id { get; set; } = Guid.NewGuid().ToString();

        [Required]
        public string CustomerId { get; set; }

        public string? AdminId { get; set; } // Make nullable

        [Required]
        public DateTime StartDate { get; set; }

        [Required]
        public string Status { get; set; }

        public AppUser Customer { get; set; }
        public AppUser? Admin { get; set; } // Make nullable
        public List<Message> Messages { get; set; } = new List<Message>();
    }
}