<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

    <%--    <link rel="stylesheet" href="${path}/css/style.css">--%>


    <style>
        @import url("https://fonts.googleapis.com/css?family=Roboto:400,300");

        /*body {*/
        /*    color: #2c3e50;*/
        /*    font-family: 'Roboto', sans-serif;*/
        /*    font-weight: 400;*/
        /*}*/

        /*h1 {*/
        /*    text-align: center;*/
        /*    font-size: 2.5rem;*/
        /*    font-weight: 300;*/
        /*}*/

        .pagination-container {
            margin: 100px auto;
            text-align: center;
        }

        .pagination {
            position: relative;
        }

        .pagination a {
            position: relative;
            display: inline-block;
            color: #2c3e50;
            text-decoration: none;
            font-size: 1.2rem;
        }

        .pagination a:before {
            z-index: -1;
            position: absolute;
            height: 100%;
            width: 100%;
            content: "";
            top: 0;
            left: 0;
            background-color: #2c3e50;
            border-radius: 24px;
            -webkit-transform: scale(0);
            transform: scale(0);
            transition: all 0.2s;
        }

        .pagination a:hover, .pagination a .pagination-active {
            color: #fff;
        }

        .pagination a:hover:before, .pagination a .pagination-active:before {
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .pagination .pagination-active {
            color: #fff;
        }

        .pagination .pagination-active:before {
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .pagination-newer {
            margin-right: 50px;
        }

        .pagination-older {
            margin-left: 50px;
        }

        /*img {*/
        /*    width: 200px;*/
        /*    height: 350px*/
        /*}*/

        th td {
            text-align: center;
        }

        /*img{width:200px; height:350px}*/
    </style>


    <script src="${path}/js/jquery-3.6.0.min.js"></script>


</head>


<body>
<jsp:include page="../header.jsp"/>

<div class="myPageMain">
    <div class="menuMain">
        <div class="menu-result-container" id="menu-result-container">
            <h2 style="margin-top: 20px; text-align: center ">자유게시판</h2>
            <div class="menu-result-container-list" style="margin: 0 220px">
                <table class="table table-striped">
                    <tr>
                        <th>게시글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                    <c:choose>
                        <c:when test="${empty requestScope.boards}">
                            <tr>
                                <td colspan="5">
                                    <p align="center"><b><span style="font-size:9pt;">등록된 게시글이 없습니다.</span></b></p>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.boards}" var="board">
                                <tr>
                                    <td>${board.boardCode}</td>
                                    <td>
                                        <a href="${path}/front?key=board&methodName=selectByBoardCode&boardCode=${board.boardCode}&pageNo=${pageNo}&categoryCode=${board.categoryCode}">
                                                ${board.boardTitle}</a>
                                    </td>
                                    <td>${board.boardNick}</td>
                                    <td>${board.boardPostdate}</td>
                                    <td>${board.boardViews}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>

                <div style="text-align: right" >
                    <a class="btn btn-outline-secondary" href="${path}/board/write.jsp?&pageNo=${pageNo}&categoryCode=${categoryCode}">글쓰기</a><br>
                </div>
                <hr color="red">

                <%-- jq 라이브러리 쓰면 다 함수가 있음 --%>
                <%--pageCnt 객체 생성--%>
                <jsp:useBean class="kosta.paging.PageCnt" id="p"/>
<%--                \${p.pageCnt} = ${p.pageCnt} / \${p.blockcount} = ${p.blockcount} <p>--%>

                <!--  블럭당  -->
                <nav class="pagination-container">
                    <div class="pagination" style="text-align: center; display: inline-block">
                        <%--c:set 변수선언--%>
                        <%--doneLoop는 break가 없는 forEach에게 break 역할을 해줌--%>
                        <c:set var="doneLoop" value="false"/>
                        <c:set var="temp" value="${(pageNo-1) % p.blockcount}"/>
                        <!-- (1-1)%2   , (2-1)%2    1 , (3-1)%2  0 -->
                        <c:set var="startPage" value="${pageNo - temp}"/> <!--   1- 1 -->

<%--                        \${pageNo} = ${pageNo} , \${temp}=${temp} , \${startPage}=${startPage} , <br>--%>

                        <c:if test="${(startPage-p.blockcount) > 0}"> <!-- (-2) > 0 -->
                            <a class="pagination-newer btn btn-secondary" style="margin-right: 10px"
                               href="${path}/front?key=board&methodName=categoryList&pageNo=${startPage-1}&categoryCode=${categoryCode}">PREV</a>
                        </c:if>

                        <span class="pagination-inner">
                            <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+p.blockcount}'>
                      <%--만약 전체페이지(i-1)가 마지막페이지p.pageCnt보다 커지면--%>
                      <c:if test="${(i-1)>=p.pageCnt}">
                          <c:set var="doneLoop" value="true"/>
                      </c:if>
                      <c:if test="${not doneLoop}">
                          <a class="${i==pageNo?'pagination-active':page} btn btn-secondary"
                             href="${path}/front?key=board&methodName=categoryList&pageNo=${i}&categoryCode=${categoryCode}">${i}</a>
                      </c:if>
                  </c:forEach>
				</span>
                        <c:if test="${(startPage+p.blockcount)<=p.pageCnt}">
                            <a class="pagination-older btn btn-secondary" style="margin-left: 10px"
                               href="${path}/front?key=board&methodName=categoryList&pageNo=${startPage+p.blockcount}&categoryCode=${categoryCode}">NEXT</a>
                        </c:if>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"/>

</body>
</html>