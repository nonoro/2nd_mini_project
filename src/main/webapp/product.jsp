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
            width:100%;
			height: 1380px;
            margin: 0 auto;
        }
        
        .product_list > .product_box{
            width: calc( (100% - 30px) /4); 
            height: 450px;
            padding: 15px;
            box-sizing: border-box;
            margin-right: 10px;
            margin-top: 10px;
        }
        
        .product_list > .product_box:nth-child(4n){ 
            margin-right: 0px;
        }   
        
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
        }
		
		 .footer-wrap{
            width: 100%;
            height: 300px;
            background-color: #9999;
            margin-top: 200px;
        }
        
        .clear{
        	width: 100%;
            height: 50px;
        }
        
        a{
        text-decoration:none;
        }
        
    </style>
<<<<<<< HEAD
=======
<<<<<<< HEAD
    <script type="text/javascript">
    	$(function() {
		function C() {
			
		}
	
		})	
		
    </script>
=======
>>>>>>> minjeong
   <script type="text/javascript">
   function check(th){
	   alert(1)
   }
   </script>
<<<<<<< HEAD
=======
>>>>>>> main
>>>>>>> minjeong
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
   
</head>

<body>

<div class="header-wrap">헤더자리</div>

<div class="clear">
    <!--체인지 버튼-->
<<<<<<< HEAD
=======
<<<<<<< HEAD
    <form name="f">
        <select id="subMenu" name="subMenu" onchange="subMenu(this)">
            <option value="0">최근 등록순</option>
            <option value="kfc">BEST순</option>
            <option value="lotte">별점 높은 순</option>
            <option value="king">후기 많은 순</option>
=======
>>>>>>> minjeong
    <form name="arrange" action="${path}/front?key=product&methodName=selectByarrange&arrange=${th.value}">
        <select id="subMenu" name="subMenu" onchange="check(this)">
            <option value="1">BEST순</option>
            <option value="2">별점 높은 순</option>
            <option value="3">후기 많은 순</option>
<<<<<<< HEAD
=======
>>>>>>> main
>>>>>>> minjeong
        </select>
    </form>
</div>
    
<div class="product_list row">
<c:forEach items="${list}" var="p">
    <!--상품 -->
     <div class="product_box cell">
     
        <div class="img_box">
<<<<<<< HEAD
        <a href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}&productCode=${p.productCode}">
=======
        <a href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}">
<<<<<<< HEAD
>>>>>>> a49223b1eff10b3b39c6c1a3f4603102b99f6989
            <img id="food_01_img" src="img/${p.pFileName}.jpeg"> 
=======
<<<<<<< HEAD
            <img id="food_01_img" src="food/53346_originalView_01991543.jpeg"> 
=======
            <img id="food_01_img" src="img/${p.pFileName}.jpeg"> 
>>>>>>> main
>>>>>>> minjeong
        </a>    
        </div><!--img_box-->

        <div class="text_box">
        	<a id="food_01_title" href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}&productCode=${p.productCode}"><!--상품 이름-->
        	
            ${p.productName}<br>
            </a>
            <div class="food_01_text"><!--상품 설명-->
            ${p.productExplain}
            </div>
            <div class="food_01_price"><!--상품 가격-->
            ${p.productPrice}
            </div>
        </div><!--text_box-->
    </div><!--product_box-->
	</c:forEach> 
   </div>
  


</body>
</html>