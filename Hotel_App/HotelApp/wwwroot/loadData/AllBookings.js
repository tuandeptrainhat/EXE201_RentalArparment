$(document).ready(function () {
    var table = $('#bookingsTable').DataTable({
        ordering: true,
        columns: [
            { data: null, render: (data, type, row, meta) => meta.row + 1 },
            { data: 'userName' },
            { data: 'phone', orderable: false },
            { data: 'email', orderable: false },
            {
                data: 'bookingStatus',
                render: function (data, type, row) {
                    var statusText = '';
                    if (data == 0) statusText = 'Chờ xác nhận';
                    else if (data == 1) statusText = 'Đã xác nhận';
                    else if (data == -1) statusText = 'Đã hủy';
                    else if (data == 2) statusText = 'Đã hoàn thành';
                    return `<select class="form-select booking-status" data-booking-id="${row.id}" style="background-color: white; color: black;">
                        <option value="0" ${data == 0 ? 'selected' : ''}>Chờ xác nhận</option>
                        <option value="1" ${data == 1 ? 'selected' : ''}>Đã xác nhận</option>
                        <option value="-1" ${data == -1 ? 'selected' : ''}>Đã hủy</option>
                        <option value="2" ${data == 2 ? 'selected' : ''}>Đã hoàn thành</option>
                    </select>`;
                },
                orderable: false
            },
            {
                data: 'payType',
                render: (data) => data == 0 ? 'Không' : 'Có',
                orderable: false
            }, // Cọc
            {
                data: 'createdAt',
                render: function (data, type, row) {
                    if (type === 'sort') {
                        var parts = data.split('/');
                        return `${parts[2]}-${parts[1]}-${parts[0]}`; // Convert dd/MM/yyyy to yyyy-MM-dd
                    }
                    return data;
                },
                orderable: false
            },
            {
                data: null,
                render: function (data, type, row) {
                    return `<a href="/Room/Details/${row.roomId}" class="btn btn-sm btn-info">Xem phòng</a>
                            <button class="btn btn-sm btn-primary update-status" data-room-id="${row.roomId}" data-booking-id="${row.id}" >Cập nhật</button>`;
                },
                orderable: false
            }
        ],
        columnDefs: [
            { width: "5%", targets: 0 },  // STT
            { width: "15%", targets: 1 }, // Khách hàng
            { width: "15%", targets: 2 }, // Phone
            { width: "15%", targets: 3 }, // Email
            { width: "15%", targets: 4 }, // Trạng thái booking
            { width: "10%", targets: 5 }, // Cọc
            { width: "20%", targets: 6 }, // Ngày tạo
            { width: "20%", targets: 7 }  // Hành động
        ],
        order: [[6, 'asc']], // Initial sort: Ngày tạo (asc)
        rowCallback: function (row, data) {
            $(row).attr('style', '');
            if (data.bookingStatus == 1) {
                $(row).attr('style', 'background-color: #66FF99 !important; color: white !important;');
            } else if (data.bookingStatus == 2) {
                $(row).attr('style', 'background-color: #FFD700 !important; color: black !important;');
            }
        }
    });

    function loadData() {
        $.ajax({
            url: '/Manage/Room/GetAllBookings',
            type: 'GET',
            success: function (response) {
                table.clear().rows.add(response.data).draw();
            },
            error: function () {
                alert('Đã có lỗi xảy ra khi tải dữ liệu.');
            }
        });
    }

    loadData();

    // Handle status updates
    $('#bookingsTable tbody').on('click', '.update-status', function () {
        var roomId = $(this).data('room-id');
        var bookingId = $(this).data('booking-id');
        var bookingStatus = $(this).closest('tr').find('.booking-status').val();

        $.ajax({
            url: '/Room/UpdateBookingStatus',
            type: 'POST',
            data: { bookingId: bookingId, status: bookingStatus },
            success: function (response) {
                if (response.success) {
                    alert(response.message);
                    loadData();
                } else {
                    alert(response.message);
                }
            }.bind(this),
            error: function () {
                alert('Đã có lỗi xảy ra khi cập nhật trạng thái booking.');
            }
        });
    });
});