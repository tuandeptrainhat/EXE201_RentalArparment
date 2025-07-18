$(document).ready(function () {
    let id = $('#IdPhong').val();
     $('#CustomerTable').DataTable({
        ajax: {
            url: '/Rooms/Customer/' + id,
            type: 'GET',
            dataSrc: 'data'
        },
        columns: [
            {
                data: null, // Sử dụng null để cho phép DataTable tự động tạo số thứ tự
                render: (data, type, row, meta) => meta.row + 1, // meta.row bắt đầu từ 0
            },
            {
                data: 'user.fullName'
            },
            {
                data: 'user.phoneNumber',
            },
            {
                data: 'user.email',
            },
            {
                data: 'payType',
                render: function (data, type, row, meta) {
                    return data == 0 ? 'Không' : 'Có';
                }
            }
        ],
        columnDefs: [
            { width: "20%", targets: 0 },
            { width: "20%", targets: 1 },
            { width: "20%", targets: 2 },
            { width: "20%" , targets: 3 },
            { width: "20%", targets: 4 }
          
        ]
    });
});
