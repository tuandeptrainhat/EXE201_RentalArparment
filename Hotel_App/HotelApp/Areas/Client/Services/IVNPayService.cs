using HotelApp.Areas.Client.ViewModels;
using HotelApp.Models;
using HotelApp.ViewModels;

namespace HotelApp.Areas.Client.Services
{
    public interface IVNPayService
    {
        // Tạo URL thanh toán VNPay
        string CreatePaymentUrl(HttpContext context, Booking booking);

        VnPaymentResponseModel PaymentExecute(IQueryCollection collections);
    }
}
