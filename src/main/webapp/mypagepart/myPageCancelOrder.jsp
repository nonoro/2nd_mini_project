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
    <link href="${path}/assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- ###############################################mypage############################################### -->

    <link rel="stylesheet" href="${path}/css/myPage/myPage.css">
    <script src="${path}/js/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
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

<body style="background-color: rgba(255,241,193,1)">
<jsp:include page="../header.jsp"/>

<div class="shopTool">
    <div class="shopTool-detail">
        <span style="margin-left: 10px">홈&nbsp;>&nbsp;</span>
        <span>마이페이지&nbsp;>&nbsp;</span>
        <span id="pageName">주문취소&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="../informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="../menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container">
            <h2>주문취소</h2>
            <hr class="menu-result-list-hr">
            <div class="menu-result-container-list" style="margin-left: 0; width: 78%;">
                <div class="okMenuList">
                    <div>
                        <img src="${path}/img/logo.png" style="width: 150px; height: 150px;" alt="">
                    </div>
                    <div class="menu-result-content" style="text-align: left;">
                        <div>눈에좋고 다리에좋고 몸에좋은 건식사료 외 2종</div>
                        <div>총액 : 30,000원&nbsp;&nbsp;&nbsp;&nbsp;결제일: 22.10.25</div>
                    </div>
                    <div class="menu-result-review">
                        <div><a href="#" class="btn btn-outline-secondary" id="writeReview">취소하기</a></div>
                    </div>
                </div>
            </div>
            <hr class="menu-result-list-hr">
            <div class="menu-result-container-list" style="margin-left: 0; width: 78%;">
                <div class="okMenuList">
                    <div>
                        <img src="${path}/img/logo.png" style="width: 150px; height: 150px;" alt="">
                    </div>
                    <div class="menu-result-content" style="text-align: left;">
                        <div>눈에좋고 다리에좋고 몸에좋은 건식사료 외 2종</div>
                        <div>총액 : 30,000원&nbsp;&nbsp;&nbsp;&nbsp;결제일: 22.10.25</div>
                    </div>
                    <div class="menu-result-review">
                        <div><a href="#" class="btn btn-outline-secondary" id="writeReview">취소하기</a></div>
                    </div>
                </div>
            </div>
            <hr class="menu-result-list-hr">
            <div class="menu-result-container-list" style="margin-left: 0; width: 78%;">
                <div class="okMenuList">
                    <div>
                        <img src="${path}/img/logo.png" style="width: 150px; height: 150px;" alt="">
                    </div>
                    <div class="menu-result-content" style="text-align: left;">
                        <div>눈에좋고 다리에좋고 몸에좋은 건식사료 외 2종</div>
                        <div>총액 : 30,000원&nbsp;&nbsp;&nbsp;&nbsp;결제일: 22.10.25</div>
                    </div>
                    <div class="menu-result-review">
                        <div><a href="#" class="btn btn-outline-secondary" id="writeReview">취소하기</a></div>
                    </div>
                </div>
            </div>
            <hr class="menu-result-list-hr">
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>