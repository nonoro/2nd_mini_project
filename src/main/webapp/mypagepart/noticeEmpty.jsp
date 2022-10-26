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
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ###############################################메인틀############################################### -->

    <!-- header css -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
    <link href="../css/main/header.css" rel="stylesheet">

    <!-- banner.css -->
    <link rel="stylesheet" type="text/css" href="../css/main/banner.css">

    <!-- dropdownMenu.css -->
    <link rel="stylesheet" type="text/css" href="../css/main/dropdownMenu.css">

    <!-- slide css -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">
    <link href="../css/main/carousel.css" rel="stylesheet">

    <!-- advertise.css -->
    <link rel="stylesheet" href="../css/main/advertise.css">

    <!-- middle.css -->
    <link rel="stylesheet" href="../css/main/middle.css">

    <!-- 페이징처리 -->
    <link rel="stylesheet" href="../css/main/paging.css">

    <!-- footer -->
    <link rel="stylesheet" href="../css/main/footer.css">

    <!-- ###############################################mypage############################################### -->

    <link rel="stylesheet" href="../css/myPage/myPage.css">

    <style>
        th {
            text-align: center;
        }
    </style>

    <script src="../js/jquery-3.6.0.min.js"></script>
    <script>

        /*        $(function () {
                    $(document).on("click", "#myPage", function () {
                        $.ajax({
                            type: "post",
                            url: "myPage.html",
                            data: "text",
                            success: function (data) {
                                $("#mainBody").html(data);
                                document.location.href = "myPage.html"
                            },
                            error: function () {
                                alert("실패");
                            },
                        });
                    });

                    $(document).on("click", "#order", function () {

                        $.ajax({
                            type: "post",
                            url: "myPageOrder.html",
                            data: "text",
                            success: function (data) {
                                $("#menu-result-container").html(data);
                                document.location.href = "myPageOrder.html"

                            },
                            error: function () {
                                alert("실패");
                            },
                        });
                    });

                    $(document).on("click", "#cancelOrder", function () {
                        $.ajax({
                            type: "post",
                            url: "myPageCancelOrder.html",
                            data: "text",
                            success: function (data) {
                                // alert(data);
                                $("#menu-result-container").html(data);
                            },
                            error: function () {
                                alert("실패");
                            },
                        });
                        return false;
                    });

                    $(document).on("click", "#customerCenter", function () {
                        $.ajax({
                            type: "post",
                            url: "customerCenter.html",
                            data: "text",
                            success: function (data) {
                                // alert(data);
                                $("#menu-result-container").html(data);
                            },
                            error: function () {
                                alert("실패");
                            },
                        });
                        return false;
                    });
                });*/

    </script>

    <script src="js/jquery-3.6.0.min.js"></script>
</head>

<!-- header -->

<body>
<div class="header">
    <div class="header-side"></div>
    <div class="header-center">👉&nbsp&nbsp공지안내드립니다&nbsp&nbsp👈</div>

    <div class="container" style="display: table-cell;">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
            <li class="nav-item"><a href="#" class="nav-link">회원가입</a></li>
            <li class="nav-item"><a href="#" class="nav-link">장바구니</a></li>
            <li class="nav-item"><a href="../myPage.jsp" class="nav-link" id="myPage">마이페이지</a></li>
        </ul>
    </div>
</div>


<div class="banner">
    <div class="banner-side"></div>
    <div class="banner-center">
        <a href="../index.jsp"><img src="../img/logo.png" alt="" style="height: 190px; padding-top: 20px;"></a>

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
                    <li id="nop"><a href="#">건식</a></li>
                    <li id="nop"><a href="#">습식</a></li>
                    <li id="nop"><a href="#">프리미엄</a></li>
                </ul>
            </li>
            <li><span>간식</span>
                <ul class="dept01">
                    <li id="nop"><a href="#">껌</a></li>
                    <li id="nop"><a href="#">캔</a></li>
                    <li id="nop"><a href="#">츄르</a></li>
                </ul>
            </li>
            <li><span>용품</span>
                <ul class="dept01">
                    <li id="nop"><a href="#">방석</a></li>
                    <li id="nop"><a href="#">패드</a></li>
                    <li id="nop"><a href="#">유모차</a></li>
                    <li id="nop"><a href="#">매트</a></li>
                </ul>
            </li>
            <li><span>영양제</span>
                <ul class="dept01">
                    <li id="nop"><a href="#">눈</a></li>
                    <li id="nop"><a href="#">피부</a></li>
                    <li id="nop"><a href="#">구강</a></li>
                    <li id="nop"><a href="#">관절</a></li>
                    <li id="nop"><a href="#">장</a></li>
                    <li id="nop"><a href="#">심장</a></li>
                </ul>
            </li>
            <li style="margin-left: 12px"><span>커뮤니티</span>
                <ul class="dept01">
                    <li id="nop"><a href="#">광고</a></li>
                    <li id="nop"><a href="#">질병</a></li>
                    <li id="nop"><a href="#">자유</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<script src="../js/dropdown.js"></script>

<div class="shopTool">
    <div class="shopTool-detail">
        <span style="margin-left: 10px">홈&nbsp;>&nbsp;</span>
        <span>마이페이지&nbsp;>&nbsp;</span>
        <span id="pageName">공지사항&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <div class="myPageMain-container" style="height: 230px">
        <div class="state-container">
            <div class="stateImage" style="margin-left: 0px;">
                <a href="myInformation.jsp"><img src="../img/a.jpg" alt=""></a>
            </div>
            <div class="userDetail">
                <span id="name">ㅇㅇㅇ님</span><br>
                <span id="email">kgu1022@naver.com</span>
            </div>
            <div class="stateImage">
                <img src="../img/c.jpg" alt="">
            </div>
            <div class="userDetail">
                <span id="currentPoint">포인트</span><br>
                <span id="currentPoint">1000</span>
            </div>
            <div class="stateImage">
                <img src="../img/c.jpg" alt="">
            </div>
            <div class="userDetail">
                <span id="currentPoint">관심목록</span><br>
                <span id="currentPoint">5</span>
            </div>
        </div>
    </div>
    <div class="menuMain">
        <div class="menu-container">
            <div class="menu-container-a">
                <span>&nbsp;&nbsp;나의 쇼핑</span>
            </div>
            <hr style="margin: 0;">
            <div class="menu-container-a" id="order">
                <a
                        href="myPageOrder.jsp"><span>&nbsp;&nbsp;주문&nbsp;∙&nbsp;배송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
            </div>
            <div class="menu-container-a">
                <a href="myPageCancelOrder.jsp"
                   id="cancelOrder"><span>&nbsp;&nbsp;주문취소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
            </div>
            <div class="menu-container-a">
                <a href="pointOk.jsp"><span>&nbsp;&nbsp;포인트내역
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
            </div>
            <div class="menu-container-a">
                <a href="notice.jsp"
                ><span>&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
            </div>
            <div class="menu-container-a">
                <a href="repeatedQuestion.jsp">
                    <span>&nbsp;&nbsp;자주묻는질문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span>
                </a><br>
            </div>
        </div>
        <div class="menu-result-container" id="menu-result-container">
            <h2>공지사항</h2>
            <div class="menu-result-container-list"  style="margin: 0px">
                <span><img src="../img/c.jpg" alt="" style="width: 60px; height:60px"></span><br>
                <span style="text-align: center">공지사항이 없습니다.</span>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="footer-main">
        <div class="footer-container1">
            <div class="footer-content">
                <span class="span-title">Company</span><br>
                <hr>
                <span class="span-content">상호명 : 견수무강</span>
                <span class="span-content">대표이사 : 정규연</span>
                <span class="span-content">주소 : 경기도 성남시 오리역</span>
                <span class="span-content">사업자등록번호 : 683-98-0029</span>
                <span class="span-content">이메일문의 : old_dog@gmail.com</span>
            </div>
        </div>
        <div class="footer-container2">
            <div class="footer-content">
                <span class="span-title">Customer center</span><br>
                <hr>
                <span class="span-content" style="color: red; font-size: 20px; font-weight: bold;">1644-8282</span>
                <span class="span-content">평일 : 09:00 ~ 18:00</span>
                <span class="span-content">토요일, 일요일, 공휴일 휴무</span>
                <span class="span-content">고객센터 운영시간에 순차적으로 답변드리겠습니다.</span>
            </div>
        </div>
    </div>
</div>
<script src="/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>