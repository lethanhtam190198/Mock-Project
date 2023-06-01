<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style>
		.thanhtoanthanhcong {
			border: 1px solid blue;
			border-radius: 10px;
			width: 500px;
			height: 200px;
			margin: auto;
			padding: 2%;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="thanhtoanthanhcong">
		<div style="text-align: center"><h3>Bạn đã thanh toán thành công </h3>
			<div>
				Giá tiền:
				<span th:text="${vnp_Amount}">VNĐ</span>
			</div>
		</div>
		<div style="display: flex;justify-content: space-around; margin-top: 3%">
			<a href="#" type="button" class="btn btn-success">Quay về trang chủ</a>
		</div>
	</div>
</div>
</body>
</html>