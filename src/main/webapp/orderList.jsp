<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		let userId = sessionStorage.getItem("userId");

		$("[name=delete]").on("click", function() { 
			if(confirm("주문 취소하시겠습니까?")) {

				location.href ="${path}/front?key=order&methodName=orderCancel&userId="+userId+"&orderCode="+$(this).attr("id")

			}
		})
	})
</script>

</head>
<body>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption><h2 align="center">Order LIST</h2></caption>
<colgroup>
		<col width="15%"/>
		<col width="30%"/>
		<col width="16%"/>
		<col width="16%"/>
		<col width="7%"/>
		<col width="7%"/>
		<col width="7%"/>
	</colgroup>
	
	<tr>
        <td bgcolor="#00cc00">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">주문 코드</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">주문 날짜</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">배송지</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">주문 상태</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">주문 금액</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">총 결제 금액</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">주문 취소</span></b></font></p>
        </td>
    </tr>
    
	<c:forEach items="${orderList}" var="order">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        
		        <%-- <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${order.orderCode}</span></p>
		        </td> --%>
		        <input type="hidden" name="userId" value='${"${userId}"}'>
		        <td bgcolor="">
					<p align="center"><span style="font-size:9pt;">
					<a href="${path}/front?key=order&methodName=selectOrderLineByOrderCode&orderCode=${order.orderCode}">
					  ${order.orderCode}
					</a>
					</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${order.orderDate}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${order.orderAddr}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${order.orderComplete}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <fmt:formatNumber value="${order.orderTotalPrice}"/></span></p>
		        </td>
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <fmt:formatNumber value="${order.orderPay}"/></span></p>
		        </td>
				<td bgcolor="">
					<button tabindex="0" type="button" name="delete" id="${order.orderCode}">
		           	<span>주문 취소</span>
                    </button>
		        </td>
		        
		    </tr>
    </c:forEach>
</table>

</body>
</html>