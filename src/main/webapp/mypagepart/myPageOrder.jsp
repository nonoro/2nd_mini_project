<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>myPage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ###############################################mypage############################################### -->

    <link rel="stylesheet" href="../css/myPage/myPage.css">

    <script src="js/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
        	let userId = sessionStorage.getItem("userId"); //나중에 합칠 때 빼야 함!!!!!!!!!!!!!!!!
        	let values = "" ;
        	
            $(document).on("click", "#order", function () {
                if (false) {
                    $("#order").attr("href", "../mypagepart/myPageOrder.jsp");
                } else {
                    $("#order").attr("href", "../mypagepart/myPageOrderEmpty.jsp");
                }
            });

            $(document).on('click', '#orderCancel', function(){

            	values = $(this).val();
            	
            	let arr = values.split(",");

            	let orderCode = arr[0];
            	
            	if(confirm("주문을 취소하시겠습니까?")) {
					location.href = "${path}/front?key=order&methodName=orderCancel&orderCode=" + orderCode;
				}
            });
            
            $(document).on("click", "#pointDetail", function () {
                if (false) {
                    $("#pointDetail").attr("href", "../mypagepart/pointOk.jsp");
                } else {
                    $("#pointDetail").attr("href", "../mypagepart/pointEmpty.jsp");
                }
            });

            $(document).on("click", "#notice", function () {
                if (false) {
                    $("#notice").attr("href", "../mypagepart/noticeDetail.jsp");
                } else {
                    $("#notice").attr("href", "../mypagepart/noticeEmpty.jsp");
                }
            });            
        });
    </script>

</head>

<!-- header -->

<body>
<jsp:include page="../header.jsp"/>
<div class="shopTool">
    <div class="shopTool-detail">
        <span style="margin-left: 10px">홈&nbsp;>&nbsp;</span>
        <span>마이페이지&nbsp;>&nbsp;</span>
        <span id="pageName">주문/배송&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="../informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="../menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container"><h2>주문 ∙ 배송</h2>
            <hr class="menu-result-list-hr">
    
            <input type="hidden" name="userId" value="${userId}">
    
            <c:forEach items="${orderList}" var="order">
 
            <div class="menu-result-container-list" style="margin-left: 0; width: 78%;">
                <div class="okMenuList">
                    <div>
                        <img src="img/logo.png" style="width: 150px; height: 150px;" alt="">
                    </div>
                    <div class="menu-result-content" style="text-align: left;">
                        <div> 
                        	<c:choose>
                                <c:when test="${(order.orderComplete) == 3}">
                                     <h5 style="color: red">주문이 취소되었습니다.</h5>
                                     <c:choose>
                                     	<c:when test="${fn:length(order.orderLineList) le 1}" >
                        					상품 이름: ${order.orderLineList[0].productName}                                 
                        				</c:when>
                        				<c:otherwise>
                        					상품 이름: ${order.orderLineList[0].productName} 외 ${fn:length(order.orderLineList) - 1}건
                        				</c:otherwise>
                                     </c:choose>
                                </c:when>

                        		<c:otherwise>
                        			<c:choose>
                                     	<c:when test="${fn:length(order.orderLineList) le 1}" >
                        					상품 이름: ${order.orderLineList[0].productName}                                 
                        				</c:when>
                        				<c:otherwise>
                        					상품 이름: ${order.orderLineList[0].productName} 외 ${fn:length(order.orderLineList) - 1}건
                        				</c:otherwise>
                                     </c:choose>
                        		</c:otherwise>
                        	</c:choose>
                         </div>                      
                        <div>총액: <fmt:formatNumber value="${order.orderTotalPrice}"/>원 &nbsp;&nbsp;&nbsp;&nbsp;
                        	결제일: ${order.orderDate}
                        </div>
                    </div>

                    <c:choose>
                    	<c:when test="${(order.orderComplete) == 3}">
                        </c:when>
                        <c:otherwise>
                        	<div class="menu-result-review">
                        		<div><a href="${path}/front?key=order&methodName=selectOrderLineByOrderCode&orderCode=${order.orderCode}" class="btn btn-outline-secondary" id="checkOrderList">주문 내역</a></div>
                    		</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    		<div class="menu-result-review">
                       			 <div>
                        			<button type="button" class="btn btn-outline-danger" id="orderCancel" value="${order.orderCode},${order.orderComplete}">주문 취소</button>
                        		</div>
                    		</div>
                        </c:otherwise>
                    </c:choose>  
                </div>
            </div>
            <hr class="menu-result-list-hr">
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>