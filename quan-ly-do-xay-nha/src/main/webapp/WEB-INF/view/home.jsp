<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>

    <!--bootstrap5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!--font chữ-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">

    <!--slideshow-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery.min.js@3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>

    <!--icon font awesome-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/all.min.css">

    <link rel="stylesheet" href="/quan-ly-do-xay-nha/resources/css/home.css">

    <script src="/quan-ly-do-xay-nha/resources/js/home.js"></script>

    <script>
        $(document).ready(function() {
            //slider
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 3,
                autoWidth: true,
                nav: true,
                shadow: true,
                items: 6
            });

            //sp bán chạy
            listsp.forEach(displaySP);

            //nút trở về đầu trang
            $(window).scroll(function() {
                if ($(this).scrollTop()) {
                    $('#backTop').fadeIn();
                } else {
                    $('#backTop').fadeOut();
                }
            });
            $("#backTop").click(function() {
                $('html, body').animate({
                    scrollTop: 0
                }, 100); //100 là 0.1s
            });
        })

        //list sp bán chạy
        let sp1 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp2 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp3 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp4 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp5 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp6 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp7 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp8 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp9 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp10 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp11 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp12 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp13 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp14 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp15 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };
        let sp16 = {
            hinh: "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
            tesp: "Viborg VB 401",
            gia: "190.000đ"
        };

        let listsp = [sp1, sp2, sp3, sp4, sp5, sp6, sp7, sp8, sp9, sp10, sp11, sp12, sp13, sp14, sp15, sp16];

        function displaySP(sp) {
            let row = "<figure align='center' class='img-thumbnail'>" +
                "<img class='rounded w-100' height='250' src='" + sp.hinh + "' alt='picmcs'>" +
                "<figcaption>" +
                "<h6 class='text-justify' style='font-weight: bold; margin-top: 20px'" +
                "<p>" + sp.tesp + "</p>" +
                "<p style='color: red'>" + sp.gia + "</p>" +
                "</h6>" +
                "</figcaption>" +
                "</figure>";
            $('#list-sp-ban-chay').append(row);
        }
    </script>
</head>

<body>
    <div class="container">
        <!--header-->
        <div class="header">
            <div id="navbar" class="row">
                <div>
                    <div class="img_logo">
                        <a href="/quan-ly-do-xay-nha/WEB-INF/view/home.jsp"><img style="width: 20%;" src="/quan-ly-do-xay-nha/resources/image/logo_size_1-removebg-preview.png" alt="logo"></a>
                    </div>

                    <p>Sản phẩm</p>

                    <div id="form_chucnang">
                        <!--thanh tìm kiếm-->
                        <input type="search" class="form-control" id="txtTim" placeholder="Tìm kiếm">
                        <button type="submit"><img src="/quan-ly-do-xay-nha/resources/image/icon_kinhlup.png" alt=""></button>

                        <!--user-->
                        <div id="user">
                            <!-- <i class="fa-solid fa-user fa-xl"></i> -->
                            <button id="btnUser"><img src="/quan-ly-do-xay-nha/resources/image/icon_user.png" alt="icon_user"></button>
                        </div>

                        <!--cart:giỏ hàng-->
                        <div id="cart">
                            <button id="btnCart"><img src="/quan-ly-do-xay-nha/resources/image/icon_giohang.png" alt="icon_cart"></button>
                            <span id="soluong" class="text-white">0</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--content-->
        <div id="content">
            <!--imgtop-->
            <div id="imgTop"><img src="/quan-ly-do-xay-nha/resources/image/image 8.png" alt="img_header"></div>

            <!--slider-->
            <div id="title">
                <div id="line-left"></div>
                <h4>CÁC LOẠI SẢN PHẨM</h4>
                <div id="line-right"></div>
            </div>
            <div id="slider" class="owl-carousel owl-theme">
                <div>
                    <a href="#"><img src="/quan-ly-do-xay-nha/resources/image/bodungcu.jpg" alt=""></a>
                </div>
                <div>
                    <a href="#"><img src="/quan-ly-do-xay-nha/resources/image/mk.jpg" alt=""></a>
                </div>
                <div>
                    <a href="#"><img src="/quan-ly-do-xay-nha/resources/image/van-khoa-ong-nuoc.png" alt=""></a>
                </div>
                <div>
                    <a href="#"><img src="/quan-ly-do-xay-nha/resources/image/keo-apollo.png" alt=""></a>
                </div>
                <div>
                    <a href="#"><img src="/quan-ly-do-xay-nha/resources/image/son-xit-atm.png" alt=""></a>
                </div>
                <div>
                    <a href="#"><img src="/quan-ly-do-xay-nha/resources/image/bang-keo-dien.png" alt=""></a>
                </div>
                <a href="#slider" style="width: 75px;"></a>
            </div>

            <!--list sp bán chạy-->
            <div id="title" style="margin-top: 4%;">
                <div id="line-left"></div>
                <h4>SẢN PHẨM BÁN CHẠY</h4>
                <div id="line-right"></div>
            </div>
            <div id="frm-list-sp">
                <div id="list-sp-ban-chay" class="row"></div>

                <!--nút mở rộng-->
                <div id="morong" class="row">
                    <button id="btnMoRong"><h4>MỞ RỘNG</h4></button>
                </div>
            </div>

            <!--imgbottom-->
            <div id="imgBottom"><img src="/quan-ly-do-xay-nha/resources/image/image 34.png" alt="img_header"></div>
        </div>

        <!--nút trở về đầu trang-->
        <div id="backTop">
            <i class="fa-solid fa-arrow-up-long fa-xl" title="Trở về đầu trang"></i>
        </div>

        <!--footer-->
        <div id="footer" style="margin-top: -4%;">
            <div id="title" style="margin-top: 4%;">
                <div id="line-left"></div>
                <h4>KẾT NỐI VỚI CHÚNG TÔI</h4>
                <div id="line-right"></div>
            </div>

            <div id="top_footer" class="row">
                <a href="/quan-ly-do-xay-nha/WEB-INF/view/home.jsp" class="col-3"><img style="width: 100%; margin-left: 15px;" src="/quan-ly-do-xay-nha/resources/image/logo_size_1-removebg-preview.png" alt="logo"></a>
                <p class="col-8">Tại đây, chúng tôi cung cấp cho bạn đầy đủ về các công cụ, vật dụng sữa chữa nhà cửa tiện tích và tuyệt vời. Tất cả đều sẵn sàng cho bạn lựa chọn!</p>
            </div>
            <div id="bottom_footer" class="row">
                <div id="info" class="col-8">
                    <b>Địa chỉ: </b>12 Nguyễn Văn Bảo, P.4, Gò Vấp, TP.Hồ Chí Minh <br>
                    <b>Hotline: </b>0944302210 <br>
                    <b>Email: </b>team13@gmail.com <br>
                </div>
                <div id="clock" class="col-4" style="color: darkorange; font-size: 18px;">
                    <script>
                        refreshClock();
                    </script>
                    <!-- ngày giờ -->
                </div>
            </div>
            <div style="background-color: #e3e8f8; color: darkblue; width: 926px;">
            </div>
        </div>
    </div>
</body>

</html>