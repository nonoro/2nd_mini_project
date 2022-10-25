<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	a {
		text-decoration: none;
	}
</style>

</head>
<body>

</body>
	<h3>
		
		
		<a href="${path}/front?key=order&methodName=selectOrderByUserId&userId=jang">
			<input type="button" value="주문 내역 확인하기">
		</a>
		&nbsp;
	 	<a href="${path}/order.jsp">
	 		<input type="button" value="주문하기">
	 	</a>
		
	</h3> <br>
		
		\${pageContext.request.contextPath} = ${pageContext.request.contextPath}
		
		
	
</html>