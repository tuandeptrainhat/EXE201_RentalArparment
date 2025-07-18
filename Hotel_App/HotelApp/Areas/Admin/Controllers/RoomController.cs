using HotelApp.Data;
using HotelApp.Areas.Admin.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HotelApp.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Build.Framework;
using AspNetCoreGeneratedDocument;

namespace HotelApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class RoomController : Controller
    {
        private readonly ApplicationDbContext _context;

        public RoomController(ApplicationDbContext context)
        {
            _context = context;
        }

        [Route("Admin")]
        [Route("Manage/Room/Index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("Room/ListRoom")]
        public async Task<IActionResult> ListRoom()
        {
            var rooms = await _context.Rooms
            .Include(r => r.RoomType) // Lấy thông tin RoomType
            .Include(r => r.Area) // Lấy thông tin Area
            .Select(r => new RoomVM
            {
                Id = r.Id,
                RoomTypeName = r.RoomType.Name,
                AreaName = r.Area.Name,
                Price = r.Price,
                Discount = r.Discount,
                Status = r.Status,
                Code = r.Code,
                PhuongXa = r.PhuongXa,
                QuanHuyen = r.QuanHuyen
            })
            .ToListAsync();

            return Json(new { Data = rooms });
        }
        [HttpGet]
        [Route("Room/Create")]
        public async Task<IActionResult> Create()
        {
            var viewModel = new RoomEditVM
            {
                RoomTypes = await _context.RoomTypes.Select(rt => new RoomType { Id = rt.Id, Name = rt.Name }).ToListAsync(),
                Areas = await _context.Areas.Select(a => new Area { Id = a.Id, Name = a.Name }).ToListAsync(),
                SelectedAmenities = new List<int>(),
                Amenities = await _context.Amenities.ToListAsync(),
            };

            ViewData["Statuses"] = GetStatuses();
            return View(viewModel);
        }

        [HttpPost]
        [Route("Room/Create")]
        public async Task<IActionResult> Create(RoomEditVM viewModel, IFormFileCollection newImages)
        {

            var room = new Room
            {
                TypeId = viewModel.TypeId,
                AreaId = 18,
                Price = viewModel.Price,
                Discount = viewModel.Discount,
                Status = viewModel.Status,
                QuanHuyen = viewModel.QuanHuyen?.Split('_').Length > 1 ? viewModel.QuanHuyen.Split('_')[1] : viewModel.QuanHuyen,
                PhuongXa = viewModel.PhuongXa?.Split('_').Length > 1 ? viewModel.PhuongXa.Split('_')[1] : viewModel.PhuongXa,
                Amenities = await _context.Amenities.Where(a => viewModel.SelectedAmenities.Contains(a.Id)).ToListAsync(),
                Images = new List<Image>(),
                Code = DateTime.Now.ToString()
            };

            if (newImages?.Count > 0)
            {
                foreach (var file in newImages)
                {
                    var filePath = Path.Combine("wwwroot/upload", file.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }

                    room.Images.Add(new Image { Path = "/upload/" + file.FileName, Caption = file.FileName });
                }
            }

            _context.Rooms.Add(room);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }


        [HttpGet]
        [Route("Room/Details/{id}")]
        public async Task<IActionResult> Details(int id)
        {
            var room = await _context.Rooms
                .Include(r => r.RoomType)
                .Include(r => r.Area)
                .Include(r => r.Amenities)
                .Include(r => r.Images)
                .FirstOrDefaultAsync(r => r.Id == id);

            if (room == null) return NotFound();

            var viewModel = new RoomDetailsVM
            {
                Id = room.Id,
                RoomTypeName = room.RoomType.Name,
                AreaName = room.Area.Name,
                Price = room.Price,
                Discount = room.Discount,
                Status = room.Status,
                QuanHuyen = room.QuanHuyen,
                PhuongXa = room.PhuongXa,
                Code = room.Code,
                Amenities = room.Amenities.Select(a => a.Name).ToList(),
                Images = room.Images.ToList()
            };
            ViewData["Statuses"] = GetStatuses();

            return View(viewModel);
        }


        [HttpGet]
        [Route("Room/Edit/{id}")]
        public async Task<IActionResult> Edit(int id)
        {
            var room = await _context.Rooms
                .Include(r => r.RoomType)
                .Include(r => r.Area)
                .Include(r => r.Amenities)
                .Include(r => r.Images)
                .FirstOrDefaultAsync(r => r.Id == id);

            if (room == null) return NotFound();

            var viewModel = new RoomEditVM
            {
                Id = room.Id,
                TypeId = room.TypeId,
                AreaId = room.AreaId,
                Price = room.Price,
                Discount = room.Discount,
                Status = room.Status,
                PhuongXa = room.PhuongXa,
                QuanHuyen = room.QuanHuyen,
                Code = room.Code,
                RoomTypes = await _context.RoomTypes.Select(rt => new RoomType
                {
                    Id = rt.Id,
                    Name = rt.Name
                }).ToListAsync(),
                Areas = await _context.Areas.Select(a => new Area
                {
                    Id = a.Id,
                    Name = a.Name
                }).ToListAsync(),
                Amenities = await _context.Amenities.ToListAsync(),
                SelectedAmenities = room.Amenities.Select(a => a.Id).ToList(),
                Images = room.Images.ToList()
            };
            ViewData["Statuses"] = GetStatuses();
            ViewBag.QuanHuyen = viewModel.QuanHuyen;
            ViewBag.PhuongXa = viewModel.PhuongXa;
            return View(viewModel);
        }



        [HttpPost]
        [Route("Room/Edit/{id}")]
        public async Task<IActionResult> Edit(RoomEditVM viewModel, IFormFileCollection newImages)
        {
            var room = await _context.Rooms
                .Include(r => r.Amenities)
                .Include(r => r.Images)
                .FirstOrDefaultAsync(r => r.Id == viewModel.Id);

            if (room == null) return NotFound();

            room.TypeId = viewModel.TypeId;
            room.AreaId = viewModel.AreaId;
            room.Price = viewModel.Price;
            room.Discount = viewModel.Discount;
            room.Status = viewModel.Status;
            room.Code = viewModel.Code;
            if (viewModel.PhuongXa != null && viewModel.QuanHuyen != null)
            {
                room.PhuongXa = viewModel.PhuongXa?.Split('_').Length > 1 ? viewModel.PhuongXa.Split('_')[1] : viewModel.PhuongXa;
                room.QuanHuyen = viewModel.QuanHuyen?.Split('_').Length > 1 ? viewModel.QuanHuyen.Split('_')[1] : viewModel.QuanHuyen;
            }
            // Cập nhật tiện ích
            room.Amenities.Clear();
            var selectedAmenities = await _context.Amenities.Where(a => viewModel.SelectedAmenities.Contains(a.Id)).ToListAsync();
            room.Amenities = selectedAmenities;

            // Thêm ảnh mới
            if (newImages?.Count > 0)
            {
                foreach (var file in newImages)
                {
                    var filePath = Path.Combine("wwwroot/upload", file.FileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }

                    room.Images.Add(new Image { Path = "/upload/" + file.FileName, Caption = file.FileName });
                }
            }
            ViewData["Statuses"] = GetStatuses();
            _context.Rooms.Update(room);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }


        // Xóa phòng
        [HttpPost]
        [Route("Room/Delete/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var room = await _context.Rooms.FindAsync(id);
            if (room == null) return Json(new { success = true, message = "Không tìm thấy phòng!" });

            _context.Rooms.Remove(room);
            await _context.SaveChangesAsync();
            return Json(new { success = true, message = "Xóa thành công!" });
        }

        // Hàm lấy danh sách trạng thái
        private List<SelectListItem> GetStatuses()
        {
            return new List<SelectListItem>
        {
            new SelectListItem { Value = "0", Text = "Hoạt động" },
            new SelectListItem { Value = "1", Text = "không hoạt động" },
            new SelectListItem { Value = "-1", Text = "bảo trì" }
        };
        }
        [HttpPost]
        [Route("Room/DeleteImage")]
        public async Task<IActionResult> DeleteImage(int id)
        {
            var image = await _context.Images.FindAsync(id);
            if (image == null)
            {
                return Json(new { success = false, message = "Ảnh không tồn tại." });
            }

            _context.Images.Remove(image);
            await _context.SaveChangesAsync();

            return Json(new { success = true });
        }

        [HttpPost]
        [Route("Room/EditImageCaption")]
        public async Task<IActionResult> EditImageCaption(int id, string caption)
        {
            var image = await _context.Images.FindAsync(id);
            if (image == null)
            {
                return Json(new { success = false, message = "Ảnh không tồn tại." });
            }

            image.Caption = caption;
            _context.Images.Update(image);
            await _context.SaveChangesAsync();

            return Json(new { success = true });
        }

        [Route("/ThongKe")]
        public async Task<IActionResult> ThongKe()
        {
            var list = await _context.Rooms.Where(x => x.Status == -1).ToListAsync();
            var result = new List<ThongKeVM>();
            var listbooking = await _context.Bookings
                .Where(x => x.Status == 0)
                .ToListAsync();

            foreach (var item in list)
            {
                var b = listbooking.FirstOrDefault(x => x.RoomID == item.Id);
                if (b == null) continue; // nếu không có booking → bỏ qua

                var tk = new ThongKeVM();

                // ✅ Tính đúng hoa hồng 10%
                tk.DoanhThu = (item.Price * (b.ThoiGianHopDong ?? 1)) / 10;

                // ✅ Lấy tháng/năm từ thời điểm booking thay vì từ item.Code
                var date = b.CreateAt; // hoặc dùng b.CheckIn nếu bạn muốn theo ngày nhận phòng

                tk.Thang = date.Month;
                tk.Nam = date.Year;

                result.Add(tk);
            }

            return Json(new { data = result });
        }


        [Route("/Rooms/Customer/{id}")]
        public async Task<IActionResult> ListCustomer(int id)
        {
            var list = await _context.Bookings.Include(x => x.User).Where(x => x.RoomID == id && x.Status != -1 && x.Status != -100).ToListAsync();
            return Json(new { Data = list });
        }

        [Route("Manage/Room/AllBookings")]
        public async Task<IActionResult> AllBookings()
        {
            var bookings = await _context.Bookings
                .Include(b => b.Room)
                .Include(b => b.User)
                .Where(b => b.Status != -1)
                .Select(b => new BookingVM
                {
                    Id = b.Id,
                    RoomId = b.RoomID,
                    UserName = b.User.FullName,
                    BookingStatus = b.Status,
                    PayType = b.PayType,
                    CreatedAt = b.CreateAt
                })
                .ToListAsync();

            return View(bookings);
        }
        [HttpPost]
        [Route("Room/UpdateBookingStatus")]
        public async Task<IActionResult> UpdateBookingStatus(int bookingId, int status)
        {
            var booking = await _context.Bookings
                .Include(b => b.Room)
                .FirstOrDefaultAsync(b => b.Id == bookingId);

            if (booking == null)
            {
                return Json(new { success = false, message = "Booking không tồn tại." });
            }

            if (status == -1)
            {
                _context.Bookings.Remove(booking);
                await _context.SaveChangesAsync();
                return Json(new { success = true, message = "Booking đã được hủy và xóa thành công." });
            }

            booking.Status = status;
            booking.UpdateAt = DateTime.Now;

            // Nếu trạng thái là "Đã hoàn thành" (2), cập nhật Room.Status = -1
            if (status == 2)
            {
                booking.Room.Status = -1; // Đóng phòng
                _context.Rooms.Update(booking.Room);
            }

            _context.Bookings.Update(booking);
            await _context.SaveChangesAsync();

            return Json(new { success = true, message = "Cập nhật trạng thái booking thành công." });
        }

        [HttpGet]
        [Route("Manage/Room/GetAllBookings")]
        public async Task<IActionResult> GetAllBookings()
        {
            var bookings = await _context.Bookings
                .Include(b => b.Room)
                .Include(b => b.User)
                .Where(b => b.Status != -1 && b.Room.Status != -1)
                .Select(b => new BookingVM
                {
                    Id = b.Id,
                    RoomId = b.RoomID,
                    UserName = b.User.FullName,
                    Phone = b.User.PhoneNumber,
                    Email = b.User.Email,
                    BookingStatus = b.Status,
                    PayType = b.PayType,
                    CreatedAt = b.CreateAt
                })
                .ToListAsync();

            return Json(new { data = bookings });
        }

    }
}
