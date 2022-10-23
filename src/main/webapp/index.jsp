<%@page import="kosta.dao.ProductDAOImpl"%>
<%@page import="kosta.dao.ProductDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>JSP - Hello World</title>
</head>
<body>
<h1>
<%
   ProductDAO dao = new ProductDAOImpl();
   int test = dao.test();
   out.println("결과 : " + test);
%>
</h1>
</body>
</html>