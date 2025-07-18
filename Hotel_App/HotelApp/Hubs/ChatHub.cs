// /Hubs/ChatHub.cs
using HotelApp.Data;
using HotelApp.Models;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace HotelApp.Hubs
{
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _context;

        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task SendMessage(string conversationId, string content)
        {
            var userId = Context.UserIdentifier ?? Context.User.Identity.Name;
            var message = new Message
            {
                ConversationId = conversationId,
                SenderId = userId,
                Content = content,
                Timestamp = DateTime.Now,
                IsRead = false
            };

            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            var timestamp = message.Timestamp.ToString("HH:mm");
            await Clients.Group(conversationId).SendAsync("ReceiveMessage", message.Id, userId, Context.User.Identity.Name, content, timestamp);
            await Clients.Group(conversationId).SendAsync("NewMessageNotification", conversationId, Context.User.Identity.Name, content);
        }

        public async Task StartConversation(string userId)
        {
            var conversation = new Conversation
            {
                CustomerId = userId,
                StartDate = DateTime.Now,
                Status = "Active"
            };
            _context.Conversations.Add(conversation);
            await _context.SaveChangesAsync();

            await Groups.AddToGroupAsync(Context.ConnectionId, conversation.Id);
            await Clients.Caller.SendAsync("ConversationStarted", conversation.Id);
        }

        public async Task JoinConversation(string conversationId)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, conversationId);
        }

        public override async Task OnConnectedAsync()
        {
            var userId = Context.UserIdentifier ?? Context.User.Identity.Name;
            var conversations = await _context.Conversations
                .Where(c => c.CustomerId == userId || c.AdminId == userId)
                .Select(c => c.Id)
                .ToListAsync();

            foreach (var conversationId in conversations)
            {
                await Groups.AddToGroupAsync(Context.ConnectionId, conversationId);
            }

            await Clients.All.SendAsync("UpdateUserStatus", userId, true);
            await base.OnConnectedAsync();
        }

        public override async Task OnDisconnectedAsync(Exception exception)
        {
            var userId = Context.UserIdentifier ?? Context.User.Identity.Name;
            await Clients.All.SendAsync("UpdateUserStatus", userId, false);
            await base.OnDisconnectedAsync(exception);
        }
    }
}