<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
<style type="text/css">
.qty .count {
	color: #000;
	display: inline-block;
	vertical-align: top;
	font-size: 25px;
	font-weight: 700;
	line-height: 30px;
	padding: 0 2px;
	min-width: 35px;
	text-align: center;
}

.qty .plus {
	cursor: pointer;
	display: inline-block;
	vertical-align: top;
	color: white;
	width: 30px;
	height: 30px;
	font: 30px/1 Arial, sans-serif;
	text-align: center;
	border-radius: 50%;
}

.qty .minus {
	cursor: pointer;
	display: inline-block;
	vertical-align: top;
	color: white;
	width: 30px;
	height: 30px;
	font: 30px/1 Arial, sans-serif;
	text-align: center;
	border-radius: 50%;
	background-clip: padding-box;
}

div {
	text-align: center;
}

.minus:hover {
	background-color: #717fe0 !important;
}

.plus:hover {
	background-color: #717fe0 !important;
}
/*Prevent text selection*/
span {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

input {
	border: 0;
	width: 2%;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input:disabled {
	background-color: white;
}
</style>

</head>
<body>
	<div class="container">
		<!--header-->
		<div id="frm-header" style="width: 1130px;">
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
				<img
					src="${pageContext.request.contextPath}/resources/${theProduct.link}"
					alt="" style="width: 50%;">
			</div>
			<div class="col-sm-6 p-4">
				<h1 class="mb-4">${theProduct.title}</h1>
				<div class="row text-center">
					<div class="border col-sm-4 m-2 ms-3 p-3 fs-4 fw-bold text-danger">${theProduct.price}</div>
				</div>

				<form:form
					action="${pageContext.request.contextPath}/saveOrderAndOpenCart"
					name="formInput" id="formCart" class="row"
					style="margin-top: 16px;" method="post">

					<div class="qty mt-5">
						<span class="minus bg-dark">-</span> <input type="text"
							class="count" name="soLuong" value="1" /> <span
							class="plus bg-dark">+</span>
					</div>

					<input type="hidden" name="productId" value="${theProduct.id}" />
					<div class="col-6">
						<button type="button"
							class="btn btn-outline-danger btn-lg fw-bold fs-4">Thêm
							vào giỏ</button>
					</div>

					<div class="col-6">
						<button type="submit" class="btn btn-danger btn-lg fw-bold fs-4">Mua
							ngay</button>
					</div>
				</form:form>

			</div>
		</div>

		<div class="content row bg-white mt-3">
			<h3 class="p-4 pb-0">Mô tả sản phẩm</h3>
			<div class="p-4 pt-2 pb-0 text-center">
				<img
					src="${pageContext.request.contextPath}/resources/${theProduct.link}"
					class="p-4 pt-2 pb-0" width="30%" alt="">
			</div>
			<p class="p-4 pb-0">
				${theProduct.description} <br>
			</p>

			<form action="" class="d-flex justify-content-evenly mb-4">
				<button type="button" class="btn btn-light">Thu gọn nội
					dung</button>
			</form>
		</div>

		<div class="content row bg-white mt-3">
			<div class="row text-center mt-4 mb-4">
				<hr size="6" class="col-sm-4 mt-3 ms-4" />
				<h3 class=" col-sm text-uppercase">Sản Phẩm Khác</h3>
				<hr size="6" class="col-sm-4 mt-3 me-4" />
			</div>
			<hr size="5">

			<div class="row" style="margin-left: 10px; margin-bottom: 16px;">
				<div class="col row row-cols-4">
					<c:forEach var="product" items="${products}">
						<figure align="center" class="img-thumbnail border">
							<a
								href="${pageContext.request.contextPath}/listProduct/info/${product.id}"
								style="text-decoration: none;"> <img class="rounded w-100"
								height="250"
								src="${pageContext.request.contextPath}/resources/${product.link}"
								alt="picmcs">
								<figcaption>
									<h6 class="text-justify"
										style="font-weight: bold; margin-top: 20px">
										<p>${product.title}</p>
										<br>
										<p style="color: red">${product.price}</p>
									</h6>
								</figcaption>
							</a>
						</figure>
					</c:forEach>
				</div>
			</div>
		</div>

		<!--footer-->
		<div id="frm-footer" style="width: 1130px;">
			<jsp:include page="footer.jsp" />
		</div>

		<!--nút trở về đầu trang-->
		<div id="backTop">
			<i class="fa-solid fa-arrow-up-long fa-xl" title="Trở về đầu trang"></i>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

	<script type="text/javascript">
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
		
		<!-- auto complete -->
		$(function() {

			$("#txtTim").autocomplete({
				source : "${pageContext.request.contextPath}/search"
			});
		})
		
		$(document).ready(function(){
		  
   			$(document).on('click','.plus',function(){
				$('.count').val(parseInt($('.count').val()) + 1 );
    		});
        	$(document).on('click','.minus',function(){
    			$('.count').val(parseInt($('.count').val()) - 1 );
    				if ($('.count').val() == 0) {
						$('.count').val(1);
					}
    	    	});
        	
        	 var form = $('#formCart');

        	  form.find('button:first').click( function() {
        	    $.ajax( {
        	      type: "GET",
        	      url: "${pageContext.request.contextPath}/saveOrder",
        	      data: form.serialize(),
        	      success: function( response ) {
        	    	  console.log(response)
        	      }
        	    } );
        	  } ); 
 		});
	</script>
</body>
</html>