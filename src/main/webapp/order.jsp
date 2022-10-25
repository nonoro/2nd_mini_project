<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link  rel="stylesheet" type="text/css" href="css/basic.css"  />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		function refreshPage() {			
			let str = ""; 
			let toalprice = 0;
			for(let i=0; i < localStorage.length; i++) {
				let key = localStorage.key(i); //1001 
				let value = localStorage.getItem(key); //쿵푸팬더,img/movie_image2.jpg,3000

				//value의 값을 , 기준으로 분리
				let arr = value.split(",");

				str += `<tr>`;
				str += `<td><img src="${"${arr[1]}"}" class="poster"></td>`;
				str += `<td>${"${key}"}</td>`;
				str += `<td>${"${arr[0]}"}</td>`;
				str += `<td>${"${arr[2]}"}</td>`;
				str += `<td><button type='button' id='${key}' name='delItem'>삭제</button></td>`; 
				str += `</tr>`;

				//가격 누적
				toalprice += parseInt(arr[2]); //그냥 arr[2]만 가져오면 문자열로 인식함

			} //for문 끝

			//테이블에 추가
			$("#content").html(str);

			//가격 추가
			$("#price").html(toalprice + "원");
			$("#pay").html("<b>" + toalprice + "원</b>");

		} //함수 끝
		
		
		$("[name=pay]").click(function() { 
			if(confirm("결제 완료되었습니다.")) {
				//location.href = "orderList.jsp";
			}
		});
		
		refreshPage();

	}); //readyEnd
</script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<h1>주문/결제</h1> 
		
		<br><br><br>	
		<h3>배송 정보</h3>   
		<form method="post" action="${path}/front?key=order&methodName=orderInsert">
  			<div class="mb-3">
    			<label for="orderAddr" class="form-label">배송 주소</label>
    			<input type="text" class="form-control" id="orderAddr" name="orderAddr">
  			</div>			
	
	<br><br><br>
	<h3>주문 상품</h3>
		<section>
			<table width="80%"  align="center" id="ta" >
			<thead>
				<tr><th>이미지</th><th>상품번호</th><th>상품이름</th><th>가격</th><th>삭제</th></tr>
			</thead>
			<tbody id="content">
				<!-- 찜 목록 출력 --> 
			</tbody>
			</table>
		</section>
		
	<br><br><br>
	<h3>포인트</h3>  		
  		<div class="mb-3">
    		<label for="usedPoint" class="form-label">사용 포인트</label>
    		<input type="text" class="form-control" id="usedPoint" name="orderUsedPoint">
  		</div>
	
	<br><br><br>
	<h3>최종 결제 금액</h3>
		<h5>총 상품 금액</h5>
			<section  class="toalprice" id="price" name="orderTotalPrice">
				<!-- 가격 -->			
			</section>
		<h5>총 결제 금액</h5>
			<section  class="toalpay" id="pay" name="orderPay">
				<!-- 가격 -->			
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
  			<input class="form-check-input" type="radio" name="orderType" id="flexRadioDefault2" value="1" checked>
  				<label class="form-check-label" for="flexRadioDefault2">
    				신용 카드
  				</label>
		</div>
	
	<br><br><br>
	<input type="submit" value="결제하기">
	</form>

	</div>
	<br><br><br>
	
</body>
</html>