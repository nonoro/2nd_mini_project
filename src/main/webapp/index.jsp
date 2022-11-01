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
    <link href="${path}/assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- banner.css -->
    <link rel="stylesheet" type="text/css" href="${path}/css/main/banner.css">

    <!-- dropdownMenu.css -->
    <link rel="stylesheet" type="text/css" href="${path}/css/main/dropdownMenu.css">


    <!-- slide css -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">
    <link href="${path}/css/main/carousel.css" rel="stylesheet">

    <!-- advertise.css -->
    <link rel="stylesheet" href="${path}/css/main/advertise.css">

    <!-- middle.css -->
    <link rel="stylesheet" href="${path}/css/main/middle.css">

    <!-- 페이징처리 -->
    <link rel="stylesheet" href="${path}/css/main/paging.css">

    <script src="${path}/js/jquery-3.6.0.min.js"></script>

<%--    <script>
        $(function(){
            console.log("message ="+ "${message}");

            if ("${message}" == "ㅅㅊ" || "${message}" == "") {
                return;
            } else {
                alert("${message}");
            }
        });
    </script>--%>


</head>

<!-- header -->

<body id="mainBody" style="background-color: rgba(255,241,193,1)">
<jsp:include page="header.jsp"/>
<!-- 슬라이드 -->
<main>
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" style="z-index: 1;">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <rect width="100%" height="100%" fill="#777"/>
                </svg>

                <div class="container">
                    <div class="carousel-caption text-start" style="padding: 0px; z-index: 2;">
                        <a href="#">
                            <img src="https://file.cafe24cos.com/banner-admin-live/upload/harimpetfood/d8189fa8-925a-42b7-bfbc-c5bf70a2c7e7.jpeg" alt="" style="width: 1728px; height: 512px; position: relative; right: 260px; top: 20px">
                        </a>
                    </div>
                </div>
            </div>
            <div class="carousel-item" style="z-index: 1;">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <rect width="100%" height="100%" fill="#777"/>
                </svg>

                <div class="container">
                    <div class="carousel-caption">
                        <a href="#">
                            <img src="https://file.cafe24cos.com/banner-admin-live/upload/harimpetfood/821c4079-f616-4ebf-a49f-05e054af3a46.jpeg" alt="" style="width: 1728px; height: 512px; position: relative; right: 260px; top: 40px">
                        </a>
                    </div>
                </div>
            </div>
            <div class="carousel-item"  style="z-index: 1;">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <rect width="100%" height="100%" fill="#777"/>
                </svg>

                <div class="container">
                    <div class="carousel-caption text-end">
                        <a href="#">
                            <img src="https://file.cafe24cos.com/banner-admin-live/upload/harimpetfood/58c3ccc6-192b-4c2d-c08a-01d64da2828c.jpeg" alt="" style="width: 1728px; height: 512px; position: relative; right: 260px; top: 40px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="container marketing">
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<!-- advertisementBanner -->
<div class="ad-main">
    <div class="ad-side"></div>
    <div class="ad-center">
        <a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=15">눈을떠요</a>
        <a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=7">밥이 보약</a>
        <a href="${path}/front?key=product&methodName=productSelectByCategory&productCategory=18">관절 팔팔</a>
    </div>
    <div class="ad-side"></div>
</div>

<!-- middle -->
<div class="middle">
    <div class="middle-main">
        <div class="middle-best"><span id="best">Best&nbsp;</span><span id="bContents">반려인들의 선택</span></div>
        <div class="middle-container1">
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="https://img.dogpre.com/mobile/dogpre/product/85/84177_detailView_01116403.jpg" alt=""></a></div>
                <div class="middle-detail">상품명<br>18,000원<br>귀엽고 설명강아지!<br> 간단 한줄평 </div>
            </div>
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="https://img.dogpre.com/mobile/dogpre/product/89/88066_detailView_01265200.jpg" alt=""></a></div>
                <div class="middle-detail">정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="https://img.dogpre.com/mobile/dogpre/product/88/87048_detailView_01951509.jpg" alt=""></a></div>
                <div class="middle-detail">정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
        </div>




        <div class="middle-best"><span id="best">Review&nbsp;</span><span id="bContents">댕댕이들의 생생한후기</span></div>
        <div class="middle-container2">
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="${path}/img/dog.png" alt=""></a></div>
                <div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="${path}/img/dog1.png" alt=""></a></div>
                <div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="${path}/img/dog3.png" alt=""></a></div>
                <div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
        </div>
        <div class="middle-container2">
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="${path}/img/dog.png" alt=""></a></div>
                <div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="${path}/img/dog1.png" alt=""></a></div>
                <div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
            <div class="middle-container-item">
                <div class="middle-img"><a href="#"><img src="${path}/img/dog3.png" alt=""></a></div>
                <div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
            </div>
        </div>
    </div>
</div>


<!-- paging -->
<article class="article">
    <ul class="contents"></ul>
    <div class="buttons"></div>
</article>
<!-- Scripts -->
<!--	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>-->
<!--	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>-->
<!--	<script src="js/paging.js"></script>-->

<div class="hrLine"></div>

<jsp:include page="footer.jsp"/>
</body>

</html>