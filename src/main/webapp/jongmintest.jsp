<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<SCRIPT language=javascript>
function checkValid() {
    var f = window.document.writeForm;
		
	if ( f.reviewCode.value == "") {
	    alert( "모델번호를 입력해 주세요." );
	    f.reviewCode.focus();
		return false;
    }
	if ( f.userId.value == "" ) {
		alert( "모델이름을 입력해 주세요." );
		f.userId.focus();
		return false;
	}
	if ( f.productCode.value == "" ) {
		alert( "가격을 입력해 주세요." );
		f.productCode.focus();
		return false;
	}
	if ( f.reviewGrade.value == "" ) {
        alert( "상품 설명을 입력해 주세요." );
        f.reviewGrade.focus();
        return false;
    }
	if ( f.reviewDetail.value == "" ) {
        alert( "비밀번호를 입력해 주세요" );
        f.reviewDetail.focus();
        return false;
    }
	if ( f.reviewPostdate.value == "" ) {
        alert( "비밀번호를 입력해 주세요" );
        f.reviewPostdate.focus();
        return false;
    }
	if ( f.File.value == "" ) {
        alert( "비밀번호를 입력해 주세요" );
        f.File.focus();
        return false;
    }
	
	
    return true;
}
</SCRIPT>
</head>
<body>
<h2> jongmin test</h2>

<h2>order</h2>
<a href="${path}/front?key=order&methodName=selectState&orderCode=2">order.selectState</a><br>
state = ${orderState}<p>

<h2>review</h2>
<a href="${path}/front?key=review&methodName=insert">review.insert</a><br>
<form form name="writeForm" method="post" action="${path}/front?key=review&methodName=insert" 
  onSubmit='return checkValid()' enctype="multipart/form-data">
  <table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 리뷰등록 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">리뷰코드</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="reviewCode" size="30"></span></b></td>
    </tr>
    <tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">유저아이디</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userId" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">상품코드</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="productCode" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">별점</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="reviewGrade" size="50"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">리뷰내용</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="reviewDetail" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">작성날짜</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="reviewPostdate" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    
     <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">*파일첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		 <input type="file" name="file" maxlength="60" size="40">
        	   </span></b>
        </td>
    </tr>
    
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=리뷰쓰기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>
</form><br>


<a href="${path}/front?key=review&methodName=selectAll&userId=A1&productCode=1">order.selectAll</a><br>
list = ${list}<br>





<a href="${path}/front?key=review&methodName=update">review.update</a><br>
<form form name="writeForm" method="post" action="${path}/front?key=review&methodName=update" 
  onSubmit='return checkValid()'>
  <table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 리뷰수정 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">리뷰코드</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="reviewCode" size="30"></span></b></td>
    </tr>
    <tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">유저아이디</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userId" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">상품코드</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="productCode" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">별점</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="reviewGrade" size="50"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">리뷰내용</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="reviewDetail" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">작성날짜</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="reviewPostdate" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    
     <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">*파일첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		 <input type="file" name="file" maxlength="60" size="40">
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=리뷰쓰기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>
</form><br>

<a href="${path}/front?key=review&methodName=delete&reviewCode=4">order.delete</a><br>
state = <p>



<h2>user</h2>


<a href="${path}/front?key=user&methodName=login">user.login</a><br>
<c:choose>
	<c:when test="${empty loginUser}">
		<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/front">
			<input type="hidden" name="key" value = "user" /> <!-- Controller를 찾는 정보 -->
			<input type="hidden" name="methodName" value = "login" />  <!-- 메소드이름 -->
			<fieldset>
				<legend>Login</legend>
				<div class="form-group">
					<label for="userId" class="col-lg-2 control-label">User Id</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="userId" name="userId"
							placeholder="userId">
					</div>
				</div>
				<div class="form-group">
					<label for="pwd" class="col-lg-2 control-label">Password</label>
					.<div class="col-lg-10">
						<input type="password" class="form-control" id="pwd" name="pwd"
							placeholder="password">
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-default">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</fieldset>
		</form>
	</c:when>
	<c:otherwise>
			<legend>Login</legend>
			<blockquote>
				<p>My Shopping Mall!</p>

				<div class="alert alert-dismissible alert-warning">
					<button type="button" class="close" data-dismiss="alert">Ã</button>
					<h4>Welcome!</h4>
					<p>
						<a href="#" class="alert-link">${loginUser} / ${loginName}</a>.
					</p>
				</div>
			</blockquote>
	</c:otherwise>
</c:choose>
${sessionScope.loginUser}//${sessionScope.loginPwd}//${sessionScope.loginDogName}

<a href="${path}/front?key=user&methodName=logout">user.logout</a><br>

<a href="${path}/front?key=user&methodName=join">user.join</a><br>
<form form name="writeForm" method="post" action="${path}/front?key=user&methodName=join" 
  onSubmit='return checkValid()'>
  <table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 회원등록 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">아이디</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userId" size="30"></span></b></td>
    </tr>
    <tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userPwd" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">이메일</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userEmail" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">주소</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="userAddr" size="50"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">폰번</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="userPhone" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">강쥐이름</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="dogName" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">강쥐생일</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="dogBirthday" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=리뷰쓰기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>
</form><br>

<a href="${path}/front?key=user&methodName=update">user.UPDATE</a><br>
<form form name="writeForm" method="post" action="${path}/front?key=user&methodName=updatePwd&userId=${sessionScope.loginUser}&userPwd=${sessionScope.loginPwd}" 
  onSubmit='return checkValid()'>
  <table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 비번업뎃 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">newPwd</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="newPwd" size="30"></span></b></td>
    </tr> 
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=수정하기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>
</form><br>

<a href="${path}/front?key=user&methodName=selectPoint">user.selectPoint</a><br>
${userPonint}원<p>

<a href="${path}/front?key=user&methodName=searchId">user.searchId</a><br>
<form form name="writeForm" method="post" action="${path}/front?key=user&methodName=searchId" 
  onSubmit='return checkValid()'>
  <table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 아이디찾기 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">가입전화번호</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userPhone" size="30"></span></b></td>
    </tr> 
     <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">가입이메일</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userEmail" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=작성완료> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>
</form><br>
찾은 아이디 : ${searchId}<br>

<a href="${path}/front?key=user&methodName=searchPwd">user.searchPwd</a><br>
<form form name="writeForm" method="post" action="${path}/front?key=user&methodName=searchPwd" 
  onSubmit='return checkValid()'>
  <table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 비번찾기 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">가입아이디</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userId" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">가입전화번호</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userPhone" size="30"></span></b></td>
    </tr> 
     <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">가입이메일</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="userEmail" size="30"></span></b></td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=작성완료> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>
</form><br>
찾은 비번 : ${searchPwd}<br>



</body>
</html>