<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
        .product_list{
           /*  width: 1300px; */
            width:100%;
			height: 1380px;
            /* background-color: lightcoral; */
            margin: 0 auto;
        }
        .product_list > .product_box{
            width: calc( (100% - 30px) /4); 
            /*계산:10px씩 여백이 3개(30px)이고 사진이 총 4개*/
            height: 450px;
            /* background-color: antiquewhite; */
            padding: 15px;
            box-sizing: border-box; /* 박스사이즈 유지하면서 패딩 */
            margin-right: 10px;
            margin-top: 10px;
        }
        
        /*
        4, 8, 12번째 product_box가 위에 margin-right 떄문에 밀려 내려가니까 
        nth-child(4)를 포인트 잡아서 margin-right에 0을 준다.
        */
        .product_list > .product_box:nth-child(4n){ 
        /*4n을 적어주면 각줄에 4번째 오는 product_box를 가리키게된다.*/
            margin-right: 0px;
        }    
        /* 
        .product_list > .product_box:nth-child(8){
            margin-right: 0px;
        }    
        .product_list > .product_box:nth-child(12){
            margin-right: 0px;
        }    
        */
        /*
        nth-child 속성
        간단한 사칙연산은 안에 적어줄 수 있다.
        */
        
        /* .product_list > .product_box > .img_box > a > img{
            width: 100%;
            height: 20px; 
        }  
        */
        
        img{
        	width: 100%;
        	height: 100%;
        }
        .product_list > .product_box > .text_box{
            font-size:large;
            margin-top: 15px;
            
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
            
        } 
        .cell{
            float: left;
        }
		
		.header-wrap{
            width: 100%;
            height: 300px; 
            background-color: #9999;
            /* margin-bottom: 200px; */
            
        }
		
		 .footer-wrap{
            width: 100%;
            height: 300px;
            background-color: #9999;
            margin-top: 200px;
        }
        /*  .footer-wrap > .footer{
            height: 500px;
            background-color: #9999;
        } */
        
        .clear{
        	width: 100%;
            height: 50px;
        }
        
        a{
        text-decoration:none;
        }
        
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script type="text/javascript">
	$(function() {

		$("[name=cartInsert]").click(function() { 
			let key = $(this).attr("id");
			let value = $(this).attr("value"); //$(this).val() 가능

			sessionStorage.setItem(key, value);
			
			if(confirm("장바구니를 확인하시겠습니까?")) {
				location.href = "cartList.html";
			}
		});
		
		$("a").click(function() { 
			//alert("최근 본 상품!")
			let key = $(this).attr("id");
			let value = $(this).attr("value"); //$(this).val() 가능

			localStorage.setItem(key, value);
		});
		
		

	}); //readyEnd
</script>
    
</head>

<body>
<div class="header-wrap">헤더자리</div>
<div class="clear">공백</div>

<div class="product_list row">

    <!--상품 -->
     <div class="product_box cell">
        <div class="img_box">
        	<a href="${path}/productDetail.jsp" id="1001" value="쿵푸팬더,img/movie_image2.jpg,3000">
        		<img id="1001" src="img/movie_image2.jpg">
        	</a>    
        </div><!--img_box-->

        <div class="text_box">
        	<a id="food_01_title" href="http://www.naver.com" >네츄럴코어 에코 시니어 오리&고구마<br></a>
            <div class="food_01_text">국내산 100% 고구마 사용</div>
            <div class="food_01_price"> 49,900원</div>
            <a href="http://www.naver.com">👉 후기보러가기 👈</a>
            <button name="cartInsert" id="1001" value="쿵푸팬더,img/movie_image2.jpg,3000" >장바구니 담기</button> 
        </div><!--text_box-->
    </div><!--product_box-->
    
   <div class="product_box cell">
        <div class="img_box">
        	<a href="http://www.naver.com" id="1002" value="어벤져스,img/avengers.jpg,3000">
        		<img id="1002" src="img/avengers.jpg" value="어벤져스,img/avengers.jpg,3000">
        	</a>    
        </div><!--img_box-->

        <div class="text_box">
        	<a id="food_01_title" href="http://www.naver.com">네츄럴코어 에코 시니어 오리&고구마<br></a>
            <div class="food_01_text">국내산 100% 고구마 사용</div>
            <div class="food_01_price"> 49,900원</div>
            <a href="http://www.naver.com">👉 후기보러가기 👈</a>
            <button name="cartInsert" id="1002" value="어벤져스,img/avengers.jpg,3000">장바구니 담기</button>
        </div><!--text_box-->
    </div><!--product_box-->
    
    <div class="product_box cell">
        <div class="img_box">
        	<a href="http://www.naver.com" id="1002" value="어벤져스,img/avengers.jpg,3000">
        		<img id="1003" src="img/BigBuck.jpg" class="recentList">
        	</a>    
        </div><!--img_box-->

        <div class="text_box">
        	<a id="food_01_title" href="http://www.naver.com" class="recentList">네츄럴코어 에코 시니어 오리&고구마<br></a>
            <div class="food_01_text">국내산 100% 고구마 사용</div>
            <div class="food_01_price"> 49,900원</div>
            <a href="http://www.naver.com">👉 후기보러가기 👈</a>
            <button name="cartInsert" id="1003" value="빅벅,img/BigBuck.jpg,2500">장바구니 담기</button>
        </div><!--text_box-->
    </div><!--product_box-->
    
 </div><!-- product list -->
 
<!-- <div class="footer-wrap">푸터자리</div> -->
<!-- <div class="footer con"></div>   -->


</body>
</html>