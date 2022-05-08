<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information Product</title>

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
<script
	src="https://cdn.jsdelivr.net/npm/jquery.min.js@3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>

<!--icon font awesome-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/all.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list_products.css" />

</head>
<body>
	<div class="container">
		<!--header-->
		<div id="frm-header">
			<jsp:include page="header.jsp" />
		</div>

		<!-- breadcum -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
				<li id="breadcrumb-item-active" class="breadcrumb-item active"
					aria-current="page">Chi tiết sản phẩm</li>
			</ol>
		</nav>

		<div class="content row bg-white">
			<div class="col-sm-6 text-center p-4">
				<img src="${pageContext.request.contextPath}/resources/${theProduct.link}" alt=""
					style="width: 50%;">
			</div>
			<div class="col-sm-6 p-4">
				<h1 class="mb-4">${theProduct.title}</h1>
				<div class="row text-center">
					<div class="border col-sm-4 m-2 ms-3 p-3 fw-bold text-danger">${theProduct.price}</div>
				</div>
				<div class="row text-center" style="cursor: pointer;">
					<div class="border col-sm-4 m-2 me-3 p-3 fw-bold text-danger">Thêm
						vào giỏ</div>
					<div class="border col-sm-4 m-2 ms-3 p-3 fw-bold bg-danger text-white">Mua
						ngay</div>
				</div>
			</div>
		</div>
		
		<div class="content row bg-white mt-3">
			<h3 class="p-4 pb-0">Mô tả sản phẩm</h3>
			<div class="p-4 pt-2 pb-0 text-center">
				<img src="${pageContext.request.contextPath}/resources/${theProduct.link}"
					class="p-4 pt-2 pb-0" width="50%" alt="">
			</div>
			<p class="p-4 pb-0">
				${theProduct.description}
				<br>
			</p>

			<div class="d-flex justify-content-evenly mb-4">
				<div class="col-sm-3 border border-black-50 text-center p-2"
					style="cursor: pointer;">Thu gọn nội dung</div>
			</div>
		</div>

		<div class="content row bg-white mt-3">
			<div class="row text-center mt-4 mb-4">
				<hr size="6" class="col-sm-4 mt-3 ms-4" />
				<h3 class=" col-sm text-uppercase">Sản Phẩm Khác</h3>
				<hr size="6" class="col-sm-4 mt-3 me-4" />
			</div>
			<hr size="5">

			<div class="row" style="margin-left: 10px">
				<!-- <button type="button" class="col-1 btn ms-4 mt-8"
					style="background-color: #E6E6E6; height: 50px; margin-top: 150px;">abc</button> -->
				
				<div class="col row row-cols-4">
					<c:forEach var="product" items="${products}">
						<div class="col ">
							<div class="card">
								<img src="${pageContext.request.contextPath}/resources/${product.link}"
									class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title text-center product-name">${product.title}</h5>
									<p class="card-text text-center text-danger">${product.price}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- <button type="button" class="col-1 btn mt-8"
					style="background-color: #E6E6E6; height: 50px; margin-top: 150px;">abc</button> -->
			</div>
		</div>

		<!--footer-->
		<div id="footer">
			<div id="title" style="margin-top: 4%;">
				<div id="line-left"></div>
				<h4>KẾT NỐI VỚI CHÚNG TÔI</h4>
				<div id="line-right"></div>
			</div>

			<div id="top_footer" class="row">
				<a href="./home_before_signup_signin.html" class="col-3"><img
					style="width: 100%; margin-left: 15px;"
					src="/quan-ly-do-xay-nha/resources/image/logo_size_1-removebg-preview.png"
					alt="logo"></a>
				<p class="col-8">Tại đây, chúng tôi cung cấp cho bạn đầy đủ về
					các công cụ, vật dụng sữa chữa nhà cửa tiện tích và tuyệt vời. Tất
					cả đều sẵn sàng cho bạn lựa chọn!</p>
			</div>
			<div id="bottom_footer" class="row">
				<div id="info" class="col-8">
					<b>Địa chỉ: </b>12 Nguyễn Văn Bảo, P.4, Gò Vấp, TP.Hồ Chí Minh <br>
					<b>Hotline: </b>0944302210 <br> <b>Email: </b>team13@gmail.com
					<br>
				</div>
				<div id="clock" class="col-4"
					style="color: darkorange; font-size: 18px;">
					<script>
						refreshClock();
					</script>
					<!-- ngày giờ -->
				</div>
			</div>
			<div
				style="background-color: #e3e8f8; color: darkblue; width: 926px;">
			</div>
		</div>
		
		

		<!--nút trở về đầu trang-->
		<!-- <div id="backTop">
            <i class="fa-solid fa-arrow-up-long fa-xl" title="Trở về đầu trang"></i>
        </div> -->
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		//nút trở về đầu trang
		/* $(window).scroll(function() {
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
		}); */
	})
		<!-- auto complete -->
		$(function() {

			$("#txtTim").autocomplete({
				source : "${pageContext.request.contextPath}/search"
			});
		})
	</script>
</body>
</html>