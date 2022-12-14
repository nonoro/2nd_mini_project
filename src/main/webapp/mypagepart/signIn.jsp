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

    <!-- ###############################################๋ฉ์ธํ############################################### -->

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
    <link href="${path}/css/main/header.css" rel="stylesheet">

    <!-- banner.css -->
    <link rel="stylesheet" type="text/css" href="${path}/css/main/banner.css">

    <%-- login.css --%>
    <link rel="stylesheet" href="${path}/css/login/login.css">
    <style>
        th {
            text-align: center;
        }
    </style>
    <script src="${path}/js/jquery-3.6.0.min.js"></script>

</head>

<!-- header -->

<body style="background-color: rgba(255,241,193,1)">
<div class="header">
    <div class="header-side"></div>
    <div class="header-center">
        <span style="margin-top: 12px; display: inline-block">๐&nbsp&nbsp๊ณต์ง์๋ด๋๋ฆฝ๋๋ค&nbsp&nbsp๐</span>
    </div>

    <div class="header-side">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="${path}/mypagepart/signIn.jsp" class="nav-link">๋ก๊ทธ์ธ</a></li>
            <li class="nav-item"><a href="#" class="nav-link">์ฅ๋ฐ๊ตฌ๋</a></li>
            <li class="nav-item"><a href="${path}/front?key=user&methodName=myPage" class="nav-link" id="myPage">๋ง์ดํ์ด์ง</a>
        </ul>
    </div>
</div>


<div class="banner">
    <div class="banner-side"></div>
    <div class="banner-center">
        <a href="${path}/index.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" alt="" style="height: 190px; padding-top: 20px;"></a>
    </div>
    <div class="banner-side" style="padding: 0"></div>
</div>


<div class="container" style="margin-top: 60px">
    <!-- Heading -->
    <h1>SIGN IN</h1>


    <!-- Links -->
    <ul class="links" style="text-align: center">
        <li>
            <a href="${path}/mypagepart/signIn.jsp" id="signin">SIGN IN</a>
        </li>
        <li>
            <a href="${path}/mypagepart/signUp.jsp" id="signup">SIGN UP</a>
        </li>
        <li>
            <a href="#" id="reset">RESET</a>
        </li>
    </ul>

    <!-- Form -->
    <form  action="${path}/front" method="post">
        <input type="hidden" name="key" value="login">
        <input type="hidden" name="methodName" value="login">
        <!-- id input -->
        <div class="first-input input__block first-input__block">
            <input type="text" placeholder="id" class="input" name="userId"/>

        </div>
        <!-- password input -->
        <div class="input__block">
            <input type="password" placeholder="Password" class="input" name="pwd"/>
        </div>
        <!-- sign in button -->
        <button class="signin__btn">
            Sign in
        </button>
    </form>
</div>
<%--
<form  action="/front" method="post">
    <input type="hidden" name="key" value="user">
    <input type="hidden" name="methodName" value="login">
    <!-- id input -->
    <div class="first-input input__block first-input__block">
        <input type="text" placeholder="id" class="input" name="userId"/>

    </div>
    <!-- password input -->
    <div class="input__block">
        <input type="password" placeholder="Password" class="input" name="pwd"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Email" class="input" id="email"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Addr" class="input" id="userAddr"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Phone" class="input" id="phone"/>
    </div>
    <div class="input__block">
        <input type="file" placeholder="Profile" class="input" id="profile" style="padding-top: 12px"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="DogName" class="input" id="dogName"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="DogBirthday" class="input" id="dogBirthday"/>
    </div>
    <!-- sign in button -->
    <button class="signin__btn">
        Sign in
    </button>
</form>--%>
</div>


<script src="${pageContext.request.contextPath}/js/login.js"></script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
