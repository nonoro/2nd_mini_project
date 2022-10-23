<%@page import="kosta.dao.TestDBImpl"%>
<%@page import="kosta.dao.TestDB"%>
<%@page import="kosta.dao.ProductDAOImpl"%>
<%@page import="kosta.dao.ProductDAO"%>
<%@page import="kosta.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
   TestDB t= new TestDBImpl();
   int test = t.test();
   out.println("결과 : " + test);
%>

</body>
</html>