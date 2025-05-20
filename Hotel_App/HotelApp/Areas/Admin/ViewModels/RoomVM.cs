namespace HotelApp.Areas.Admin.ViewModels
{
    public class RoomVM
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string RoomTypeName { get; set; }
        public string AreaName { get; set; } 
        public string QuanHuyen { get; set; } 
        public string PhuongXa { get; set; }
        public decimal Price { get; set; }
        public decimal Discount { get; set; }
        public int Status { get; set; }
    }

}
