
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--viewport-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--부트스트랩 css-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!--product.css-->
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<script type="text/javascript">
	function check(th) {
		// alert(th.value)
		location.href = "${path}/front?key=product&methodName=selectByarrange&arrange="
				+ th.value;
	}
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">



</script>

</head>
<body style="background-color: rgba(255,241,193,1)">
	<!-- header -->
	<jsp:include page="header.jsp" />
	<div class="clear">
		<!--체인지 버튼-->
		<form name="arrange">
			<select id="subMenu" name="subMenu" onchange="check(this)">
				<option value="1">BEST순</option>
				<option value="2">별점 높은 순</option>
				<option value="3">후기 많은 순</option>
			</select>
		</form>
	</div>

	<!-- 상품리스트 시작 -->

	<div class="product_list row">
		<c:forEach items="${list}" var="p">
			<!--상품 -->
			<div class="product_box cell">
				<!-- product img -->
				<div class="img_box">
					<a
						href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}&productCode=${p.productCode}">
						<%-- <img id="food_01_img" src="img/${p.pFileName}.jpeg"> --%>
						<img id="food_01_img" src="${path}/save/${p.fname}" />
					</a>
				</div>
				<!-- product text box -->
				<div class="text_box">
					<a id="food_01_title"
						href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}&productCode=${p.productCode}">
						<!--상품 이름--> ${p.productName}
					</a> <br>
					<div class="food_01_text">
						<!--상품 설명-->
						${p.productExplain}
					</div>

					<div class="food_01_price">
						<!--상품 가격-->
						${p.productPrice}
					</div>
					<a href="">👉 후기보러가기 👈</a>
				</div>
			</div>

			<!-- 상품박스 끝 -->
		</c:forEach>

	</div>
	<!-- 상품리스트 끝 -->
	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>