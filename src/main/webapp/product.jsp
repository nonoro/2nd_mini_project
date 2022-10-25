
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <script type="text/javascript">
    	$(function() {
		function C() {
			
		}
	
		})	
		
    </script>
</head>

<body>

<div class="header-wrap">헤더자리</div>
<div class="clear">
</div>
    
<div class="product_list row">
<c:forEach items="${list}" var="p">
    <!--상품 -->
     <div class="product_box cell">
     
        <div class="img_box">
        <a href="${path}/front?key=product&methodName=selectByProductName&productName=${selectByName.productName}">
            <!-- <img id="food_01_img" src="/사료/건식사료/20417_originalView_01171472.jpeg"> --><!-- 1 -->
            <img id="food_01_img" src="food/53346_originalView_01991543.jpeg"> 
        </a>    
        </div><!--img_box-->

        <div class="text_box">
        	<a id="food_01_title" href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}"><!--상품 이름-->
        	
            ${p.productName}<br>
            </a>
            <div class="food_01_text"><!--상품 설명-->
            ${p.productExplain}
            </div>
            <div class="food_01_price"><!--상품 가격-->
            ${p.productPrice}
            </div>
            <a href="http://www.naver.com">👉 후기보러가기 👈</a>
        </div><!--text_box-->
    </div><!--product_box-->
	</c:forEach> 
   </div>
  


</body>
</html>