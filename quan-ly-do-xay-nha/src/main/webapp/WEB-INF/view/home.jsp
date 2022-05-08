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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!--font chữ-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap"
	rel="stylesheet">

<!--slideshow-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css">



<!--icon font awesome-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/all.min.css">

<link rel="stylesheet" href="/quan-ly-do-xay-nha/resources/css/home.css">

<script src="/quan-ly-do-xay-nha/resources/js/home.js"></script>


</head>

<body>
	<div class="container">
		<!--header-->
		<div id="frm-header">
			<jsp:include page="header.jsp" />
		</div>

		<!--content-->
		<div id="content">
			<!--imgtop-->
			<div id="imgTop">
				<img src="/quan-ly-do-xay-nha/resources/image/image 8.png"
					alt="img_header">
			</div>

			<!--slider-->
			<div id="title">
				<div id="line-left"></div>
				<h4>CÁC LOẠI SẢN PHẨM</h4>
				<div id="line-right"></div>
			</div>
			<div id="slider" class="owl-carousel owl-theme">
				<div>
					<a href="#"><img
						src="/quan-ly-do-xay-nha/resources/image/bodungcu.jpg" alt=""></a>
				</div>
				<div>
					<a href="#"><img
						src="/quan-ly-do-xay-nha/resources/image/mk.jpg" alt=""></a>
				</div>
				<div>
					<a href="#"><img
						src="/quan-ly-do-xay-nha/resources/image/van-khoa-ong-nuoc.png"
						alt=""></a>
				</div>
				<div>
					<a href="#"><img
						src="/quan-ly-do-xay-nha/resources/image/keo-apollo.png" alt=""></a>
				</div>
				<div>
					<a href="#"><img
						src="/quan-ly-do-xay-nha/resources/image/son-xit-atm.png" alt=""></a>
				</div>
				<div>
					<a href="#"><img
						src="/quan-ly-do-xay-nha/resources/image/bang-keo-dien.png" alt=""></a>
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
					<button id="btnMoRong">
						<h4>MỞ RỘNG</h4>
					</button>
				</div>
			</div>

			<!--imgbottom-->
			<div id="imgBottom">
				<img src="/quan-ly-do-xay-nha/resources/image/image 34.png"
					alt="img_header">
			</div>
		</div>

		<!--nút trở về đầu trang-->
		<div id="backTop">
			<i class="fa-solid fa-arrow-up-long fa-xl" title="Trở về đầu trang"></i>
		</div>

		<!--footer-->
		<div id="frm-footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			//load header
			//$("#frm-header").load("/quan-ly-do-xay-nha/WEB-INF/view/header.jsp");

			//load footer
			//$("#frm-footer").load("/quan-ly-do-xay-nha/WEB-INF/view/footer.jsp");

			//slider
			$('.owl-carousel').owlCarousel({
				loop : true,
				margin : 3,
				autoWidth : true,
				nav : true,
				shadow : true,
				items : 6
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
					scrollTop : 0
				}, 100); //100 là 0.1s
			});
		})

		//list sp bán chạy
		let sp1 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp2 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp3 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp4 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp5 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp6 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp7 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp8 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp9 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp10 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp11 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp12 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp13 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp14 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp15 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};
		let sp16 = {
			hinh : "/quan-ly-do-xay-nha/resources/image/demo-sp.png",
			tesp : "Viborg VB 401",
			gia : "190.000đ"
		};

		let listsp = [ sp1, sp2, sp3, sp4, sp5, sp6, sp7, sp8, sp9, sp10, sp11,
				sp12, sp13, sp14, sp15, sp16 ];

		function displaySP(sp) {
			let row = "<figure align='center' class='img-thumbnail'>"
					+ "<img class='rounded w-100' height='250' src='" + sp.hinh + "' alt='picmcs'>"
					+ "<figcaption>"
					+ "<h6 class='text-justify' style='font-weight: bold; margin-top: 20px'"
					+ "<p>" + sp.tesp + "</p>" + "<p style='color: red'>"
					+ sp.gia + "</p>" + "</h6>" + "</figcaption>" + "</figure>";
			$('#list-sp-ban-chay').append(row);
		}
	</script>

	<!-- auto complete -->
	<script type="text/javascript">
		$(function() {

			$("#txtTim").autocomplete({
				source : "search"
			});
		})
	</script>
</body>

</html>