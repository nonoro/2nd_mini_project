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
	<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- header css -->
	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
	<link href="/css/main/header.css" rel="stylesheet">

	<!-- banner.css -->
	<link rel="stylesheet" type="text/css" href="css/main/banner.css">

	<!-- dropdownMenu.css -->
	<link rel="stylesheet" type="text/css" href="css/main/dropdownMenu.css">


	<!-- slide css -->
	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">
	<link href="css/main/carousel.css" rel="stylesheet">

	<!-- advertise.css -->
	<link rel="stylesheet" href="css/main/advertise.css">

	<!-- middle.css -->
	<link rel="stylesheet" href="css/main/middle.css">

	<!-- 페이징처리 -->
	<link rel="stylesheet" href="css/main/paging.css">

	<!-- footer -->
	<link rel="stylesheet" href="css/main/footer.css">

	<script src="js/jquery-3.6.0.min.js"></script>



</head>

<!-- header -->

<body id="mainBody">
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
		<a href="index.jsp"><img src="img/logo.png" alt="" style="height: 190px; padding-top: 20px;"></a>

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
<script src="/js/dropdown.js"></script>


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
			<div class="carousel-item active">
				<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
					 aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="#777" />
				</svg>

				<div class="container">
					<div class="carousel-caption text-start">
						<h1>사진이</h1>
						<p>들어갈자리</p>
						<p><a class="btn btn-lg btn-primary" href="#">해당 페이지로 이동</a></p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
					 aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="#777" />
				</svg>

				<div class="container">
					<div class="carousel-caption">
						<h1>사진이</h1>
						<p>들어갈자리</p>
						<p><a class="btn btn-lg btn-primary" href="#">해당 페이지로 이동</a></p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
					 aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="#777" />
				</svg>

				<div class="container">
					<div class="carousel-caption text-end">
						<h1>사진이</h1>
						<p>들어갈자리</p>
						<p><a class="btn btn-lg btn-primary" href="#">해당 페이지로 이동</a></p>
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
<script src="/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

<!-- advertisementBanner -->
<div class="ad-main">
	<div class="ad-side"></div>
	<div class="ad-center">
		<a href="#">눈을떠요</a>
		<a href="#">밥이 보약</a>
		<a href="#">관절 팔팔</a>
	</div>
	<div class="ad-side"></div>
</div>

<!-- middle -->
<div class="middle">
	<div class="middle-main">
		<div class="middle-best"><span id="best">Best&nbsp;</span><span id="bContents">반려인들의 선택</span></div>
		<div class="middle-container1">
			<div class="middle-container-item">
				<div class="middle-img"><a href="#"><img src="img/dog.png" alt=""></a></div>
				<div class="middle-detail">정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
			</div>
			<div class="middle-container-item">
				<div class="middle-img"><a href="#"><img src="img/dog1.png" alt=""></a></div>
				<div class="middle-detail">정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
			</div>
			<div class="middle-container-item">
				<div class="middle-img"><a href="#"><img src="img/dog3.png" alt=""></a></div>
				<div class="middle-detail">정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
			</div>
		</div>


		<div class="middle-best"><span id="best">Review&nbsp;</span><span id="bContents">댕댕이들의 생생한후기</span></div>
		<div class="middle-container2">
			<div class="middle-container-item">
				<div class="middle-img"><a href="#"><img src="img/dog.png" alt=""></a></div>
				<div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
			</div>
			<div class="middle-container-item">
				<div class="middle-img"><a href="#"><img src="img/dog1.png" alt=""></a></div>
				<div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
			</div>
			<div class="middle-container-item">
				<div class="middle-img"><a href="#"><img src="img/dog3.png" alt=""></a></div>
				<div class="middle-detail">작성자 : ㅇㅇㅇ<br>정순이 귀여워<br>18,000원<br>귀엽고 깜찍한 강아지!<br>16년동안 인증된 건강한 강아지</div>
			</div>
		</div>
	</div>
</div>


<div class="hrLine"></div>

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

<!-- footer -->
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
</body>

</html>