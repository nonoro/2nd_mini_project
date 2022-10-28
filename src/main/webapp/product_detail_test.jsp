<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--부트스트랩-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <title>Document</title>
    <style>
    table, th, td {
        border: 0.1px solid black;
        border-collapse: collapse;
        width: 800px;
        height: 100px;
        margin: 0 auto;
    }
    img{
        width: 100%;
        height: 100%;
    }
    .btn-group{
        display: inline-block;
        margin-left: 80px; 
    }
    .product-detail-name{
        width: 250px;
    }
    .product-detail-price{
        display: inline-block;
        margin: 0px;
    }
    .jump{
        margin-left: 20px;
    }
    a{
        margin-left: 20px;
        text-decoration: none;
        color: black;
    }
    .btn{
        margin: 0 20px;
    }       
    td > .product-detail-btn1{
        background-color:rgb(232, 232, 232);
        padding: 40px;
        margin: 20px;
        border-radius: 5px;
        box-sizing: border-box;
    }
    .cell{
        float: left;
    }
    .nav{
        margin: 10px 300px;
        background-color: antiquewhite;
    }
    .product-detail-main-box{
        width: 55%;
        margin: 0 auto;
    }
    li{
        display: inline-block;
        margin: 0 85px;
    }
    ul{
        text-align: center;
    }
    
    .product-detail-menubar1{
        /* background-color:rgb(239, 215, 179); */
        padding-bottom: 13px;
        border-bottom: 0.1px solid black;
        /* border-top: 0.1px solid black; */
    }
    .product-detail-menubar2{
        padding-bottom: 8px;
        border-bottom: 0.1px solid black;
    }
    .product-detail-menubar2 > h5{
        margin-left: 315px;
        padding: 8px;
    }
    .product-detail-review-photo-group > td{
        background-color: rgb(212, 212, 212);
        
    }
    .product-detail-review-td{
        height: 50px;
    }
    
    </style>
    
    <script type="text/javascript">
    
    
    </script>
    
    
</head>
<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <table class="review-box">
        <tr>
            <td rowspan="4" colspan="4">
                <div class="product-detail-photo">
                    <img src="img/${selectByName.pFileName}.jpeg">
                </div>
            </td>
            <td>
                <div class="product-detail-name jump">
                    <h4><strong>${selectByName.productName }</strong></h4>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="product-detail-star jump">
                    <h4>
				    	<c:set var="star" value="${avrGrade}"/>
				    	<c:if test="${star eq '1'}">⭐</c:if>
				    	<c:if test="${star eq '2'}">⭐⭐</c:if>
				    	<c:if test="${star eq '3'}">⭐⭐⭐</c:if>
				    	<c:if test="${star eq '4'}">⭐⭐⭐⭐</c:if>
				    	<c:if test="${star eq '5'}">⭐⭐⭐⭐⭐</c:if>
				    	${avrGrade}점
				    </h4>
                </div>
                <a href="#" >후기보러가기</a><!--고정-->
            </td>
        </tr>
        <tr>
            <td>
                <div class="product-detail-price jump">
                    <h2><strong>${selectByName.productPrice}</strong></h2>
                </div>
                <div class="product-detail-price">
                    <h4>원</h4><!--고정-->
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="product-detail-btn1">
                   플러스/마이너스 수량 계산 버튼 
                </div>
            </td>
        </tr>
        <tr> 
        
            <div class="product-detail-group">
            <!-- 포문d -->
            <td>
            
                <div class="product-detail-photo2">
                    <img src="img/${selectByName.pFileName}.jpeg">
                </div>
              
            </td>
            <!-- 포문끝 -->
              
              
            <td>
                <div class="product-detail-photo2">
                    <img src="/food/dryfood/42782_originalView_02741465.jpeg">
                </div>
            </td>
            <td>
                <div class="product-detail-photo2">
                    <img src="/food/dryfood/42782_originalView_06994349.jpeg">
                </div>              
            </td>
            <td>
                <div class="product-detail-photo2">
                    <img src="/food/dryfood/42782_originalView_07660884.jpeg">
                </div>
            </td>
            </div>
            <td>
                <div class="d-grid gap-2">
                    <button class="btn btn-danger" type="button">구매하기</button>
                    <button class="btn btn-danger" type="button">장바구니</button>
                </div>
            </td>
        </tr>
    </table>
    
        <ul>
            <div class="product-detail-menubar1" >
                <li style="display: inline-block">
                    <a href="#"><h6>상 품 정 보</h6></a>
                </li>
                <li style="display: inline-block">
                    <a href="#"><h6>운 영 방 침</h6></a>
                </li>
                <li style="display: inline-block">
                    <a href="#"><h6>구 매 후 기</h6></a>
                </li>
            </div>
        </ul>
        <div class="product-detail-menubar2">
            <h5>상 품 정 보</h5>
        </div>
            
                
            

       
    <div class="product-detail-main-box">
        <div class="product-detail-main-description">
            <img src="/main_product_photo/42782_desc_788269.jpeg">
        </div>
        
        <div class="product-detail-main-character">
            <img src="/img/policy_1.jpg">
        </div>
    </div>
    <div class="product-detail-menubar2">
        <h5>구 매 후 기</h5>
    </div>
    <table class="review-box">
        <tr>
            <td class="product-detail-review-td" colspan="6">
	            <h4>
	            	<c:set var="star" value="${avrGrade}"/>
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
        <!-- 포문 -->
        <c:forEach items="${list}" var="review">
            <td>
                <div class="product-detail-review-photo">
                    <img src="img/${review.reviewFile}">
                </div>
            </td>
            </c:forEach>
            <!--끝 -->
          
        </tr>
       <!-- 반복문 시작 -->
       <c:forEach items="${list}" var="review">
       <tr>
            <td class="product-detail-review-td" colspan="6"> 
                <div class="product-detail-review-star" style="display: inline-block;">
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
            </td>
        </tr>
        <tr>
            <td class="product-detail-review-td" colspan="6">
                <div class="product-detail-review-id" style="display: inline-block;">
                   ${review.dogName}
                </div>
                (
                <div class="product-detail-review-dogname" style="display: inline-block;">
                    ${review.userId}
                </div>
                )
            </td>
        </tr>
        <tr>
            <td class="product-detail-review-td" colspan="6">
                <div class="product-detail-review-text" style="display: inline-block;">
                    내용 : ${review.reviewDetail } // 
                    <img id="20417.jpeg" src="img/${review.reviewFile}">
                </div>
            </td>
        </tr>
       </c:forEach>
        
  <!-- 반복문 끝 -->
    </table>
</body>
</html>