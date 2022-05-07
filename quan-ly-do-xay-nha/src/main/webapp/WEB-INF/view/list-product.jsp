<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>danh sách sản phẩm</title>
<!--bootstrap5-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!--font chữ-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;700&display=swap"
	rel="stylesheet" />
<!--icon font awesome-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/all.min.css" />

<!-- css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list_products.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">

<script>
	$(document).ready(function() {
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
</script>

<!-- script -->
<script src="${pageContext.request.contextPath}/resources/js/home.js"
	async></script>

</head>
<body>
	<div class="container">
		<!--header-->
		<div class="header" style="margin: 0 auto;">
			<div id="navbar" class="row">
				<div>
					<div class="img_logo" style="margin-top: 15px;">
						<a href="./home_after_signup_signin.html"><img
							style="width: 20%;"
							src="${pageContext.request.contextPath}/resources/image/logo_size_1-removebg-preview.png"
							alt="logo"></a>
					</div>

					<div id="form_chucnang" style="margin-top: -5%;">
						<!--thanh tìm kiếm-->
						<input type="search" class="form-control" id="txtTim"
							placeholder="Tìm kiếm">
						<button type="submit">
							<img
								src="${pageContext.request.contextPath}/resources/image/icon_kinhlup.png"
								alt="">
						</button>

						<!--user-->
						<div id="user">
							<!-- <i class="fa-solid fa-user fa-xl"></i> -->
							<button id="btnUser">
								<img
									src="${pageContext.request.contextPath}/resources/image/icon_user.png"
									alt="icon_user">
							</button>
						</div>

						<!--cart:giỏ hàng-->
						<div id="cart">
							<button id="btnCart">
								<img
									src="${pageContext.request.contextPath}/resources/image/icon_giohang.png"
									alt="icon_cart">
							</button>
							<span id="soluong" class="text-white">0</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcum -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/">Home</a></li>
				<li id="breadcrumb-item-active" class="breadcrumb-item active"
					aria-current="page">Data</li>
			</ol>
		</nav>

		<!-- content -->
		<div class="content row">
			<!-- left-navbar -->
			<div class="left-navbar col-md-3 d-flex flex-column gap-2">
				<div class="left-navbar-item">
					<h5 class="text-center">Danh mục loại sản phẩm</h5>
					<div class="d-flex flex-column gap-1">
						<a class="text-dark text-decoration-none" href="#">khoan 1</a> <a
							class="text-dark text-decoration-none" href="#">khoan 2</a> <a
							class="text-dark text-decoration-none" href="#">khoan 3</a>
					</div>
				</div>

				<div class="left-navbar-item">
					<h5 class="text-center">Dịch vụ</h5>
					<div class="d-flex flex-column gap-1">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="cboGiaoHangSieuToc" /> <label class="form-check-label"
								for="cboGiaoHangSieuToc"> Giao hàng siêu tốc </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="cboGiaoHangNhanh" checked /> <label
								class="form-check-label" for="cboGiaoHangNhanh"> Giao
								hàng thường </label>
						</div>
					</div>
				</div>

				<div class="left-navbar-item">
					<h5 class="text-center">Giá</h5>
					<div class="d-flex flex-column gap-1">
						<span class="text-black-50">Chọn khoảng giá</span>

						<form>
							<div class="row justify-content-between">
								<div class="col-5">
									<input type="text" class="form-control" id="minPrice" value="0" />
								</div>
								<div class="col align-content-center">
									<span>-</span>
								</div>
								<div class="col-5">
									<input type="text" class="form-control" id="maxPrice" value="0" />
								</div>
							</div>

							<button type="submit" class="btn btn-primary m-3">Áp
								dụng</button>
						</form>
					</div>
				</div>
				<div class="left-navbar-item">
					<h5 class="text-center">Nơi bán</h5>
					<div class="d-flex flex-column gap-1">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="cboGiaoHangSieuToc" /> <label class="form-check-label"
								for="cboGiaoHangSieuToc"> Hồ chí Minh </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="cboGiaoHangNhanh" checked /> <label
								class="form-check-label" for="cboGiaoHangNhanh"> Hà nội
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- list product -->
			<div class="col-md bg-white p-4">
				<h4 class="text-center text-uppercase">Khoan</h4>
				<div
					class="list-product d-flex flex-row flex-wrap justify-content-evenly p-5 mt-3">
					<c:forEach var="product" items="${products}">
						<div class="list-product-item flex-fill mt-3">
							<a class="text-center text-decoration-none" href="#">
								<div>
									<div class="thumbnail pt-4">
										<img
											src="${pageContext.request.contextPath}/resources/${product.link}"
											alt="${product.title}" width="233" height="252" />
									</div>
									<div class="info">
										<h6 class="product-name text-dark p-2 m-0">${product.title}</h6>
										<span class="product-price text-danger">${product.price}</span>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>

				<tag:paginate max="15" offset="${offset}" count="${count}"
					uri="${pageContext.request.contextPath}/listProduct" next="&raquo;"
					previous="&laquo;" />
			</div>
		</div>
		<!--footer-->
		<div id="footer">
			<div id="title">
				<div id="line-left"></div>
				<h4>KẾT NỐI VỚI CHÚNG TÔI</h4>
				<div id="line-right"></div>
			</div>

			<div id="top_footer" class="row">
				<a href="./home_before_signup_signin.html" class="col-3"><img
					style="width: 100%; margin-left: 15px;"
					src="${pageContext.request.contextPath}/resources/image/logo_size_1-removebg-preview.png"
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
</body>
</html>
