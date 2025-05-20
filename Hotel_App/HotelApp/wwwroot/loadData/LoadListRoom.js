$(document).ready(function () {
    let allRoomsData = []; // Mảng để lưu trữ tất cả dữ liệu phòng

    $('#filterBtn').click(function () {
        const price = $('#price').val();


        const selectedAmenities = [];
        $('input[type="checkbox"]:checked').each(function () {
            selectedAmenities.push($(this).val());  // Lấy giá trị của checkbox (ID của tiện nghi)
        });

        // Khởi tạo URL cơ bản
        let url = `/List/`;

        // Gửi yêu cầu AJAX
        $.ajax({
            url: url, // Sử dụng URL đã được tạo
            method: 'GET',
            dataType: 'json',
            success: function (response) {
                allRoomsData = response.data; // Lưu trữ dữ liệu phòng
                filterRooms(price); // Lọc phòng ngay sau khi tải dữ liệu
            },
            error: function () {
                alert('Lỗi khi tải danh sách phòng.');
            }
        });
    });

    // Hàm lọc phòng
    function filterRooms(sortOrder) {
        const roomType = $('#roomType').val();

        const quanHuyenValue = $('#QuanHuyen').val();
        const phuongXaValue = $('#PhuongXa').val();

        let quanHuyenName = '';
        let phuongXaName = '';

        if (quanHuyenValue) {
            const parts = quanHuyenValue.split('_');
            quanHuyenName = parts.slice(1).join('_');
        }

        if (phuongXaValue) {
            const parts = phuongXaValue.split('_');
            phuongXaName = parts.slice(1).join('_');
        }

        const selectedAmenities = [];
        $('input[type="checkbox"]:checked').each(function () {
            selectedAmenities.push($(this).val());
        });

        const filteredRooms = allRoomsData.filter(room => {
            const matchesRoomType = roomType ? room.typeName === roomType : true;
            const matchesAmenities = selectedAmenities.every(amenity => room.amenityNames.includes(amenity));

            const matchesQuanHuyen = quanHuyenName ? room.quanHuyen === quanHuyenName : true;
            const matchesPhuongXa = phuongXaName ? room.phuongXa === phuongXaName : true;

            return matchesRoomType && matchesAmenities && matchesQuanHuyen && matchesPhuongXa;
        });

        if (sortOrder === "1") {
            filteredRooms.sort((a, b) => a.price - b.price);
        } else if (sortOrder === "2") {
            filteredRooms.sort((a, b) => b.price - a.price);
        }

        renderRooms(filteredRooms);
    }

    // Hàm render danh sách phòng
    function renderRooms(data) {
        const container = $('#room-container');
        container.empty(); // Xóa nội dung cũ

        data.forEach(room => {
            const firstImageUrl = room.imageUrls.length > 0 ? room.imageUrls[0].replace('~', '') : 'placeholder.jpg';
            const amenitiesHtml = room.amenityNames.map(amenity => `<span class="badge bg-primary me-1 mt-1">${amenity}</span>`).join('');

            const roomHtml = `
            <div class="col-md-12 mb-4">
                <div class="card shadow-sm">
                    <div class="row g-0">
                        <div class="col-md-4" style="aspect-ratio:2/1;  overflow: hidden;">
                            <img src="${firstImageUrl}" class="d-block w-100 img-fluid rounded-start" style="height: 100%; object-fit: cover; object-position: center;" alt="Room Image">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body d-flex flex-column justify-content-between px-5 py-3" >
                                <h3 class="card-title text-danger" style="font-size:25px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">${room.typeName}</h3>
                                <p class="card-text">
                                    <span class="mt-2"><strong>Giá:</strong> ${room.price.toLocaleString()} VND/ Tháng</span>
                                    <br>
                                    <span class="mt-2"><strong>Tiện nghi:</strong> ${amenitiesHtml}</span>
                                    <br>
                                    <span class="mt-2"><strong>Địa chỉ:</strong> ${room.phuongXa} ,${room.quanHuyen}</span>
                                </p>
                                <a onClick="Detail('/RoomDetail/${room.id}')" class="btn btn-outline-secondary btn-sm align-self-start mt-3">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;
            container.append(roomHtml);
        });
    }

});

function Detail(url) {
    // Gửi yêu cầu AJAX để lấy chi tiết phòng
    $.ajax({
        url: url,  // Đường dẫn tới action trong controller (ví dụ: /Detail/123)
        method: 'GET',
        success: function (response) {
            
            $('#roomDetailModalBody').html(response); 
            $("#carouselExampleIndicators").owlCarousel({
                loop: true,               // Quay vòng qua các ảnh
                margin: 10,               // Khoảng cách giữa các ảnh
                nav: true,                // Hiển thị các nút điều khiển (Previous/Next)
                dots: true,               // Hiển thị các dấu chấm
                autoplay: true,           // Tự động chuyển tiếp
                autoplayTimeout: 3000,    // Thời gian giữa các slide
                responsive: {
                    0: {
                        items: 1          // Số ảnh trên màn hình nhỏ
                    },
                    600: {
                        items: 1          // Số ảnh trên màn hình vừa
                    },
                    1000: {
                        items: 1          // Số ảnh trên màn hình lớn
                    }
                }
            });
            $('#roomDetailModal').modal('show');
            $('#bookingBtn').click(function () {
                const roomId = $(this).data('roomid'); // Lấy ID phòng từ thuộc tính data-roomId của button

                // Hiển thị thông báo xác nhận
                if (confirm("Bạn có chắc muốn xem căn hố này không?")) {
                    // Điều hướng đến URL để xử lý đặt phòng
                    window.location.href = `Booking/${roomId}`;
                }
            });
        },
        error: function (xhr, status, error) {
            // Hiển thị lỗi chi tiết
            let errorMessage = `Lỗi: ${xhr.status} - ${xhr.statusText}\nChi tiết: ${xhr.responseText || error}`;
            console.error(errorMessage); // Log lỗi chi tiết vào console
            alert(errorMessage); // Hiển thị lỗi cụ thể cho người dùng
        }
    });
}