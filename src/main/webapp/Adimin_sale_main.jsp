
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!--부트스트랩-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<style>
.text {
	display: inline-block;
}

table, th, td {
	/* border: 0.1px solid black; */
	border-collapse: collapse;
	width: 600px;
	height: 30px;
	margin: 0 auto;
	margin-top: 190px;
	text-align: center;
}

.dropdown {
	text-align: center;
}

.dog {
	width: 100px;
	margin-bottom: 30px;
}
</style>


</head>
<body class="">
	<!--부트스트랩-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

	<table>
		<tr>
			<td><img class="dog" src="img/logo/dogdog.png"></td>
		</tr>
		<tr>
			<td><div class="text">
					<h2>판매통계를 보실 년도를</h2>
				</div></td>
		</tr>
		<tr>
			<td>
			<div class="dropdown">
	                <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	                  선택해주세요.
	                </button>
	                <ul class="dropdown-menu">
	                  <li>
	                  	<a href="${path}/front?key=user&methodName=yearSalse&year=2022">2022</a>
	                  	<!-- <a class="dropdown-item" href="#">2022</a> -->
	                  </li>
	                  <li>
	                  	<a href="${path}/front?key=user&methodName=yearSalse&year=2021">2021</a>
	                  </li>
	                  <li>
	                  	<a href="${path}/front?key=user&methodName=yearSalse&year=2020">2020</a>
	                  </li>
	                </ul>
              	</div>
				
			</td>
		</tr>
	</table>
	<div class="box"></div>

</body>
</html>