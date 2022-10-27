
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  $(function () {
	  function arrange(){
		   $.ajax({
			url :"ajax" , //서버요청주소
			type:"post", //요청방식(method방식 : get | post | put | delete )
			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			data: {key:"product" , methodName : "selectByarrange"}, //서버에게 보낼 데이터정보(parameter정보)
			success :function(result){
				let str="";
				$.each(result, function(index, item){
				    str+="<tr>";
				    str+=`<td>${(index+1)}</td>`;
				    str+=`<td><a href='#'>${item.id}</a></td>`;
				    str+=`<td>${item.name}</td>`;
				    str+=`<td>${item.age}</td>`;
				    str+=`<td>${item.tel}</td>`;
				    str+=`<td>${item.addr}</td>`;
				    str+=`<td><input type='button' value='삭제' name='${item.id}'></td>`;
				    str+="</tr>";
			  });
})
   </script>
</head>

<body>


<div class="header-wrap">헤더자리</div>

<div class="clear">
    <!--체인지 버튼-->
    <form name="arrange" action="${path}/front?key=product&methodName=selectByarrange&arrange=${th.value}">
        <select id="subMenu" name="subMenu">
            <option value="1">BEST순</option>
            <option value="2">별점 높은 순</option>
            <option value="3">후기 많은 순</option>
        </select>
    </form>
</div>

<div class="product_list row">

<c:forEach items="${list}" var="p">
    <!--상품 -->
     <div class="product_box cell">
        <div class="img_box">
        	<a href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}">
            	<img id="food_01_img" src="img/a.jpg">
            </a>    
        </div><!--img_box-->
        <div class="text_box">
        	<a id="food_01_title" href="${path}/front?key=product&methodName=selectByProductName&productName=${p.productName}">
            	${p.productName}<br>
            </a><!-- 상품 이미지 -->
            <div class="food_01_text">
            	${p.productExplain}
            </div><!--상품 설명-->
            <div class="food_01_price">
            	${p.productPrice}
            </div><!--상품 가격-->
            	<a href="http://www.naver.com">👉 후기보러가기 👈</a>
        </div><!--text_box-->
    </div>
    <!-- 상품 끝 -->
</c:forEach>
 </div>  
 



</body>
</html>