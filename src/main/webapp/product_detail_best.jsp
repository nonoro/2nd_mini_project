
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Carousel Template · Bootstrap v5.2</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- header css -->
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/header/">
<link href="css/main/header.css" rel="stylesheet">

<!-- banner.css -->
<link rel="stylesheet" type="text/css" href="css/main/banner.css">

<!-- dropdownMenu.css -->
<link rel="stylesheet" type="text/css" href="css/main/dropdownMenu.css">


<!-- slide css -->
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/carousel/">
<link href="css/main/carousel.css" rel="stylesheet">

<!-- advertise.css -->
<link rel="stylesheet" href="css/main/advertise.css">

<!-- middle.css -->
<link rel="stylesheet" href="css/main/middle.css">

<!-- 페이징처리 -->
<link rel="stylesheet" href="css/main/paging.css">

<!-- footer -->
<link rel="stylesheet" href="css/main/footer.css">

<!--product_detail_test.css-->
<link href="css/product_detail_test.css" rel="stylesheet">

<script src="js/jquery-3.6.0.min.js"></script>
	


</head>

<!-- header -->
<jsp:include page="header.jsp" />
	<!--product_detail######################################################-->



	<script>
    	//작은 이미지 클릭하면 큰화면으로 보여진다.
    	$(function() {
    		$(document).on("click", "#img1", function() {
    			/* $("#bigimg").attr("src", "${pageContext.request.contextPath}/img/food/20417_originalView_02557733.jpeg"); */
    			$("#bigimg").attr("src", $(this).attr("src"));
    			
    		});
    	});
    	
    	//숫자에 맞게 별 출력 
    	<c:set var="star" value="star"/>
    	<c:if test="${star eq '1'}">⭐️</c:if>
    	<c:if test="${star eq '2'}">⭐⭐</c:if>
    	<c:if test="${star eq '3'}">⭐⭐⭐</c:if>
    	<c:if test="${star eq '4'}">⭐⭐⭐⭐</c:if>
    	<c:if test="${star eq '5'}">⭐⭐⭐⭐⭐</c:if>
    
    	
    	/* $("[name=minus]").on("click", function() { 
            let value = $(this).next().val();
            value--;
            $('#qty').val(value).change();

            newPrice = onePrice * $('#qty').val();
            $('#proPrice').text(newPrice);
        });

        $("[name=plus]").on("click", function() { 
            let value = $('#qty').val();
            value++;
            $('#qty').val(value).change();

            newPrice = onePrice * $('#qty').val();
            $('#proPrice').text(newPrice);
        }); */
        
        	  //수량 조절 버튼 
        	  function count(type){
        	  // 결과를 표시할 element
        	  const resultElement = document.getElementById('result');
        	  // 현재 화면에 표시된 값
        	  let number = resultElement.innerText;
        	  // 더하기/빼기
        	  if(type === 'plus') {
        	    number = parseInt(number) + 1;
        	  }else if(type === 'minus')  {
        	    number = parseInt(number) - 1;
        	  }
        	  // 결과 출력
        	  resultElement.innerText = number;
        	  }
        
        	
        //수량조절버튼 
        $("[name=minus]").on("click", function() { 
                let value = $(this).next().val();
                value--;
                $('#qty').val(value).change();
				//proPrice어디에...? onePrice 어디에...?
                newPrice = onePrice * $('#qty').val();
                $('#proPrice').text(newPrice);
            });

            $("[name=plus]").on("click", function() { 
                let value = $('#qty').val();
                value++;
                $('#qty').val(value).change();

                newPrice = onePrice * $('#qty').val();
                $('#proPrice').text(newPrice);
            });
        
        
    </script>

	<table class="review-box">
		<tr>
			<td rowspan="4" colspan="4">
				<!-- 상품 상세 메인사진 big -->
				<div id="big" class="product-detail-photo">
					<img id="bigimg"
						src="img/${selectByName.pFileName}.jpeg">
				</div>
			</td>
			<td>
				<div class="product-detail-name jump">
					<h4>
						<strong>${selectByName.productName }</strong>
					</h4>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="product-detail-star jump">
					<h4>⭐️ ⭐️ ⭐️ ⭐️</h4>
				</div> <a href="#">후기보러가기</a>
			<!--고정-->
			</td>
		</tr>
		<tr>
			<td>
				<div class="product-detail-price jump">
					<h1>
						<strong>${selectByName.productPrice}원</strong>
					</h1>
					
				</div>
				<br>
				<div class="product-detail-price">
					<h4>&nbsp;&nbsp;&nbsp;${selectByName.productPrice }원</h4>
					<!--고정-->
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 플러스/마이너스 수량계산 버튼 시작 -->
				<div class="order_name">
					수량 <br>
					<br>
					<br>
					<button class="minus" tabindex="0" type="button" name="minus">
						<span class="minus">&nbsp;-&nbsp;</span>
					</button>
					<!-- 여기를 어떻게 변경?  -->
					<input type="text" inputmode="decimal"
						class="MuiInputBase-input MuiInput-input jss1390" id="qty"
						value="1">

					<button class="plus" tabindex="0" type="button" name="plus">
						<span class="plus">&nbsp;+&nbsp;</span>
					</button>
				</div> <!-- 플러스/마이너스 수량계산 버튼 끝 -->

			</td>
		</tr>
		<tr>
			<!-- 상품 디테일사진 4장 -->
			<div class="product-detail-group">
			<c:forEach items="${productFile}" var="pf">
				<td>
					<!-- 클릭하면 상품 디테일 메인 사진이 보여진다. -->
					<div class="product-detail-photo2">
						<img class="small" id="img1"
							src="img/${pf.productFile}.jpeg">
					</div>
				</td>
				</c:forEach>
 		 		
				 	
			</div>
			<td>
				<div class="d-grid gap-2">
					<!-- 구매하기 버튼누르면 구매창으로 페이지 이동(현재창) -->
					<button class="btn btn-danger" type="button"
						onclick="location='${pageContext.request.contextPath}/.jsp'">구매하기</button>

					<!-- 장바구니 버튼누르면 장바구니으로 페이지 이동(현재창) -->
					<button class="btn btn-danger" type="button"
						onclick="location='${pageContext.request.contextPath}/.jsp'">장바구니</button>


				</div>
			</td>
		</tr>
	</table>

	<ul class="quick_menu">
		<div class="product-detail-menubar1">
			<li style="display: inline-block"><a class="btn1"
				href="#target1" style="text-decoration: none"><h6>상 품 정 보</h6></a></li>
			<li style="display: inline-block"><a class="btn2"
				href="#target2" style="text-decoration: none"><h6>운 영 방 침</h6></a></li>
			<li style="display: inline-block"><a class="btn3"
				href="#target3" style="text-decoration: none"><h6>구 매 후 기</h6></a></li>
		</div>
	</ul>

	<!-- ####################################### 원하는 위치로 스크롤 이동 -->
	<script>
        $('a').click(function() {
            $('html, body').animate({
                scrollTop: $($.attr(this, 'href')).offset().top
            }, 200);
            return false;
        });

        // 퀵메뉴
        $('.quick_menu li a').click(function() {
        // 버튼 hover 이벤트
            return false
            $(this).parent().addClass('on');
            $(this).parent().siblings().removeClass('on');
        });
		// target 위치 표시와, 이동  
        var sections = $('.target'),
            nav = $('.quick_menu'),
            nav_height = nav.outerHeight();

        $(window).on('scroll', function() {
            var cur_pos = $(this).scrollTop();

            sections.each(function() {
                var top = $(this).offset().top - nav_height,
                    bottom = top + $(this).outerHeight();

                if (cur_pos >= top && cur_pos <= bottom) {
                    nav.find('a').parent().removeClass('on');
                    sections.removeClass('active');

                    $(this).parent().addClass('on');
                    nav.find('a[href="#' + $(this).attr('id') + '"]').parent().addClass('on');
                }
            });
        });

        nav.find('a').on('click', function() {
            var $el = $(this),
                id = $el.attr('href');

            $('html, body').animate({
                scrollTop: $(id).offset().top 
            }, 200);

            return false;
        });

		// 원하는 위치에서 스크롤 이벤트
        $(window).on('scroll', function() {
            if ($(window).scrollTop() > 200) {
                $('.quick_menu').addClass("fixed");
            } else {
                $('.quick_menu').removeClass("fixed");
            }
        })
        </script>
	<!-- ####################################### 원하는 위치로 스크롤 이동 끝-->

	<div id="target1" class="product-detail-menubar2 target">
		<h5>상 품 정 보</h5>
	</div>




	<!-- ############################################# target2-->
	<!-- 상품 주저리 이미지 --><!-- 세품 상세 여기에 들어감 ~~~~~~~~~~~!!! -->
	<div class="product-detail-main-box">
		<div class="product-detail-main-description">
			<img
				src="img/${detailPhoto}.jpg">
		</div>
	</div>
	<!-- 운영방침 -->
	<div id="target2" class="product-detail-menubar3">
		<h5>운 영 방 침</h5>
	</div>
	<div class="product-detail-main-box2">
		<div class="product-detail-main-character">
			<img src="img/info.jpg">
		</div>
	</div>

	<!-- ############################################# target3-->
	<div id="target3" class="product-detail-menubar3 target">
		<h5>구 매 후 기</h5>
	</div>


	<!-- ############################################# review-->
	<table class="review-box">
		<tr>
			<td class="product-detail-review-td" colspan="6">
			<c:set var="star" value="${avrGrade}" />
			 <c:if test="${star eq '1'}">⭐</c:if>
				<c:if test="${star eq '2'}">⭐⭐</c:if> 
				<c:if test="${star eq '3'}">⭐⭐⭐</c:if>
				<c:if test="${star eq '4'}">⭐⭐⭐⭐</c:if> 
				<c:if test="${star eq '5'}">⭐⭐⭐⭐⭐</c:if>
				${avrGrade}점
				</h4>
				</td>
		</tr>
		<tr class="product-detail-review-photo-group">
		<c:forEach items="${list}" var="review">
			<td>
				<div class="product-detail-review-photo">
					<img
						src="img/${review.reviewFile}">
				</div>
			</td>
			<td>
				<div class="product-detail-review-photo">
					<img
						src="${pageContext.request.contextPath}/review/42782_detail_36241491033224.jpeg">
				</div>
			</td>
			</c:forEach>
		</tr>
		<!--반복문-->
		<c:forEach items="${list}" var="review">
		<tr>
			<td class="product-detail-review-td" colspan="6">
				<div class="product-detail-review-star"
					style="display: inline-block;">
				  <h4>
                  <c:set var="star" value="${review.reviewGrade}"/>
                <c:if test="${star eq '1'}">⭐</c:if>
                <c:if test="${star eq '2'}">⭐⭐</c:if>
                <c:if test="${star eq '3'}">⭐⭐⭐</c:if>
                <c:if test="${star eq '4'}">⭐⭐⭐⭐</c:if>
                <c:if test="${star eq '5'}">⭐⭐⭐⭐⭐</c:if>
                ${review.reviewPostdate}
             </h4>
				</div>
				<div class="product-detail-review-date"
					style="display: inline-block;">${review.reviewPostdate}</div>
			</td>
		</tr>
		<tr>
			<td class="product-detail-review-td" colspan="6">
				<div class="product-detail-review-id" style="display: inline-block;">
					${review.userId}</div> (
				<div class="product-detail-review-dogname"
					style="display: inline-block;"> ${review.dogName}</div> )
			</td>
		</tr>
		<tr>
			<td class="product-detail-review-td" colspan="6">
				<div class="product-detail-review-text"
					style="display: inline-block;">내용 : ${review.reviewDetail } </div>
					 <img id="reviewPhoto" src="img/${review.reviewFile}">
			</td>
		</tr>
		       </c:forEach>
		
		<!--반복문-->
	</table>

	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>