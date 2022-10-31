
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
    <!--Admin.css-->
    <!-- <link href="/css/Admin.css" rel="stylesheet"> -->
    <!--부트스트랩-->
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    
    <style>
    table, th, td {
        border: 0.1px solid black;
        border-collapse: collapse;
        width: 900px;
        height: 30px;
        margin: 0 auto;
    }
    .product-sort{
    	
    }
    .main-back{
    margin-left: 1028px;
    }
	.back-button{
   	text-decoration: none;
    }
    </style>
</head>

<body>
   
    <table class="admin_user">
       <%--  <a href="${path}/front?key=userCount&methodName=userCount">userCount</a> --%>
        <h1 style="text-align: center;">등록된 상품 조회</h1>
        <!--정렬버튼 들어가는 구간 시작-->
   	    <div class="product-sort">
       		<button type="button">
            <a href="#" onclick="location.href='Admin_insert.jsp'">상품등록</a>
        	</button>
        	<button type="button">
        	<a href="${path}">상품수정</a>
            
       		</button>   
   		</div>
    <!--정렬버튼 들어가는 구간 끝-->
        <tr style="text-align: center;">
            <th>상품 코드</th>
            <th>상품 카테고리</th>
            <th>상품 이름</th>
            <th>상품 가격</th>
            <th>상품 재고</th>
            <th>상품 설명</th>
            <th>상품 사진 파일</th>
        </tr>
        <!--반복문 돌릴 구간 시작-->
        <c:forEach items="${list}" var="p">
        <tr>
            <td>${p.productCode}</td>
            <td>${p.productCategory}</td>
            <td>${p.productName}</td>
            <td>${p.productPrice}</td>
            <td>${p.productQty}</td>
            <td>${p.productExplain}</td>
            <td>${p.fname}</td>
        </tr>
        </c:forEach>
         <!--반복문 돌릴 구간 끝-->
    </table>
     
     <div class="main-back">
    	<button type="button" class="btn btn-outline-primary">
   			<a class="back-button" href="javascript:history.back();">메인으로 돌아가기</a>
   		</button>
    </div>
    
</body>
</html>