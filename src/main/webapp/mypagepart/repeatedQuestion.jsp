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

    <style>@font-face {
        font-family: 'LeferiPoint-WhiteObliqueA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    details {
        border-bottom: 1px solid #efefef;
        color: #666;
        font-size: 16px;
        padding: 15px;
    }


    details[open] summary {
        font-weight: 800;
    }

    details > summary {
        color: #333;
        font-size: 24px;
        padding: 15px 0;
    }
    </style>

    <script src="../js/jquery-3.6.0.min.js"></script>
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
            <li class="nav-item"><a href="myPage.jsp" class="nav-link" id="myPage">마이페이지</a></li>
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
        <span id="pageName">자주묻는질문&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <div class="myPageMain-container"  style="height: 220px">
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
            <h2>자주 묻는 질문</h2>
            <details>
                <summary>1. 포인트는 어떻게 사용하나요?</summary>
                상품을 구매할 경우 일반 현금과 동일하게 사용할 수 있습니다.
                상품 구매 시 주문결제 페이지의 포인트 항목에서 사용할 포인트를 입력하시면 됩니다.
            </details>
            <details>
                <summary>2.주문취소는 어떻게 하나요?</summary>
                '[MY페이지 > 주문 취소]에서 취소 가능합니다.
                '발송준비중' '발송처리완료' 상태인 경우 배송사로 인계되어 취소가 불가능하므로, 수령하신 후 반품해 주셔야 합니다.
                또한, 반품 배송비는 고객님께서 부담하시게 됩니다.
                <a href="#">주문 취소 페이지로 이동</a>
            </details>
            <details>
                <summary>3.배송지 변경은 어떻게 하나요?</summary>
                '입금대기, 입금확인' 상태인 경우에는 [MY페이지 > 주문·배송 > 주문상세보기 > 배송정보 변경] 에서 배송지를 변경하시면 됩니다.
                '발송준비중, 발송처리완료' 상태인 경우에는 배송사로 인계되어 변경이 불가능합니다.
                <a href="#">주문·배송 페이지로 이동</a>
            </details>
            <details>
                <summary>4.토요일, 공휴일에 배송이 가능한가요?</summary>
                토요일에는 배송이 되나 일요일, 공휴일에는 배송이 불가능합니다.
                <a href="#">주문·배송 페이지로 이동</a>
            </details>
            <details>
                <summary>5.아무래도 사료보다는 집에서 만들어서 만드는 음식이 더 좋은 것 아닌가요?</summary>
                그렇다고만 할 수는 없습니다. 아이들에게 필요한 영양성분들이 있습니다.
                그것들을 제외된다면 영양불균형이 발생합니다.
                고기가 많은 육류의 식사는 비타민이나 미네랄의 섭취가 부족할 수 있고 반대로 채소류가 많은 식사에서는 단백질 등의 에너지원의 불균형이 발생될 수 있습니다.
                집에서 만들어주는 사랑과 정성의 음식도 아이들에게 좋은 식사일 수 있지만 하림펫푸드와 같이 영양요소의 균형을 고루 갖춘 제품을 추천합니다.
            </details>
            <details>
                <summary>6.회원탈퇴는 어떻게 하나요?</summary>
                로그인 후 상단 마이페이지 메뉴를 클릭 하여 회원탈퇴 버튼을 통해 가능합니다.
                단 남아있는 예치금,적립금,쿠폰이 있으실 경우엔 회원 탈퇴 시 모두 삭제되며 복구가 불가합니다. 또한 동일 이름, 동일 계정, 동일 연락처 등으로 재가입이 불가능합니다.
            </details>
            <details>
                <summary>7.제품의 유통기한은 얼마나 되나요?</summary>
                하림펫푸드의 건식제품은 제조일로부터 1년을 유통기한으로 설정하고 있으며 유통기한만 표시하는 것이 아닌 제조일자도 표시하여 제품의 신선함을 보여드리고 있습니다.
                하림펫푸드에서는 아이들에게 보다 신선하고 안전한 음식을 제공하고자 노력하겠습니다.
            </details>
            <details>
                <summary>8.제품군이 다양한데 이유가 있나요?</summary>
                사람도 각기 다른 입맛을 가지고 있습니다.
                애완견들도 각자 선호하는 입맛을 가지고 있습니다.
                또한 연령, 환경, 활동량 등 각자 생활 환경이 다르기 때문에 필요로 하는 영양도 다른 것입니다.
                따라서 애완견들의 영양 상태와 입맛을 맞추기 위하여 하림펫푸드에서는 다양한 제품군을 제공하고 있습니다.
            </details>
        </div>
    </div>
</div>

<div class="footer" style="margin-top: 100px">
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