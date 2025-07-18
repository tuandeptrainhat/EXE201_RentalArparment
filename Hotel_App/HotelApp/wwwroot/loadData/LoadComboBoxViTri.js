    $(document).ready(function () {
    const CBQuanHuyen = $('#QuanHuyen');
    const CBPhuongXa = $('#PhuongXa');

    // Load danh sách Quận/Huyện
    $.ajax({
        url: 'https://api.npoint.io/34608ea16bebc5cffd42',
    type: 'GET',
    dataType: 'json',
    success: function (response) {
        CBQuanHuyen.empty();
    CBQuanHuyen.append(`<option value="">Chọn Quận/Huyện</option>`);
    response.forEach(function (item) {
                if (item.ProvinceId == 4) {
        CBQuanHuyen.append(`<option value="${item.Id}_${item.Name}">${item.Name}</option>`);
                }
            });
        },
    error: function (xhr, status, error) {
        console.error("Lỗi khi tải dữ liệu Quận/Huyện:", error);
        }
    });

    // Lắng nghe sự kiện thay đổi Quận/Huyện
    CBQuanHuyen.on('change', function () {
        const selectedValue = $(this).val();

        if (!selectedValue) {
            CBPhuongXa.empty().append(`<option value="">Chọn Phường/Xã</option>`);
        return;
        }

        const selectedDistrictId = selectedValue.split('_')[0]; // tách lấy Id: "1"

        console.log(selectedDistrictId);

    // Load Phường/Xã theo Quận/Huyện được chọn
    $.ajax({
        url: 'https://api.npoint.io/dd278dc276e65c68cdf5',
    type: 'GET',
    dataType: 'json',
    success: function (response) {
        CBPhuongXa.empty();
    CBPhuongXa.append(`<option value="">Chọn Phường/Xã</option>`);
    response.forEach(function (item) {
                    if (item.DistrictId == selectedDistrictId) {
                        CBPhuongXa.append(`<option value="${item.Id}_${item.Name}">${item.Name}</option>`);
                    }
                });
            },
    error: function (xhr, status, error) {
        console.error("Lỗi khi tải dữ liệu Phường/Xã:", error);
            }
        });
    });
});
