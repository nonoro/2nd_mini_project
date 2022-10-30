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
        <span id="pageName">공지사항&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="${pageContext.request.contextPath}/informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="${pageContext.request.contextPath}/menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container">
            <h2>공지사항</h2>
            <div class="menu-result-container-list" style="margin: 0px">
                <table class="table table-striped">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <th><a href="noticeDetail.jsp">견수무강 하세요</a></th>
                        <th>아이폰12mini</th>
                        <th>2022.10.25</th>
                        <th>2</th>
                    </tr>
                    <tr>
                        <th>2</th>
                        <th><a href="noticeDetail.jsp">산넘어산</a></th>
                        <th>아이폰14Pro</th>
                        <th>2022.10.25</th>
                        <th>3</th>
                    </tr>
                    <tr>
                        <th>3</th>
                        <th><a href="noticeDetail.jsp">오늘의 저녁은?</a></th>
                        <th>전기장판</th>
                        <th>2022.10.25</th>
                        <th>4</th>
                    </tr>
                </table>
                <hr>
                <div class="text-center">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>