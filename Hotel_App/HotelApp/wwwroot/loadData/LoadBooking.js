$(document).ready(function () {
    $('#bookingsTable').DataTable({
        ajax: {
            url: '/Client/Bookings',
            type: 'GET',
            dataSrc: 'data'
        },
        columns: [
            {
                data: null,
                render: (data, type, row, meta) => meta.row + 1,
                width: "10%"
            }, // STT
            {
                data: 'typeName',
                width: "15%"
            }, // Căn hộ
            {
                data: 'quanHuyen',
                width: "12.5%"
            }, // Quận Huyện
            {
                data: 'phuongXa',
                width: "12.5%"
            }, // Phường Xã
            {
                data: 'price',
                width: "7.25%"
            }, // Giá
            {
                data: 'payType',
                render: (data) => data == 0 ? 'Tiền mặt' : 'VNPay',
                width: "7.25%"
            }, // Cọc
            {
                data: 'thoiGianHopDong',
                width: "7.25%"
            },
            {
                data: 'status',
                render: (data) => data == 0 ? 'Đang thuê' : 'Trả phòng',
                width: "10%"
            },
            {
                data: 'id',
                render: (data, type, row) => {
                    if (row.status === 0) { // Chỉ hiển thị nút "Hủy" khi trạng thái là "Đang chờ"
                        return `
                            <a onClick="Cancel('/Client/Cancel/${data}')" class="btn btn-danger btn-sm">Trả phòng</a>
                            <a href="/booking/details/${data}" class="btn btn-success btn-sm">Chi tiết</a>
                            
                        `;
                    }
                    return `<a href="/booking/details/${data}" class="btn btn-success btn-sm">Chi tiết</a>`;
                },
                width: "15%"
            } // Chức năng
        ],
        order: [[6, 'desc']] // Sắp xếp theo Trạng thái giảm dần
    });
});

function Cancel(url) {
    var currentPage = $('#bookingsTable').DataTable().page();

    $.ajax({
        url: url,
        type: 'POST',
        success: function (response) {
            if (response.success) {
                toastr.success(response.message);
                var table = $('#bookingsTable').DataTable();
                table.ajax.reload(function () {
                    table.page(currentPage).draw('page');
                });
            } else {
                toastr.error(response.message);
            }
        },
        error: function (xhr, status, error) {
            toastr.error("Lỗi kết nối: " + error);
        }
    });
}