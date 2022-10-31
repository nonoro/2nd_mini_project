<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>mainPage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="${path}/assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <script language=javascript>
        function sendUpdate() {
            document.request.methodName.value = "updateForm";
            document.request.submit();
        }


        function sendDelete() {
            document.request.methodName.value = "deleteBoard";
            document.request.submit();
        }
    </script>

    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        .title {
            background-color: sandybrown;
        }

    </style>


</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="myPageMain">
    <div class="menuMain">
        <div class="menu-result-container" id="menu-result-container">
            <div class="menu-result-container-list" style="margin: 0px">
                <table class="table table-warning table-hover table-bordered"
                       style="width: 900px; margin-top: 50px; margin-bottom: 50px" align="center">
                    <tr>
                        <td colspan="4" align="center">
                            게시물 자세히보기
                        </td>
                    </tr>
                    <tr>
                        <td class="title" width="100" height="20">
                            제목
                        </td>
                        <td width="450" height="20" colspan="3">
                            ${board.boardTitle}
                        </td>
                    </tr>
                    <tr>
                        <td class="title" width="100" height="20">
                            등록일
                        </td>
                        <td width="300" height="20">
                            ${board.boardPostdate}
                        </td>
                        <td class="title" width="100" height="20">
                            조회수
                        </td>
                        <td width="100" height="20">
                            ${board.boardViews}
                        </td>
                    </tr>
                    <tr>
                        <td class="title" width="100" height="20">
                            작성자
                        </td>
                        <td width="450" height="20" colspan="3">
                            ${board.boardNick}
                        </td>
                    </tr>
                    <tr>
                        <td class="title" width="100" height="200" valign="top">
                            글
                        </td>
                        <!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
                        <td width="450" height="200" valign="top" colspan="3">
                            ${board.boardContent}
                        </td>
                    </tr>
                    <c:if test="${board.boardFile!=null}">
                        <tr>
                            <td width="100" height="20">
                                <p align="right"><b><span style="font-size:9pt;">다운로드</span></b></p>
                            </td>
                            <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>
        	<a href='${path}/downLoad?fileName=${board.boardFile}'>
                    ${board.boardFile}
            </a>
        </b></span>
                            </td>
                        </tr>
                    </c:if>


         <%--           <tr>
                        <td width="100" height="20">
                            <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
                        </td>

                        <td height="20" colspan="3" align="left" valign="middle">
                            <input type=password name="password" value="">
                        </td>
                    </tr>--%>


                    <tr>
                        <form name="request" method=post action="${path}/front">
                            <td height="20" colspan="4" align="center" valign="middle">
                                <!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
                                <input type=hidden name="boardCode" value="${board.boardCode}">
                                <input type=hidden name="key" value="board">
                                <input type=hidden name="methodName">
                                <input type=hidden name="categoryCode" value="<%=request.getParameter("categoryCode")%>">
                                <input type=hidden name="pageNo" value="${pageNo}">
                                <c:if test="${result == 1}">
                                <input class="btn btn-outline-secondary" type=button value="수정하기" onClick="sendUpdate()">
                                <input class="btn btn-outline-secondary" type=button value="삭제하기" onClick="sendDelete()">
                                </c:if>
                        </form>
                        </td>
                    </tr>
                </table>
                <hr>
                <div style="width: 50%; display: inline-block; margin-left: 24%; margin-right: auto; padding-left: 30px">
                        <h4>댓글</h4>
                            <c:choose>
                                <c:when test="${empty board.replies}">
                                    댓글정보가 없습니다.
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${board.replies}" var="reply">
                                        ${reply.userId}<br>
                                        ${reply.replyContent}<br>
                                        ${reply.replyRegDate}
                                        <hr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        <form id="replyContent" action="front" method="post">
                            <input type="hidden" name="key" value="reply">
                            <input type="hidden" name="methodName" value="insertReply">
                            <input type="hidden" name="categoryCode" value="${board.categoryCode}">
                            <input type="hidden" name="boardCode" value="${board.boardCode}">
                            <input type="hidden" name="pageNo" value="${pageNo}">
                            <input type="text" name="replyContent" style="width: 600px; height: 50px">
                            <button class="btn btn-outline-secondary" id="writeReply">댓글쓰기</button>
                        </form>
                </div>
                <hr>
                <div style="text-align: center">
                    <span style="font-size:9pt;">
                         <a class="btn btn-outline-secondary" href="${path}/front?key=board&methodName=categoryList&categoryCode=${board.categoryCode}&pageNo=${pageNo}">목록</a>
                    </span>
                </div>


            </div>
        </div>
    </div>
</div>






<jsp:include page="../footer.jsp"/>


</body>

</html>








