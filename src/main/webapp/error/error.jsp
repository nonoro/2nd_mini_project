<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<jsp:include page="${pagecontext.request.contextpath}/header.jsp"/>

<script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>

<div class="container">
	<div class="col-lg-8 col-lg-offset-2 text-center" style="margin-left: 17%; margin-top: 100px">
		<div class="logo">
			<h1>Error !</h1>
		</div>
		<p class="lead text-muted">${errorMsg} </p>
		<div class="clearfix"></div>
		
		<div class="clearfix"></div>
		<br />

		<c:choose>
		  <c:when test="${empty loginUser}">
		  <div>
			<div class="btn-group btn-group-justified">
				<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/mypagepart/signIn.jsp" class="btn btn-primary">로그인</a>
				<a class="btn btn-outline-success" href="${pageContext.request.contextPath}/index.jsp" class="btn btn-success">메인으로</a>
			</div>
		  </div>
		  </c:when>
		  <c:otherwise>
		  <div>
			<div class="btn-group btn-group-justified">
				<a class="btn btn-outline-success" href="${pageContext.request.contextPath}/index.jsp" class="btn btn-success">메인으로</a>
				<a class="btn btn-outline-danger" href="javascript:history.back()" class="btn btn-success">뒤로가기</a>
			</div>
		  </div>
		  </c:otherwise>
		</c:choose>	
	</div>
</div>


<jsp:include page="${pagecontext.request.contextpath}/footer.jsp"/>