<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

    <!-- ###############################################메인틀############################################### -->

    <link rel="stylesheet" href="${path}/css/myPage/myPage.css">

    <style>

        .updateElement {
            display: inline-block;
            margin: 10px;
        }

        .updateText {
            margin-left: 23px;
        }
    </style>
    <script src="${path}/js/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
            $(document).on("submit", "#userConfirm", function () {
                let userPwd = `${loginPwd}`;
                let inputPwd = $("#confirmPwd").val();
                if (userPwd == inputPwd) {
                    $("#userConfirm").attr("action", "../mypagepart/updateUserInformation.jsp");
                } else {
                    alert("비밀번호가 틀렸습니다 다시 입력해주세요");
                }
            });

            $(document).on("click", "#confirmCancel", function () {   
                location.href = "${path}/mypagepart/myInformation.jsp";
            });
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
        <span id="pageName">나의 정보 수정하기&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="../informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="../menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container">
            <h2>나의 정보 수정하기</h2>
            <div class="menu-result-container-list"  style="margin: 0px">
                <form action="" style="text-align: left; border: 1px solid gray; padding: 10px" id="userConfirm">
                    <span style="display: inline-block; margin: 10px">비밀번호 <input id="confirmPwd" type="text"></span><br>
                    <input class="btn btn-outline-secondary" value="확인" type="submit">
                    <input class="btn btn-outline-secondary" type="button" value="취소" id="confirmCancel">
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>
