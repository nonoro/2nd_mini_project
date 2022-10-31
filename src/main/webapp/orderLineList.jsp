<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
		<meta name="generator" content="Hugo 0.104.2">
		<title>myPage</title>
	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
			  integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
		<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
	
		<!-- ###############################################mypage############################################### -->
	
		<link rel="stylesheet" href="../css/myPage/myPage.css">
	
		<script src="../js/jquery-3.6.0.min.js"></script>
</head>

<!-- header -->

<body>
	<jsp:include page="header.jsp"/>
	<div class="shopTool">
    	<div class="shopTool-detail">
        	<span style="margin-left: 10px">홈&nbsp;>&nbsp;</span>
        	<span>마이페이지&nbsp;>&nbsp;</span>
        	<span id="pageName">주문/배송&nbsp;</span>
    	</div>
	</div>
	
	<div class="myPageMain">
    	<jsp:include page="informationBar.jsp"/>
    	<div class="menuMain">
        	<jsp:include page="menu.jsp"/>
        	<div class="menu-result-container" id="menu-result-container">
        		<h2>주문 ∙ 배송</h2>
        		 <div class="menu-result-container-list"  style="margin: 0px">
    			<hr>
            	<input type="hidden" name="userId" value="${userId}">

            	<table class="table table-striped">
                    <tr>
                        <th>주문 번호</th>
                        <th>상품 이름</th>
                        <th>상품 가격</th>
                        <th>상품 수량</th>
                        <th>주문 상품 금액</th>
                        <th>후기 작성/수정</th>
                    </tr>
                    <c:forEach items="${orderLineList}" var="orderLine">
                    	 <tr>
                        	<td>${orderLine.orderCode}</td>
                        	<td>${orderLine.productName}</td>
                        	<td><fmt:formatNumber value="${orderLine.orderlinePrice}" />원</td>
                        	<td>${orderLine.orderlineQty}개</td>
                        	<td><fmt:formatNumber value="${orderLine.orderlineTotalPrice}" />원</td>
                        	<td>
                        		<div>
                        		<a href="${path}/front?key=product&methodName=reviewByProductCode&productCode=${orderLine.productCode}" class="btn btn-outline-secondary" id="checkOrderList">후기 작성</a>
                        		</div>
                        	</td> 
                        </tr>
                    </c:forEach>
                </table> 
         	</div>
         </div>
    </div>
</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>