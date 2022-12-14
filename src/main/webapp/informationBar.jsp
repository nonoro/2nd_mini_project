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
    <link href="${path}/assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${path}/css/myPage/myPage.css">

    <script src="${path}/js/jquery-3.6.0.min.js"></script>

</head>


<!-- header -->

<body style="background-color: rgba(255,241,193,1)">
<div class="myPageMain-container" style="height: 230px">
    <div class="state-container">
        <div class="stateImage" style="margin-left: 0px;">
            <a href="${path}/mypagepart/myInformation.jsp"><img src="${path}/save/${loginProfile}" alt=""></a>
        </div>
        <div class="userDetail">
            <span id="name">${loginUser}</span><br>
            <span id="email">${loginEmail}</span>
        </div>
        <div class="stateImage">
            <img src="${path}/img/point.jpg" alt="">
        </div>
        <div class="userDetail">
            <span id="currentPoint">포인트</span><br>
            <span id="currentPoint">${loginPoint}</span>
        </div>
       

    </div>
</div>


</body>
</html>