<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>myPage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/myPage.css">

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

</head>


<!-- header -->

<body>
<div class="myPageMain-container" style="height: 230px">
    <div class="state-container">
        <div class="stateImage" style="margin-left: 0px;">
            <a href="${pageContext.request.contextPath}/mypagepart/myInformation.jsp"><img src="${pageContext.request.contextPath}/img/${loginProfile}" alt=""></a>

        </div>
        <div class="userDetail">
            <span id="name">${loginUser}</span><br>
            <span id="email">${loginEmail}</span>
        </div>
        <div class="stateImage">
            <img src="${pageContext.request.contextPath}/img/c.jpg" alt="">
        </div>
        <div class="userDetail">
            <span id="currentPoint">포인트</span><br>
            <span id="currentPoint">${loginPoint}</span>
        </div>
        <div class="stateImage">
            <img src="${pageContext.request.contextPath}/img/c.jpg" alt="">
        </div>
        <div class="userDetail">
            <span id="currentPoint">내가작성한리뷰</span><br>
            <span id="currentPoint">5개</span>
        </div>
    </div>
</div>


</body>
</html>