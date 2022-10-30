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


    <!-- ###############################################mypage############################################### -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/myPage.css">

    <style>
        th {
            text-align: center;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
            $(document).on("click", "#order", function () {
                if (false) {
                    $("#order").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageOrder.jsp");
                } else {
                    $("#order").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#cancelOrder", function () {
                if (false) {
                    $("#cancelOrder").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageCancelOrder.jsp");
                } else {
                    $("#cancelOrder").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageCancelOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#pointDetail", function () {
                if (false) {
                    $("#pointDetail").attr("href", "${pageContext.request.contextPath}/mypagepart/pointOk.jsp");
                } else {
                    $("#pointDetail").attr("href", "${pageContext.request.contextPath}/mypagepart/pointEmpty.jsp");
                }
            });

            $(document).on("click", "#notice", function () {
                if (false) {
                    $("#notice").attr("href", "${pageContext.request.contextPath}/mypagepart/noticeDetail.jsp");
                } else {
                    $("#notice").attr("href", "${pageContext.request.contextPath}/mypagepart/noticeEmpty.jsp");
                }
            });
        });
    </script>


</head>

<!-- header -->

<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"/>

<div class="shopTool">
    <div class="shopTool-detail">
        <span style="margin-left: 10px">홈&nbsp;>&nbsp;</span>
        <span>마이페이지&nbsp;>&nbsp;</span>
        <span id="pageName">포인트내역&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="${pageContext.request.contextPath}/informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="${pageContext.request.contextPath}/menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container">
            <h2>포인트내역</h2>
            <div class="menu-result-container-list"  style="margin: 0px">
                <table class="table table-striped">
                    <tr>
                        <th>번호</th>
                        <th>구매한 상품</th>
                        <th>적립/사용 포인트</th>
                        <th>포인트 적립일</th>
                        <th>포인트 사용일</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <th><a href="#">건식사료</a></th>
                        <th>2310p</th>
                        <th>2022.10.25</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>2</th>
                        <th><a href="#">습식사료</a></th>
                        <th>4310p</th>
                        <th>2022.10.25</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>3</th>
                        <th><a href="#">눈 영양제</a></th>
                        <th>-5310p</th>
                        <th></th>
                        <th>2022.10.25</th>
                    </tr>
                </table>
                <hr>
            </div>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>