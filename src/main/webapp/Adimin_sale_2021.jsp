
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
    <style>
        table, th, td {
            border: 0.1px solid black;
            border-collapse: collapse;
            width: 500px;
            height: 25px;
            margin: 0 auto;
            text-align: center;
        }
    
    </style>

</head>
<body>
    <div style="text-align: center;">
    <h2>[ 판매 통계 ]</h2>
<%--     <a href="${path}/front?key=user&methodName=yearSalse&year=2022">order.selectAll</a>
 --%>    
 <table>
        <!--반복문 돌리는 구간-->
        <!-- 월별 통계 -->
        <!-- //yearSalse가 list임 -->
        <c:forEach items="${yearSalse}" var="m">         
        	<tr>
            	<td> ${m.orderDate}</td>
            	<td> ${m.orderTotalPrice}</td>
        	</tr>
        </c:forEach>
        <!--반복문 돌리는 구간-->
    </table> 
    </div>
    
</body>
</html>