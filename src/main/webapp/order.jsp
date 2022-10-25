<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>주문/결제</h1>

	<button name="delAllItem">전체 삭제</button>
		<article class="main">
		<section>
			<table width="80%"  align="center" id="ta" >
			<caption class="caption">장바구니 리스트</caption>
			<thead>
				<tr><th>이미지</th><th>상품번호</th><th>상품이름</th><th>가격</th><th>삭제</th></tr>
			</thead>
			<tbody id="content">
				<!-- 찜 목록 출력 --> 
			</tbody>
			</table>
		</section>
		<section  class="toalprice" id="price">
			<!-- 가격 -->			
		</section>
		<section class="link">
			<table   align="center">
			<tr><td align="center">
				<a href="checkout.jsp">주문하러 가기</a> 
				<a href="index.html">DVD LIST</a> 
			</td></tr>
			</table>
		</section>
		</article>
	
</body>
</html>