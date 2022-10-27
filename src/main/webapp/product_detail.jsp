
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
 <!--반응형 웹-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<!-- detail.css -->
	<link rel="stylesheet" href="css/product_detail.css">
<title>Insert title here</title>

</head>
<body>
    <!--js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>    

    <div class="product-list row"><!--전체도화지-->

<table>
    <div class="detail_img">
       <tr>
            <div>
                <td rowspan="2">
                    <img id="food_01_img" src="food/dryfood/42782_originalView_01579592.jpeg">
                </td>
            </div>
           
                <td>
                    <div class="detail_box">
                    <div class="detail_title">
                        <p>
                        <h1><strong>${selectByName.productName}</strong></h1>
                        </p>
                    </div>
                    <div class="detail_text">
                        <h3>${selectByName.productExplain}</h3>
                    </div>
                    <div class="detail_price">
                        <div class="detail_price_1"><h1>${selectByName.productPrice}</h1></div>    
                        <div class="detail_price_2"><h2>원</h2></div>    
                    </div>
                </div><!--detail_box-->
                </td>
           
       </tr>  
       <tr>
            <div class="detail_box_2">   
        		 <td>
                   <div class="order_name">
                   
                        <input type="number" min="0" max="10">  
                   
                   </div>
                   <div class="total_price">
                    <p>총 상품 금액</p>
                    <p class="result_price">${selectByName.productPrice}</p>
                   </div>
                </td>
            </div>     
        </tr>
        
        <tr>
           
            <td>
                <div class="detail_img_zip">
                <div class="detail_img_1">
                    <img src="food/dryfood/42782_originalView_02741465.jpeg">
                </div>
                <div class="detail_img_2">
                    <img src="food/dryfood/42782_originalView_06994349.jpeg">
                </div>
                <div class="detail_img_3">
                    <img src="food/dryfood/42782_originalView_07660884.jpeg">
                </div>
                </div><!--detail_img_zip-->
            </td>
            
            <td>
               
                <div class="d-grid gap-2">
                    <button class="btn btn-danger" type="button"><h3>바로 구매</h3></button>
                    <button class="btn btn-danger" type="button"><h3>장바구니</h3></button>
                </div>
                
            </td>
        </tr>

</table>

</div><!--product_list-->

    
</body>

</html>