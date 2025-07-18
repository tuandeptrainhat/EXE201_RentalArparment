using HotelApp.Data;
using HotelApp.Models;
using HotelApp.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotelApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class ChatController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly ApplicationDbContext _context;

        public ChatController(UserManager<AppUser> userManager, ApplicationDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }

        [HttpGet]
        [Route("/Admin/Chat/Index")]
        public async Task<IActionResult> Index(string conversationId = null)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var viewModel = new ChatViewModel();

            var conversations = await _context.Conversations
                .Include(c => c.Customer)
                .Include(c => c.Messages)
                .Where(c => c.AdminId == currentUser.Id || c.AdminId == null)
                .OrderByDescending(c => c.Messages.Max(m => m.Timestamp))
                .ToListAsync();

            viewModel.Conversations = conversations.Select(c => new ConversationViewModel
            {
                ConversationId = c.Id,
                OtherUserName = c.Customer.FullName,
                OtherUserEmail = c.Customer.Email,
                LastMessage = c.Messages.OrderByDescending(m => m.Timestamp).FirstOrDefault()?.Content ?? "",
                LastMessageTime = c.Messages.OrderByDescending(m => m.Timestamp).FirstOrDefault()?.Timestamp ?? c.StartDate
            }).ToList();

            if (!string.IsNullOrEmpty(conversationId))
            {
                var conversation = await _context.Conversations
                    .Include(c => c.Messages)
                        .ThenInclude(m => m.Sender)
                    .FirstOrDefaultAsync(c => c.Id == conversationId);

                if (conversation != null)
                {
                    if (conversation.AdminId == null)
                    {
                        conversation.AdminId = currentUser.Id;
                        await _context.SaveChangesAsync();
                    }

                    viewModel.ConversationId = conversation.Id;
                    viewModel.OtherUserName = conversation.Customer.FullName;
                    viewModel.OtherUserEmail = conversation.Customer.Email;
                    viewModel.Messages = conversation.Messages.Select(m => new MessageViewModel
                    {
                        Id = m.Id,
                        SenderName = m.Sender.FullName,
                        Content = m.Content,
                        Timestamp = m.Timestamp.ToString("HH:mm"),
                        IsOwnMessage = m.SenderId == currentUser.Id
                    }).OrderBy(m => m.Timestamp).ToList();
                }
            }

            ViewData["CurrentUserId"] = currentUser.Id;
            return View("Chat", viewModel);
        }

        [HttpGet]
        [Route("/Admin/Chat/GetMessages")]
        public async Task<IActionResult> GetMessages(string conversationId, DateTime? afterTimestamp = null)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var conversation = await _context.Conversations
                .Include(c => c.Messages)
                    .ThenInclude(m => m.Sender)
                .FirstOrDefaultAsync(c => c.Id == conversationId && (c.AdminId == currentUser.Id || c.AdminId == null));

            if (conversation == null)
            {
                return NotFound();
            }

            var messagesQuery = conversation.Messages.AsQueryable();
            if (afterTimestamp.HasValue)
            {
                messagesQuery = messagesQuery.Where(m => m.Timestamp > afterTimestamp.Value);
            }

            var messages = messagesQuery.Select(m => new MessageViewModel
            {
                Id = m.Id,
                SenderName = m.Sender.FullName,
                Content = m.Content,
                Timestamp = m.Timestamp.ToString("HH:mm"),
                IsOwnMessage = m.SenderId == currentUser.Id
            }).OrderBy(m => m.Timestamp).ToList();

            return Json(messages);
        }

        [HttpPost]
        [Route("/Admin/Chat/SendMessage")]
        public async Task<IActionResult> SendMessage(string conversationId, string content)
        {
            if (string.IsNullOrWhiteSpace(content))
            {
                return BadRequest("Message content cannot be empty.");
            }

            var currentUser = await _userManager.GetUserAsync(User);
            var conversation = await _context.Conversations
                .FirstOrDefaultAsync(c => c.Id == conversationId && (c.AdminId == currentUser.Id || c.AdminId == null));

            if (conversation == null)
            {
                return NotFound();
            }

            if (conversation.AdminId == null)
            {
                conversation.AdminId = currentUser.Id;
            }

            var message = new Message
            {
                ConversationId = conversationId,
                SenderId = currentUser.Id,
                Content = content,
                Timestamp = DateTime.Now,
                IsRead = false
            };

            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            var messageViewModel = new MessageViewModel
            {
                Id = message.Id,
                SenderName = currentUser.FullName,
                Content = message.Content,
                Timestamp = message.Timestamp.ToString("HH:mm"),
                IsOwnMessage = true
            };

            return Json(messageViewModel);
        }
    }
}