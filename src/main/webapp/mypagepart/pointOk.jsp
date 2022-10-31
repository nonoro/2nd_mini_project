<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="${path}/assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- ###############################################mypage############################################### -->

    <link rel="stylesheet" href="${path}/css/myPage/myPage.css">

    <style>
        th {
            text-align: center;
        }
    </style>
    <script src="${path}/js/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
        	let userId = sessionStorage.getItem("userId"); //나중에 합칠 때 빼야 함!!!!!!!!!!!!!!!!
        	
            $(document).on("click", "#order", function () {
                if (false) {
                    $("#order").attr("href", "${path}/mypagepart/myPageOrder.jsp");
                } else {
                    $("#order").attr("href", "${path}/mypagepart/myPageOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#cancelOrder", function () {
                if (false) {
                    $("#cancelOrder").attr("href", "${path}/mypagepart/myPageCancelOrder.jsp");
                } else {
                    $("#cancelOrder").attr("href", "${path}/mypagepart/myPageCancelOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#pointDetail", function () {
                if (false) {
                    $("#pointDetail").attr("href", "${path}/mypagepart/pointOk.jsp");
                } else {
                    $("#pointDetail").attr("href", "${path}/mypagepart/pointEmpty.jsp");
                }
            });

            $(document).on("click", "#notice", function () {
                if (false) {
                    $("#notice").attr("href", "${path}/mypagepart/noticeDetail.jsp");
                } else {
                    $("#notice").attr("href", "${path}/mypagepart/noticeEmpty.jsp");
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
        <span id="pageName">포인트내역&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="../informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="../menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container">
            <h2>포인트내역</h2>
            <div class="menu-result-container-list"  style="margin: 0px">
            <hr>
                <table class="table table-striped">
                    <tr>
                        <th>번호</th>
                        <th>적립/사용 포인트</th>
                        <th>포인트 적립일</th>
                        <th>포인트 사용일</th>
                         <th>주문 번호</th>
                    </tr>
                    <c:forEach items="${pointList}" var="point" varStatus="state">
                    	 <tr>
                        	<th>${state.index + 1}</th>
                        	<th><fmt:formatNumber value="${point.pointSave}"/></th>
                        	<th>${point.pointSavedate}</th>
                        	<th>${point.pointUseddate}</th>
                        	<th><a href="${path}/front?key=order&methodName=selectOrderLineByOrderCode&orderCode=${point.orderCode}">${point.orderCode}</a></th>
                    	</tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>
