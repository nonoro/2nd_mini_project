<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
	<title>Order</title>

<link  rel="stylesheet" type="text/css" href="css/basic.css"  />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		let totalprice = 0;
		let inputPoint = 0;
		
		function refreshPage() {			
			let str = ""; 
			let userId = sessionStorage.getItem("userId");
			
			for(let i=0; i < localStorage.length; i++) {
				let key = localStorage.key(i); 
				let value = localStorage.getItem(key); 

				//value의 값을 , 기준으로 분리
				let arr = value.split(",");

				str += `<tr>`;
				str += `<td><img src="${"${arr[1]}"}" class="poster"></td>`;
				str += `<td>${"${arr[0]}"}</td>`;
				str += `<td>${"${arr[1]}"}</td>`;
				str += `<td>${"${arr[1]*arr[2]}"}`;
				
				//전송할 항목 만들기
				str+=`<input type="hidden" name="productCode" value='${"${key}"}'>`;
				str+=`<input type="hidden" name="productQty" value='${"${arr[1]}"}'>`;
				str+=`<input type="hidden" name="orderlinePrice" value='${"${arr[2]}"}'>`;
				str+=`<input type="hidden" name="orderTotalPrice" value='${"${arr[1]*arr[2]}"}'>`;
				str+=`<input type="hidden" name="productName" value='${"${arr[0]}"}'>`;
				str+=`<input type="hidden" name="userId" value='${"${userId}"}'>`;
				str += `</td>`;
				str += `</tr>`;

				//가격 누적
				totalprice += parseInt(arr[1] * arr[2]); 
			} //for문 끝

			//테이블에 추가
			$("#content").html(str);

			//가격 추가
			$("#price").html(totalprice + "원");
			$("#pay").html("<b>" + (totalprice - inputPoint) + "원</b>");
		} //함수 끝
		
		//총 결제 금액 반영하기
		function calTotal() {
			$("#pay").html("<b>" + (totalprice - inputPoint) + "원</b>");
		}
		
		$("[name=doPay]").click(function() { 
			alert("결제 완료되었습니다.");
			//location.href = "testLogin.jsp";
			location.href = "${path}/front?key=order&methodName=selectOrderByUserId&userId=" + userId;
			
			localStorage.clear();
		});
		
		$("#orderUsedPoint").on("keyup", function() {
			let loginPoint = parseInt("${loginPoint}");
			
			inputPoint = parseInt($(this).val());
			
			if(inputPoint < 0) {
				$(this).val(0);
			} else if(inputPoint > loginPoint) {
				$(this).val(loginPoint);
			}
			
			calTotal();

		});
		
		refreshPage();

	}); //readyEnd
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="header.jsp"/>

	<div class="container">
	<h1>주문/결제</h1> 
		
	<br><br><br>	
	<h3>배송 정보</h3>   
	<!-- <form method="post" action="orderList.jsp"> -->
	<form method="post" action="${path}/front?key=order&methodName=orderInsert">
	<%-- <form name="writeForm" method="post" action="${path}/front?key=review&methodName=insert" onSubmit='return checkValid()'> --%>
	
		<input type="hidden" name="key" value="order">
		<input type="hidden" name="methodName" value="orderInsert">
  		<div class="mb-3">
    		<label for="orderAddr" class="form-label">배송 주소</label>
    		<input type="text" class="form-control" id="orderAddr" name="orderAddr">
  		</div>			
	
	
	
	<br><br><br>
	<h3>주문 상품</h3>
		<section>
			<table width="80%"  align="center" id="ta" >
			<thead>
				<tr><th>이미지</th><th>상품이름</th><th>수량</th><th>가격</th></tr>
			</thead>
			<tbody id="content">
				<!-- 주문할 상품 목록 출력 --> 
			</tbody>
			</table>
		</section>
		
	<br><br><br>
	<h3>포인트</h3>  		
  		<div class="mb-3">
    		<label for="usedPoint" class="form-label">보유 포인트: ${loginPoint}</label>
    		<input type="text" class="form-control" id="orderUsedPoint" name="orderUsedPoint">
  		</div>
	
	<br><br><br>
	<h3>최종 결제 금액</h3>
		<h5>총 상품 금액</h5>
			<section  class="totalprice" id="price" name="orderTotalPrice">
				<!-- 총 상품 금액 -->			
			</section>
		<h5>총 결제 금액</h5>
			<section  class="totalpay" id="pay" name="orderPay">
				<!-- 총 결제 금액 -->			
			</section>
			
	<br><br><br>
	<h3>결제 방법</h3>  		
  		<div class="form-check">
  			<input class="form-check-input" type="radio" name="orderType" id="flexRadioDefault1" value="0">
  			<label class="form-check-label" for="flexRadioDefault1">
    			무통장 입금
  			</label>
		</div>
		<div class="form-check">
  			<input class="form-check-input" type="radio" name="orderType" id="flexRadioDefault2" value="1" checked />
  				<label class="form-check-label" for="flexRadioDefault2">
    				신용 카드
  				</label>
		</div>
	
	<br><br><br>
	<input type="submit" value="결제하기" name="doPay">
	</form>

	</div>
	<br><br><br>

	<jsp:include page="footer.jsp"/>
</body>
</html>