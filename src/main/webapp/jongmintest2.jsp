<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		if("${message}" != null){
			alert("${message}");
		}
			
	});
	
</script>
</head>
<body>
<h2> jongmin test - after login page</h2>
userId = ${sessionScope.loginUser}<br>
dogName = ${sessionScope.loginDogName}<br>
dogBirthday = ${sessionScope.loginDogBirthday}<br>
userPoint = ${sessionScope.loginPoint}<br>

<a href="${path}/front?key=user&methodName=logout">user.logout</a><br>

<a href="review_write_test.jsp"> 리뷰등록</a>


</body>
</html>