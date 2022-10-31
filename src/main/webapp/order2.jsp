<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
	<title>Order2</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		let totalprice = 0;
		let inputPoint = 0;
		let nf = Intl.NumberFormat();
		let userId = null;
		
		function refreshPage() {			
			let str = ""; 
			userId = sessionStorage.getItem("userId");
			
			for(let i=0; i < localStorage.length; i++) {
				let key = localStorage.key(i); 
				let value = localStorage.getItem(key); 

				//value의 값을 , 기준으로 분리
				let arr = value.split(",");
				let pro = arr[2];
				let total = arr[1] * pro; 

				str += `<tr>`;
				str += `<td><img src="${"${arr[1]}"}" class="poster"></td>`;
				str += `<td><strong>${"${arr[0]}"}</strong></td>`;
				str += `<td><strong>${"${arr[1]}"}개</strong></td>`;
				str += `<td><strong>${"${nf.format(total)}"}</strong>원`;
				
				//전송할 항목 만들기
				str+=`<input type="hidden" name="productCode" value='${"${key}"}'>`;
				str+=`<input type="hidden" name="productQty" value='${"${arr[1]}"}'>`;
				str+=`<input type="hidden" name="orderlinePrice" value='${"${arr[2]}"}'>`;
				str+=`<input type="hidden" name="orderTotalPrice" value='${"${arr[1]*arr[2]}"}'>`;
				str+=`<input type="hidden" name="productName" value='${"${arr[0]}"}'>`;
				str+=`<input type="hidden" name="userId" value='${"${userId}"}'>`;
				str += `</td>`;
				str += `</tr>`;
				
				//가격 누적
				totalprice += parseInt(arr[1] * arr[2]); 
			} //for문 끝

			//테이블에 추가
			$("#content").html(str);

			//가격 추가
			$("#price").html("<b>" + nf.format(totalprice) + "원 </b>");

			$("#pay").html("<b>" + nf.format((totalprice - inputPoint)) + "원</b>");
		} //함수 끝
		
		//총 결제 금액 반영하기
		function calTotal() {
			$("#pay").html("<b>" + nf.format((totalprice - inputPoint)) + "원</b>");
		}

		function checkValid() {
		    var f = window.document.orderForm;
		    
		    if(f.orderName.value == "") {
			    alert( "수령인을 입력해 주세요." );
			    f.orderName.focus();
				return false;
		    }
		    
		    if(f.orderPhone.value == "") {
			    alert( "연락처를 입력해 주세요." );
			    f.orderPhone.focus();
				return false;
		    }
				
			if(f.orderAddr.value == "") {
			    alert( "배송할 주소를 입력해 주세요." );
			    f.orderAddr.focus();
				return false;
		    }
			
			if(f.orderUsedPoint.value == "") {
			    alert( "사용할 포인트를 입력해 주세요." );
			    f.orderUsedPoint.focus();
				return false;
		    }
			
			return true;
		}
		
		$("[name=doPay]").click(function() { 
			if(!checkValid()) {
				return false;
			} else {
				alert("결제 완료되었습니다.");
				localStorage.clear();
			}
		});

		$("[name=doCancel]").click(function() { 
			//location.href= "${path}/cartList.jsp";
			location.href = history.back();
		});

		$("#orderUsedPoint").on("keyup", function() {
			let loginPoint = parseInt("${loginPoint}");
			
			inputPoint = parseInt($(this).val());
			
			if(inputPoint < 0) {
				$(this).val(0);
			} else if(inputPoint > loginPoint) {
				$(this).val(loginPoint);
			}
			
			calTotal();

		});
		
		refreshPage();

	}); //readyEnd
</script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="css/myPage/myPage.css">

<style>
	.order-box{
		margin: 0 auto;
		width: 80%;
	}

	th, td {
    	border-collapse: collapse;
    	height: 60px
	}

	.title{
		border-bottom: 2px solid red;
	}		
	
	.title2{
		border-bottom: 2px solid gray;
	}	

	.order-product-img{
		width: 100px;
	}

	.order-product-name{
		text-align: center;
	}

	.button-group{
		margin-top: 100px;
		margin-left: 620px;
	}
</style>
</head>

<body>
	<jsp:include page="header.jsp"/>
	<div class="shopTool">
    	<div class="shopTool-detail">
        	<span style="margin-left: 10px">홈&nbsp;>&nbsp;</span>
        	<span id="pageName">주문/결제&nbsp;</span>
    	</div>
	</div>

	<div class="container">
		<form name="orderForm" method="post" action="${path}/front">
	
		<input type="hidden" name="key" value="order">
		<input type="hidden" name="methodName" value="orderInsert">
	
	<table class="order-box">
		<tr>
			<td class="title2" colspan="4" ><h2>주문/결제</h2></td>
		</tr>

		<tr>
			<td class="title" colspan="4" ><h5>배송지 정보</h5></td>
		</tr>
		<tr>
			<td>받는 사람</td>
			<!--  -->
			<div class="order-recipient">
				<td colspan="3">
					<input class="form-control" type="text" id="orderName" name="orderName">
				</td>
			</div>
			<!--  -->
		</tr>
		
		<tr>
			<td>휴대전화</td>
			<!---->
			<div class="order-phone">
				<td colspan="3">
					<input class="form-control" type="text" id="orderPhone" name="orderPhone">
				</td>
			</div>
			<!---->
		</tr>
		<tr>
			<td>배송지 주소</td>
			<div class="order-adress">
				<td colspan="3">
					<input class="form-control" type="text" id="orderAddr" name="orderAddr">
				</td>
			</div>
		</tr>
		<tr>
			<td colspan="4">
				<div style="margin-bottom: 30px;"></div>
			</td>
		</tr>
		<tr>
			<td class="title" colspan="4"><h5>주문상품</h5></td>
		</tr>
		<tr><th></th><th>상품 이름</th><th>수량</th><th>가격</th></tr>
			<tbody id="content">
				<!-- 주문할 상품 목록 출력 --> 
			</tbody>
		<tr>
		</tr>
		<tr>
			<td colspan="4">
				<div style="margin-bottom: 30px;"></div>
			</td>
		</tr>
		<tr>
			<td class="title" colspan="4"><h5>포인트</h5></td>
		</tr>
		<tr>
			<td colspan="3">
				<label for="usedPoint" class="form-label">현재 보유 포인트: <strong> ${loginPoint} point</strong></label>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="text" class="form-control" id="orderUsedPoint" name="orderUsedPoint">
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<div style="margin-bottom: 30px;"></div>
			</td>
		</tr>
		<tr>
			<td class="title" colspan="4"><h5>최종 결제 금액</h5></td>
		</tr>
		<tr>
			<td>총 상품금액: </td>
			<td colspan="3">
				<!---->
				<div class="totalprice" id="price" name="orderTotalPrice" style=display:inline-block;></div>
			</td>
		</tr>
		<tr>
			<td>총 결제금액: </td>
			<td colspan="3">
				<!---->
				<div class="totalpay" id="pay" name="orderPay" style=display:inline-block;></div>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<div style="margin-bottom: 30px;"></div>
			</td>
		</tr>
		<tr>
			<td class="title" colspan="4"><h5>결제방법</h5></td>
		</tr>
		<tr>
			<td colspan="4">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="orderType" id="flexRadioDefault1" value="0">
  						<label class="form-check-label" for="flexRadioDefault1">
    						무통장 입금
  						</label>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="orderType" id="flexRadioDefault2" value="1" checked />
  						<label class="form-check-label" for="flexRadioDefault2">
    						신용 카드
  						</label>
				</div>
			</td>
		</tr>
	</table>

		<div class="button-group">
			<input type="submit" value="결제하기" name="doPay"> &nbsp;&nbsp;&nbsp;
			<!-- <input type="submit" value="취소하기" name="doCancel"> -->
		</div>	
	</form>
	
	</div>

	<jsp:include page="footer.jsp"/>
</body>
</html>