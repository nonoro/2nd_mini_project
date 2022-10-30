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

    <!-- ###############################################메인틀############################################### -->

    <!-- header css -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
    <link href="${pageContext.request.contextPath}/css/main/header.css" rel="stylesheet">

    <!-- banner.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/banner.css">

    <%-- login.css --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/login.css">
    <style>
        th {
            text-align: center;
        }

        input {
            width: 400px;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>

    <script>
        $(function () {
            $(document).on("keyup", "#id", function(){
                if($(this).val() == ""){
                    $("#idCheck").text("중복결과여부");
                    return;
                }

                $.ajax({
                    url :"/front" , //서버요청주소
                    type:"post", //요청방식(method방식 : get | post | put | delete )
                    dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
                    data: {key:"user" , methodName : "idCheck" , id : $(this).val() }, //서버에게 보낼 데이터정보(parameter정보)
                    success :function(result){
                        alert($(this).val());
                        $("#idCheck").text(result);

                    } , //성공했을때 실행할 함수
                    error : function(err){
                        alert(err+"에러 발생했어요.");
                    }  //실팽했을때 실행할 함수
                });//ajax끝
            });//keyup끝
        });
    </script>



</head>

<!-- header -->

<body>
<div class="header">
    <div class="header-side"></div>
    <div class="header-center">
        <span style="display: inline-block; margin-top: 23px">👉&nbsp&nbsp공지안내드립니다&nbsp&nbsp👈</span>
    </div>

    <div class="header-side">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/mypagepart/signIn.jsp" class="nav-link">로그인</a></li>
            <li class="nav-item"><a href="#" class="nav-link">장바구니</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/front?key=myPage&methodName=myPage" class="nav-link" id="myPage">마이페이지</a>
        </ul>
    </div>
</div>


<div class="banner">
    <div class="banner-side"></div>
    <div class="banner-center">
        <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" alt="" style="height: 190px; padding-top: 20px;"></a>
    </div>
    <div class="banner-side" style="padding: 0"></div>
</div>


<div class="container" style="margin-top: 60px">
    <!-- Heading -->
    <h1>SIGN UP</h1>


    <!-- Links -->
    <ul class="links" style="text-align: center">
        <li>
            <a href="${pageContext.request.contextPath}/mypagepart/signIn.jsp" id="signin">SIGN IN</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/mypagepart/signUp.jsp" id="signup">SIGN UP</a>
        </li>
        <li>
            <a href="#" id="reset">RESET</a>
        </li>
    </ul>

<form  action="/front" method="post">
    <input type="hidden" name="key" value="user">
    <input type="hidden" name="methodName" value="join">
    <!-- id input -->
    <div class="first-input input__block first-input__block">
        <input type="text" placeholder="id" class="input" name="id" id="id"/> <span id="idCheck">중복결과여부</span>
    </div>
    <!-- password input -->
    <div class="input__block">
        <input type="password" placeholder="Password" class="input" name="pwd"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Email" class="input" name="email"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Addr" class="input" name="addr"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Phone" class="input" name="phone"/>
    </div>
    <div class="input__block">
        <input type="file" placeholder="Profile" class="input" name="profile" style="padding-top: 12px"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="DogName" class="input" name="dogName"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="DogBirthday" class="input" name="dogBirthday"/>
    </div>
    <!-- sign in button -->
    <button class="signin__btn">
        Sign up
    </button>
</form>
</div>


<script src="${pageContext.request.contextPath}/js/login.js"></script>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>
