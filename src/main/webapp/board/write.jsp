<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="../header.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/css/style.css">

<SCRIPT language=javascript>
    function checkValid() {
        var f = window.document.writeForm;

        /*	if ( f.model_num.value == "") {
                alert( "를 입력해 주세요." );
                f.model_num.focus();
                return false;
            }
            if ( f.model_name.value == "" ) {
                alert( "게시판 제목을 입력해 주세요." );
                f.model_name.focus();
                return false;
            }*/

        if (f.price.value == "") {
            alert("게시판 제목을 입력해 주세요");
            f.price.focus();
            return false;
        }

      /*  if (f.description.value == "") {
            alert("을 입력해 주세요.");
            f.description.focus();
            return false;
        }*/
        if (f.password.value == "") {
            alert("비밀번호를 입력해 주세요");
            f.password.focus();
            return false;
        }

        return true;
    }
</SCRIPT>


</HEAD>
<BODY>

<%
    request.setCharacterEncoding("UTF-8");
    String categoryCode = request.getParameter("categoryCode");
%>

<form name="writeForm" method="post" action="${path}/front?key=board&methodName=insertBoard&categoryCode=<%=categoryCode%>"
      onSubmit='return checkValid()' enctype="multipart/form-data">
    <div class="myPageMain">
        <div class="menuMain">
            <div class="menu-result-container" id="menu-result-container">
                <h2>글쓰기</h2>
                <div class="menu-result-container-list" style="margin: 0px">
                    <table class="table table-warning table-hover table-bordered" style="width: 900px; margin-top: 50px; margin-bottom: 50px" align="center">
                        <tr>
                            <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
                                <p align="center"><font color="black" size="5"><b> 게시판 글쓰기 </b></font></p>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px; height: 20px">
                                <p align="right"><b><span style="font-size:12pt;">제목</span></b></p>
                            </td>
                            <td style="width: 900px; height: 20px"><b><span style="font-size:9pt;"><input type=text name="boardTitle" size="50" style="font-size: 20px"></span></b>
                            </td>
                        </tr>
                        <tr>
                            <td width="150" height="20">
                                <p align="right"><b><span style="font-size:12pt;">글</span></b></p>
                            </td>
                            <td style="width: 900px; height: 30px">
                                <textarea name="boardContent" cols="60" rows="10"></textarea>
                            </td>
                        </tr>
<%--              파일담는게 없음 그래서 일단 주석으로빼놈
                        <tr>
                            <td width="150" height="20">
                                <p align="right"><b><span style="font-size:12pt;">*파일첨부</span></b></p>
                            </td>
                            <td width="450" height="20">
                                <b><span style="font-size:9pt;">
        		 <input type="file" name="boardFile" maxlength="60" size="40">
        	   </span></b>
                            </td>
                        </tr>
                        --%>
                        <tr>
                            <td width="450" height="20" colspan="2" >
                                <b><span style="font-size:9pt;">
                                    <div style="text-align: right">
                                        <input class="btn btn-outline-secondary" type=submit value=글쓰기><input class="btn btn-outline-secondary" type=reset value=다시쓰기>
                                    </div>
                                </span></b></td>
                        </tr>
                    </table>
                    <hr>
                    <div style="text-align: right">
                        <a class="btn btn-outline-secondary" href="${path}/front?key=board&methodName=categoryList&categoryCode=<%=categoryCode%>&pageNo=<%=request.getParameter("pageNo")%>">목록</a>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>

</form>



<jsp:include page="../footer.jsp"/>

