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
<body style="background-color: rgba(255,241,193,1)">
<jsp:include page="../header.jsp"/>
<div class="shopTool">
    <div class="shopTool-detail">
        <span style="margin-left: 10px">???&nbsp;>&nbsp;</span>
        <span>???????????????&nbsp;>&nbsp;</span>
        <span id="pageName">????????????&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="../informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="../menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container">
            <main>
                <h2 style="margin-bottom: 30px; font-size: 28px;">????????????</h2>
                <h3 style="margin: 12px 0px 10px; padding: 0 0 14px 0; font-size: 18px;">?????? ??????</h3>
                <div class="myInformation">
                    <span style="margin-right: 30px;">???????????????</span>
                    <span>${loginDogName}</span>
                </div>
                <div class="myInformation">
                    <span style="margin-right: 30px;">???????????????</span>
                    <span>${loginDogBirthday}</span><br>
                </div>
                <div class="myInformation">
                    <span style="margin-right: 58px;">?????????</span>
                    <span>${loginEmail}</span><br>
                </div>
                <div class="myInformation">
                    <span style="margin-right: 30px;">???????????????</span>
                    <span>${loginPhone}</span><br>
                </div>
                <div class="myInformation">
                    <span style="margin-right: 71px;">??????</span>
                    <span>${loginAddr}</span><br>
                </div>
                <div class="myInformation">
                    <span style="margin-right: 58px;">?????????</span>
                    <span>${loginPoint}</span><br>
                </div>
                <div style="margin: 30px 0;">
                    <a class="btn btn-outline-secondary" href="updateUserConfirm.jsp" id="update">????????????</a>
                </div>
            </main>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>

</html>