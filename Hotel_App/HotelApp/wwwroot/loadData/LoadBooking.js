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
                width: "10%"
            }, // Giá
            {
                data: 'payType',
                render: (data) => data == 0 ? 'Không' : 'Có',
                width: "10%"
            }, // Cọc
            {
                data: 'status',
                render: (data) => {
                    if (data == 0) return 'Đang chờ';
                    else if (data == 1) return 'Đã xác nhận';
                    else if (data == -100) return 'Đã thanh toán';
                    else if (data == 2) return 'Đã hoàn thành';
                    else return 'Đã hủy';
                },
                width: "10%"
            }, // Trạng thái
            {
                data: 'id',
                render: (data, type, row) => {
                    if (row.status === 0) { // Chỉ hiển thị nút "Hủy" khi trạng thái là "Đang chờ"
                        return `
                            <a onClick="Cancel('/Client/Cancel/${data}')" class="btn btn-danger btn-sm">Hủy</a>
                        `;
                    }
                    return '';
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