<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			crossorigin="anonymous"
		/>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"
		></script>

		<!--font chữ-->
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;700&display=swap" rel="stylesheet" />
		<!--icon font awesome-->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/all.min.css" />

		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list_products.css" />

		<!-- script -->
		<script src="${pageContext.request.contextPath}/resources/js/list_product.js" async></script>
	</head>
	<body>
		<div class="container">
			<!-- breadcum -->
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li id="breadcrumb-item-active" class="breadcrumb-item active" aria-current="page">Data</li>
				</ol>
			</nav>

			<!-- content -->
			<div class="content row gap-1">
				<!-- left-navbar -->
				<div class="left-navbar col-md-3 d-flex flex-column gap-2">
					<div class="left-navbar-item">
						<h5 class="text-center">Danh mục loại sản phẩm</h5>
						<div class="d-flex flex-column gap-1">
							<a class="text-dark text-decoration-none" href="#">khoan 1</a>
							<a class="text-dark text-decoration-none" href="#">khoan 2</a>
							<a class="text-dark text-decoration-none" href="#">khoan 3</a>
						</div>
					</div>

					<div class="left-navbar-item">
						<h5 class="text-center">Dịch vụ</h5>
						<div class="d-flex flex-column gap-1">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="cboGiaoHangSieuToc" />
								<label class="form-check-label" for="cboGiaoHangSieuToc"> Giao hàng siêu tốc </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="cboGiaoHangNhanh" checked />
								<label class="form-check-label" for="cboGiaoHangNhanh"> Giao hàng thường </label>
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

								<button type="submit" class="btn btn-primary m-3">Áp dụng</button>
							</form>
						</div>
					</div>
					<div class="left-navbar-item">
						<h5 class="text-center">Nơi bán</h5>
						<div class="d-flex flex-column gap-1">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="cboGiaoHangSieuToc" />
								<label class="form-check-label" for="cboGiaoHangSieuToc"> Hồ chí Minh </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="cboGiaoHangNhanh" checked />
								<label class="form-check-label" for="cboGiaoHangNhanh"> Hà nội </label>
							</div>
						</div>
					</div>
				</div>
				<!-- list product -->
				<div class="col-md bg-white p-4">
					<h4 class="text-center text-uppercase">Khoan</h4>
					<div class="list-product d-flex flex-row flex-wrap justify-content-evenly p-5 mt-3"></div>

					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</body>
</html>
