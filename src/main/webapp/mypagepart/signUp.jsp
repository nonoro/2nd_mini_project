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

    <!-- ###############################################메인틀############################################### -->

    <!-- header css -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
    <link href="${path}/css/main/header.css" rel="stylesheet">

    <!-- banner.css -->
    <link rel="stylesheet" type="text/css" href="${path}/css/main/banner.css">

    <%-- login.css --%>
    <link rel="stylesheet" href="${path}/css/login/login.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
    <style>
        th {
            text-align: center;
        }

        #idCheck {
            padding-left: 50px;
        }
    </style>
    <script src="${path}/js/jquery-3.6.0.min.js"></script>
    <script src="${path}/js/jquery.form.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {
            $(document).on("keyup", "#id", function(){

                if($(this).val() == ""){
                    $("#idCheck").text("중복결과여부");
                    return;
                }

                $.ajax({
                    url :"${path}/ajax" , //서버요청주소
                    type:"post", //요청방식(method방식 : get | post | put | delete )
                    dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
                    data: {key:"ajax" , methodName : "idCheck" , id : $(this).val() }, //서버에게 보낼 데이터정보(parameter정보)
                    success :function(result){
                        $("#idCheck").text(result);
                    } , //성공했을때 실행할 함수
                    error : function(err){
                        alert(err+"에러 발생했어요.");
                    }  //실패했을때 실행할 함수
                });//ajax끝
            });//keyup끝

            $(document).on("click", "#sign_up", function () {
                $("#signUpForm").ajaxForm({
                    url: "${path}/ajax?key=ajax&methodName=join",
                    type: "post",
                    dataType: "text",
                    // data: $("#signUpForm").serialize(),
                    success: function (result) {
                        alert(`회원가입이벤트로 5000포인트가 지급되었습니다!!! \n마이페이지에서 확인해주세요!`);
                        location.href = "${path}/index.jsp";

                    },
                    error : function(err){
                        alert(err+"에러 발생했어요.");
                    }

                });
                $("#signUpForm").submit();
            });

            $("#datepicker").datepicker({
                changeMonth:true
                ,changeYear:true
                ,yearRange:"-10:+100" /*2009 ~ 2119*/
                ,yearRange:"1995:2028" /*2009 ~ 9999*/
                ,dateFormat:"yy-mm-dd"
                /*위의 방식 아래 방식 둘다 가능*/
            });

        });
    </script>



</head>

<!-- header -->

<body style="background-color: rgba(255,241,193,1)">
<div class="header">
    <div class="header-side"></div>
    <div class="header-center">
        <span>👉&nbsp&nbsp공지안내드립니다&nbsp&nbsp👈</span>
    </div>

    <div class="header-side">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="${path}/mypagepart/signIn.jsp" class="nav-link">로그인</a></li>
            <li class="nav-item"><a href="#" class="nav-link">장바구니</a></li>
            <li class="nav-item"><a href="${path}/front?key=user&methodName=myPage" class="nav-link" id="myPage">마이페이지</a>
        </ul>
    </div>
</div>


<div class="banner">
    <div class="banner-side"></div>
    <div class="banner-center">
        <a href="${path}/index.jsp"><img src="${path}/img/logo.png" alt="" style="height: 190px; padding-top: 20px;"></a>
    </div>
    <div class="banner-side" style="padding: 0"></div>
</div>


<div class="container" style="margin-top: 60px">
    <!-- Heading -->
    <h1>SIGN UP</h1>


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

<form  enctype="multipart/form-data" method="post" id="signUpForm">
    <input type="hidden" name="key" value="ajax">
    <input type="hidden" name="methodName" value="join">
    <!-- id input -->
    <div class="first-input input__block first-input__block">
        <input type="text" placeholder="id" class="input" name="id" id="id"/><span id="idCheck">중복결과여부</span>
    </div>
    <!-- password input -->
    <div class="input__block">
        <input type="password" placeholder="Password" class="input" name="pwd"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Email" class="input" name="email"/>
    </div>
    <div class="input__block">
<%--        <input type="text" placeholder="Addr" class="input" name="addr"/>--%>
        <div style="margin-bottom: 20px">
    <input type="text" id="sample6_postcode" placeholder="우편번호" style="width: 306px; margin-left: 34px; display: inline-block">
    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 100px; margin-left: 1px; padding-left: 0px; display: inline-block"><br>
        </div>
    <input type="text" id="sample6_address" name="addr" placeholder="주소"><br>
    <input type="text" id="sample6_detailAddress" name="addrDetail" placeholder="상세주소">
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                }
            }).open();
        }
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </div>
    <div class="input__block">
        <input type="text" placeholder="Phone" class="input" name="phone" oninput="autoHyphen(this)" maxlength="13"/>
        <script>
            const autoHyphen = (target) => {
                target.value = target.value
                    .replace(/[^0-9]/g, '')
                    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
            }
        </script>
    </div>
    <div class="input__block">
        <input type="file" placeholder="Profile" class="input" name="profile" style="padding-top: 12px"/>
    </div>
    <div class="input__block">
        <input type="text" placeholder="DogName" class="input" name="dogName"/>
    </div>
    <div class="input__block">
<%--        <input type="text" placeholder="DogBirthday" class="input" name="dogBirthday"/>--%>
        <input type="text" id="datepicker" placeholder="DogBirthday" class="input" name="dogBirthday">
    </div>
    <!-- sign up button -->
    <button class="signin__btn" id="sign_up" type="button">
        Sign up
    </button>
</form>
</div>


<script src="${path}/js/login.js"></script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
