<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>mainPage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- header css -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
    <link href="${pageContext.request.contextPath}/css/main/header.css" rel="stylesheet">

    <!-- banner.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/banner.css">

    <!-- dropdownMenu.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/dropdownMenu.css">

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js">
	//////////////////////////////////////
	//사료에 건식페이지
</script>
</head>

<!-- header -->

<body id="mainBody">
<div class="header">
    <div class="header-side"></div>
    <div class="header-center">
        <span style="display: inline-block; margin-top: 23px">👉&nbsp&nbsp공지안내드립니다&nbsp&nbsp👈</span>
    </div>

    <div class="header-side">
        <ul class="nav nav-pills">
            <c:choose>
                <c:when test="${empty loginUser}">
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/mypagepart/signIn.jsp"
                                            class="nav-link">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/front?key=user&methodName=logout"
                                            class="nav-link">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
            <li class="nav-item"><a href="#" class="nav-link">장바구니</a></li>
<%--            <li class="nav-item"><a href="${pageContext.request.contextPath}/myPage.jsp" class="nav-link" id="myPage">마이페이지</a>--%>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/front?key=myPage&methodName=myPage" class="nav-link" id="myPage">마이페이지</a>
            </li>
        </ul>
    </div>
</div>


<div class="banner">
    <div class="banner-side"></div>
    <div class="banner-center">
        <a href="${pageContext.request.contextPath}/index.jsp"><img
                src="${pageContext.request.contextPath}/img/logo.png" alt="" style="height: 190px; padding-top: 20px;"></a>
    </div>
    <div class="banner-search" id="search">
        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" style="width: 28px">
        <input type="text" placeholder="검색어 입력">
    </div>
</div>

<!-- dropDownMenu -->

<div class="topMenu">
    <div class="menuCenter">
        <ul class="menu01">
            <li><span>사료</span>
                <ul class="dept01">
                   	<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=5" id="dryFood">건식</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=6" id="wetFood">습식</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=7" id="premiumFood">프리미엄</a></li>
					</ul>
            </li>
            <li><span>간식</span>
                <ul class="dept01">
                    <li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=8" id="gum">껌</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=9" id="can">캔</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=10" id="churu">츄르</a></li>
					</ul>
            </li>
            <li><span>용품</span>
                <ul class="dept01">
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=11" id="cushion">방석</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=12" id="pad">패드</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=13" id="buggy">유모차</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=14" id="mat">매트</a></li>
					
                </ul>
            </li>
            <li><span>영양제</span>
                <ul class="dept01">
                	<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=15" id="eye">눈</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=16" id="skin">피부</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=17" id="mouth">구강</a></li>
						<li id="nop"><a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=18" id="joint">관절</a></li>

                </ul>
            </li>
            <li style="width: 150px"><span>커뮤니티</span>
                <ul class="dept01">
                    <li id="nop"><a href="#">광고</a></li>
                    <li id="nop"><a href="#">질병</a></li>
                    <li id="nop"><a href="#">자유</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/dropdown.js"></script>

</body>
</html>
