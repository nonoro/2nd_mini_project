
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
    
    <!--부트스트랩-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <title>Document</title>
    <style>
        table, th, td {
            /* border: 0.1px solid black; */
            border-collapse: collapse;
            margin-left: 530px;
        }
        td > img{
            width: 100px;
            height: 100px;
            margin: 20px;
        }
        h1{
            text-align: center;
            margin-top: 100px;
        }
        .back-button{
        	margin-left: 660px;
        }
    </style>
    
</head>
<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <i class="bi bi-coin"></i>
<div class="back">
    <h1>👉&nbsp;&nbsp;&nbsp;관리자 페이지입니다.&nbsp;&nbsp;&nbsp;👈</h1>
    <table>
        <tr>
            <td><img src="img/adminlogo.png"></td>
            <td><a href ="${path}/front?key=user&methodName=userCount" class="btn btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;회원관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
        </tr>
        <tr>
            <td><img src="img/adminlogo.png"></td>
            <td><a href ="${path}/front?key=product&methodName=selectAll" class="btn btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;상품관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
        </tr>
        <tr>
            <td><img src="img/adminlogo.png"></td>
            <td><a href ="Adimin_sale_main.jsp" class="btn btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;판매통계&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
        </tr>

    </table>
</div>
<div class="main-back">
<a class="back-button" href="${path}/index.jsp" style="text-decoration: none;">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
            <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
        </svg>
        메인으로 돌아가기</a>
    </div>  
    
</body>
</html>