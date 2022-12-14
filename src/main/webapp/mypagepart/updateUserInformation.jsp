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

            <form action="${path}/front" method="post" style="text-align: left; border: 1px solid gray; padding: 10px" >
                <input type="hidden" name="key" value="user">
                <input type="hidden" name="methodName" value="update">

                <span class="updateElement">강아지이름 :</span><span class="updateText" style="margin-left: 12px"><input type="text" name="changedDogName" value="${loginDogName}"></span><br>
                <span class="updateElement">강아지생일 :</span><span class="updateText" style="margin-left: 12px"><input type="text" name="changedDogBirthday" value="${loginDogBirthday}"></span><br>
                <span class="updateElement">이메일 :</span><span class="updateText" style="margin-left: 39px"><input type="text" name="changedEmail" value="${loginEmail}"></span><br>
                <span class="updateElement">핸드폰번호 :</span><span class="updateText" style="margin-left: 13px"><input type="text" name="changedPhone" value="${loginPhone}"></span><br>
                <span class="updateElement">주소 :</span><span class="updateText" style="margin-left: 54px"><input type="text" name="changedAddr" value="${loginAddr}"></span><br>
                <span class="updateElement">변경비밀번호 :</span><span class="updateText" style="margin-left: 0px;"><input type="text" name="changedPwd"></span><br>
                <span class="updateElement">프로필 :</span><span class="updateText" style="margin-left: 40px"><input class="btn btn-outline-secondary" name="changedProfile" type="file" style="width: 250px"></span><br>
                <input class="btn btn-outline-secondary" type="submit" value="회원수정" style="margin: 10px 0 0 5px">
                <input class="btn btn-outline-secondary" type="reset" value="초기화" style="margin: 10px 0 0 5px">
            </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>
