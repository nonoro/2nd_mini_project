<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/myPage.css">

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
        	let userId = sessionStorage.getItem("userId");
        	
            $(document).on("click", "#order", function () {
                if (true) {
                    $("#order").attr("href", "${path}/front?key=order&methodName=selectOrderByUserId&userId=" + userId);                    
                } else {
                    $("#order").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#cancelOrder", function () {
                if (true) {
                    $("#cancelOrder").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageCancelOrder.jsp");
                } else {
                    $("#cancelOrder").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageCancelOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#pointDetail", function () {
                if (true) {
                    $("#pointDetail").attr("href", "${pageContext.request.contextPath}/mypagepart/pointOk.jsp");
                } else {
                    $("#pointDetail").attr("href", "${pageContext.request.contextPath}/mypagepart/pointEmpty.jsp");
                }
            });

            $(document).on("click", "#notice", function () {
                if (true) {
                    $("#notice").attr("href", "${pageContext.request.contextPath}/mypagepart/noticeDetail.jsp");
                } else {
                    $("#notice").attr("href", "${pageContext.request.contextPath}/mypagepart/noticeEmpty.jsp");
                }
            });
            
            $(document).on("click", "#myReview", function () {
                if (true) {
                    $("#myReview").attr("href", "${path}/front?key=review&methodName=selectByUserId&userId=${sessionScope.loginUser}");
                } else {
                    $("#myReview").attr("href", "${path}/front?key=review&methodName=selectByUserId&userId=${sessionScope.loginUser}");
                }
            });
            
            
        });
    </script>

</head>

<!-- header -->

<body>

<div class="menu-container">
    <div class="menu-container-a">
        <span>&nbsp;&nbsp;나의 쇼핑</span>
        
        <input type="hidden" name="userId" value="${userId}">
    </div>
    <hr style="margin: 0;">
    <div class="menu-container-a" >
        <a href="#" id="order"><span>&nbsp;&nbsp;주문&nbsp;∙&nbsp;배송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
    </div>
 <!--    <div class="menu-container-a">
        <a href="#" id="cancelOrder"><span>&nbsp;&nbsp;주문취소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
    </div> -->
    <div class="menu-container-a">
        <a href="#" id="pointDetail"><span>&nbsp;&nbsp;포인트내역
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
    </div>
    <div class="menu-container-a">
        <a href="#" id="notice"
        ><span>&nbsp;&nbsp;공지사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
    </div>
    <div class="menu-container-a">
        <a href="${pageContext.request.contextPath}/mypagepart/repeatedQuestion.jsp">
            <span>&nbsp;&nbsp;자주묻는질문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span>
        </a><br>
    </div>
   <div class="menu-container-a">
        <a href="#" id="myReview"><span>&nbsp;&nbsp;내가 작성한 리뷰
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></span></a><br>
    </div>
</div>

</body>
</html>