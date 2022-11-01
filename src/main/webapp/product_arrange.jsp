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
   <script type="text/javascript">
   function check(th){
	   //alert(th.value)
	   location.href="${path}/front?key=product&methodName=selectByarrange&arrange="+th.value;
   }
   </script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
   
</head>

<body style="background-color: rgba(255,241,193,1)">

<div class="header-wrap">헤더자리</div>

<div class="clear">
    <!--체인지 버튼-->

    <form name="arrange">
        <select id="subMenu" name="subMenu" onchange="check(this)">
            <option value="1">BEST순</option>
            <option value="2">별점 높은 순</option>
            <option value="3">후기 많은 순</option>
        </select>
    </form>
</div>
    
<div class="product_list row">
<c:forEach items="${selectByarrange}" var="byarrange">
    <!--상품 -->
     <div class="product_box cell">
     
        <div class="img_box">
        <a href="${path}/front?key=product&methodName=selectByProductName&productName=${byarrange.productName}&productCode=${byarrange.productCode}">

            <img id="food_01_img" src="img/${byarrange.pFileName}.jpeg"> 

        </a>    
        </div><!--img_box-->

        <div class="text_box">
        	<a id="food_01_title" href="${path}/front?key=product&methodName=selectByProductName&productName=${byarrange.productName}&productCode=${byarrange.productCode}"><!--상품 이름-->
        	
            ${byarrange.productName}<br>
            </a>
            <div class="food_01_text"><!--상품 설명-->
            ${byarrange.productExplain}
            </div>
            <div class="food_01_price"><!--상품 가격-->
            ${byarrange.productPrice}
            </div>
        </div><!--text_box-->
    </div><!--product_box-->
	</c:forEach> 
   </div>
  


</body>
</html>