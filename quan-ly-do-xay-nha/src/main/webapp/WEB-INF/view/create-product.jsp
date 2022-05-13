<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sản phẩm</title>

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

    <link rel="stylesheet" href="../css/home.css">

    <script src="../js/home.js"></script>
</head>
<body>
	<div class="container">
        <!--header-->
		<div class="content bg-white mb-3">
			<jsp:include page="header.jsp" />
		</div>

        <!--content-->
        <div class="content">
            <div class="gh">
                <h1 class="text-center" style="padding-top: 6px;"><b>SẢN PHẨM MỚI</b></h1>
                <div class="row">
                    <div class="col col-md-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr style="text-align: center;">
                                    <th>STT</th>
                                    <th style="width: 350px;">Title</th>
                                    <th>Price</th>
                                    <th style="width: 132px;">Image</th>
                                    <th>Description</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody id="datarow">
                                <tr style="text-align: center;">
                                    <td>1</td>
                                    <td>ab</td>
                                    <td>1000<u>đ</u></td>
                                    <td>image</td>
                                    <td>bla bla</td>
                                    <td>
                                        <a id="delete_1" data-sp-ma="2" class="btn btn-danger btn-delete-sanpham">
                                            <i class="fa-solid fa-circle-plus" aria-hidden="true"></i><b>Thêm</b>
                                        </a>
                                    </td>
                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!--footer-->
		<div class="content bg-white mt-3">
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


	</script>
</body>
</html>