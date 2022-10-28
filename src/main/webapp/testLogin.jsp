<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script type="text/javascript">
	$(function() {
		
		let value = null;
		
		 $("#form").submit(function() {
			 value = $("#userId").val();
			 sessionStorage.setItem("userId", value);
		 })
		 
	}); //readyEnd
</script>

</head>
<body>
	<h1>로그인 페이지</h1>
	<div> 
		<form action="" name="loginForm" method="post" id="form">
			<input type="text" name="userId" id="userId" />
			<input type="submit" value="로그인" />
		</form>
		<a href="${path}/front?key=product&methodName=selectAll"> 상품 보러 가기</a>
		
	</div>
</body>
</html>