using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using HotelApp.Models;

namespace HotelApp.Controllers
{
    public class ChatController : Controller
    {
        private readonly UserManager<AppUser> _userManager;

        public ChatController(UserManager<AppUser> userManager)
        {
            _userManager = userManager;
        }

        [Authorize]
        public async Task<IActionResult> Index()
        {
            var user = await _userManager.GetUserAsync(User);
            if (await _userManager.IsInRoleAsync(user, "Admin"))
            {
                return RedirectToAction("Index", "Chat", new { area = "Admin" });
            }
            else if (await _userManager.IsInRoleAsync(user, "Client"))
            {
                return RedirectToAction("Index", "Chat", new { area = "Client" });
            }
            return RedirectToAction("AccessDenied", "Account");
        }
    }
}