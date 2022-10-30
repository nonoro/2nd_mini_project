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
    .user-total{
    margin-top: 10px;
    margin-left: 265px;
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
    <h1 style="text-align: center;">회원관리</h1>
    <tr style="text-align: center;">
        <th>회원 아이디</th>
        <th>회원 비밀번호</th>
        <th>회원 이메일</th>
        <th>회원 주소</th>
        <th>회원 휴대폰번호</th>
    </tr>
    <!--반복문 돌릴 구간 시작-->
    <c:forEach items="${userList}" var="u">
    <tr>
        <td>${u.userId}</td>
        <td>${u.userPwd}</td>
        <td>${u.userEmail}</td>
        <td>${u.userAddr}</td>
        <td>${u.userPhone}</td>
    </tr>
    </c:forEach>
     <!--반복문 돌릴 구간 끝-->
</table>
     <div class="user-total"><h6>총 회원 수 : ${userCount}</h6></div>
    <div class="main-back">
  <button type="button" class="btn btn-outline-primary">
    <a class="back-button" href="javascript:history.back();">메인으로 돌아가기</a>
    </button>
    </div>
</body>
</html>