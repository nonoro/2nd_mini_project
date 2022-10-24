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

	<a href="${path}/front?key=product&methodName=selectByProductCode&productCode=1">
		상품이름 값</a> ${productCode.productName} ${productCode.productPrice}

	/////////////////////////////////////////////////////////////////////////////////////첨부파일있으면 멀티파트써 재덕
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
	/////////////////////////////////////////////////////////////////////////////////////첨부파일 없으면 이거 써 재덕 

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
<a href="${path }/front?key=product&methodName=selectByarrange&arrange=1"> 주문많은거만 </a><br>
${selectByarrange}
</body>
</html>