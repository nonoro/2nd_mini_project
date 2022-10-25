<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 규 테스트중 </h1>
	<a href="${path }/front?key=product&methodName=selectAll"> 리스트 </a>

	<c:forEach items="${list}" var="d">
${d.productCode} 
</c:forEach>

	<a href="${path}/front?key=product&methodName=selectByProductName&productName=${selectByName.productName}">
		상품이름 값</a> ${selectByName.productName} ${selectByName.productPrice}

	/////////////////////////////////////////////////////////////////////////////////////첨부파일있으면 멀티파트써 지으느으은
	<form name="writeForm" method="post"
		action="${path}/front?key=product&methodName=insert"
		enctype="multipart/form-data">
		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="1">
			<tr>
				<td width="1220" height="20" colspan="2" bgcolor="#00cc00">
					<p align="center">
						<font color="white" size="3"><b> 상품 등록 </b></font>
					</p>
				</td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;"> 상품코드</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="productCode" size="30"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">카테고리</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="productCategory" size="30"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">모델이름</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="productName" size="30"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">가격</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="productPrice" size="50"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">수량</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text name="productQty"
							size="50"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">설명</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <textarea name="productExplain"
								cols="50" rows="10"></textarea></span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*파일첨부</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="file" name="fname"
							maxlength="60" size="40">
					</span></b></td>
			</tr>

			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"><input type=submit value=글쓰기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>
	</form>
	/////////////////////////////////////////////////////////////////////////////////////첨부파일 없으면 이거 써 

	<form name="writeForm" method="post"
		action="${path}/front?key=product&methodName=update">
		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="1">
			<tr>
				<td width="1220" height="20" colspan="2" bgcolor="#00cc00">
					<p align="center">
						<font color="white" size="3"><b> 상품 수정 </b></font>
					</p>
				</td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;"> 상품코드</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="productCode" size="30"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">상품이름</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="productName" size="30"></span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">가격</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="productPrice" size="50"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">수량</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text name="productQty"
							size="50"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">설명</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <textarea name="productExplain"
								cols="50" rows="10"></textarea></span></b></td>
			</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"><input type=submit value=글쓰기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>
	</form>
<a href="${path }/front?key=product&methodName=monthlySalesByCode&productCode=1&orderDate=10/">상품코드별 월별판매통계 </a><br>
${monthlyTotal }<br>

<a href="${path }/front?key=product&methodName=yearlySalesByCode&productCode=2&orderDate=22/">상품코드별 년별판매통계 </a><br>
${yearlyTotal }<br>
<a href="${path }/front?key=product&methodName=selectByarrange&arrange=2"> 주문많은거만 </a><br>
${selectByarrange}

<a href="${path }/front?key=product&methodName=productSelectByCategorytop&productCategory=1"> 대분류 </a><br>
${cateList}</p>
<c:forEach items="${cateList}" var="ca">
${ca.productName}
</c:forEach>


<br>

<a href="${path }/front?key=product&methodName=productSelectByCategorybottom&productCategory=1001"> 중분류 </a><br>
${cateList2}<br>
<br><br><br><br><br>
<form name="writeForm" method="post"
		action="${path}/front?key=order&methodName=orderInsert">
		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="1">
			<tr>
				<td width="1220" height="20" colspan="2" bgcolor="#00cc00">
					<p align="center">
						<font color="white" size="3"><b> 주문하기 </b></font>
					</p>
				</td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">d 아이디</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="userId" size="30"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">d 주소</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="orderAddr" size="30"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">d 결제방법</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="orderType" size="30"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">포인사용액</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text
							name="orderUsedPoint" size="30"></span></b></td>
			</tr>
			
			
			
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"><input type=submit value=글쓰기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>
	</form>
	
	<br><br><br><br><br><br>
	

</body>
</html>