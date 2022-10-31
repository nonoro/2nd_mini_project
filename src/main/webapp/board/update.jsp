<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>
<jsp:include page="../header.jsp"/>

<HTML>
<HEAD>
<link rel="stylesheet" href="${path}/css/style.css">

<SCRIPT >
function checkValid() {
	var f = window.document.updateForm;
	if ( f.boardTitle.value == "" ) {
		alert( "제목을 입력해 주세요." );
		f.boardTitle.focus();
		return false;
	}
/*	if ( f.price.value == "" ) {
		alert( "가격을 입력해 주세요." );
		f.price.focus();
		return false;
	}
	if ( f.description.value == "" ) {
        alert( "상품 설명을 입력해 주세요." );
        f.description.focus();
        return false;
    }
	if ( f.password.value == "" ) {
        alert( "비밀번호를 입력해 주세요" );
        f.password.focus();
        return false;
    }*/


}

</SCRIPT>

</HEAD>

<BODY>


<%--
원래 get방식으로 보내면 action에 ${path}/front?key=elec&methodName=update 이렇게 모든정보를 써주지만 post방식으로 보내면
action에 쓴 key=elec&methodName=update얘내들을 hidden으로 숨겨서 보낼 수 있음 그래서 이걸 받는 곳 Dispatcher에서
request.getParameter("key")를 하면 거기 값에 elec가 나오고 나머지도 그렇게됨
--%>
<form name=updateForm method=post action="${path}/front" onSubmit="return checkValid()">
    <input type="hidden" name="key" value="board" >
    <input type="hidden" name="methodName" value="updateBoard" >
    <input type='hidden' name='modelNum' value="${boardCode}">
    <input type='hidden' name='pageNo' value="${pageNo}">
    <input type=hidden name="categoryCode" value="${board.categoryCode}">
    <input type=hidden name="boardCode" value="${board.boardCode}">
    <table class="table table-warning table-hover table-bordered"style="width: 900px; margin-top: 50px; margin-bottom: 50px" align="center">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="black" size="3"><b>  게시물 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td style="width: 150px; height: 20px">
            <p align="right"><b><span style="font-size:12pt;">제목</span></b></p>
        </td>
        <td style="width: 900px; height: 20px"><b><span style="font-size:9pt;">
		    <input type=text name="boardTitle" size="50" style="font-size: 20px" value="${board.boardTitle}">
            </span></b></td>
        </td>
    </tr>
    <tr>
        <td style="width: 150px; height: 20px">
            <p align="right"><b><span style="font-size:12pt;">글</span></b></p>
        </td>
        <td style="width: 900px; height: 30px">
            <b><span style="font-size:9pt;"><textarea name="boardContent" cols="50" rows="10">${board.boardContent}</textarea></span></b></td>
        </td>

    </tr>
<%--    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;"><input type=password name="password" size="12">
            (비밀번호가 맞아야 수정이 가능합니다.)</span></b></td>
    </tr>--%>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
        <div style="text-align: right">
		    <input class="btn btn-outline-secondary" type="submit" value="수정하기"> <input class="btn btn-outline-secondary" type="reset" value="다시쓰기"></span></b></td>
        </div>
    </tr>
</table>
    <hr>
    <div style="text-align: right">
        <a class="btn btn-outline-secondary" href="${path}/front?key=board&methodName=categoryList&categoryCode=${board.categoryCode}&pageNo=${pageNo}">목록</a>
    </div>
</form>

<jsp:include page="../footer.jsp"/>








