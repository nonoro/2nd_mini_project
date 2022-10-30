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
	<title>Cart LIST</title>

<link  rel="stylesheet" type="text/css" href="css/basic.css"  />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<style type="text/css">
	.poster {
		width : 150px;
		height : 150px;
	}

	a{text-decoration: none}

	td {text-align: center;}
</style>

<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		function refreshPage() {
			let str = ""; 
			let toalprice = 0;
			
			for(let i=0; i < localStorage.length; i++) {
				let key = localStorage.key(i); 
				let value = localStorage.getItem(key); 

				//value의 값을 , 기준으로 분리
				let arr = value.split(",");

				str += `<tr>`;
				str += `<td><img src="${arr[1]}" class="poster"></td>`;
				str += `<td>${"${arr[0]}"}</td>`;
				str += `<td>
						<button class="minus" tabindex="0" type="button" name="minus" id="${"${key}"}">
                			<span class="minus">&nbsp;-&nbsp;</span>
                		</button>
                		<input type="text" inputmode="decimal" value="${"${arr[1]}"}" size='3'>
                		<button class="plus" tabindex="0" type="button" name="plus" id="${"${key}"}">
                			<span class="plus">&nbsp;+&nbsp;</span>
                		</button>
						</td>`; 
				str += `<td>${"${arr[2]}"}</td>`;
				str += `<td><span id="proPrice">${"${arr[1]*arr[2]}"}</span></td>`;
				str += `<td><button type='button' id="${"${key}"}" name='delItem'>삭제</button></td>`; 
				str += `</tr>`;

				//가격 누적
				toalprice += parseInt(arr[1]*arr[2]); 

			} //for문 끝

			//테이블에 추가
			if(str != "") {
				$("#content").html(str);
			} else {
				$("#content").html("<p>장바구니가 비었습니다.<p>");
			}

			//가격 추가
			$("#price").html("<b>주문 가격: " + toalprice + "원</b>");	
			
	}//refresh 끝
	
	////////////////////////////////////////////////////////////////////////
	//수량 늘리기
	$(document).on("click","[name=plus]", function(){
		//text박스 기존값에서 +1 
		$(this).prev().val(parseInt($(this).prev().val()) + 1);
		  
		//값 * 단가
		let total_price = parseInt($(this).prev().val()) * parseInt($(this).parent().next().text());
		 
		$(this).parent().next().next().text(total_price);
		 
		//이름가져오기
		let pname= $(this).parent().prev().text();
		  
		sessionChange( $(this) , pname ,  $(this).prev().val() , $(this).parent().next().text() ); //key 전달, 이름, 수량 
		 
	  });
	
	  //수량감소하기 
      $(document).on("click","[name=minus]", function(){
    	  //text박스 기존값에서 +1 
    	  let no =  parseInt($(this).next().val());
    	  if(no==1){
    		  alert("1 이상을 선택해..")
    		  return;
    	  }
    	 
    	  $(this).next().val(no -1);
		  
		  //총금액 변경
		  let total_price = parseInt($(this).next().val()) * parseInt($(this).parent().next().text());
		  $(this).parent().next().next().text(total_price);
		  
		  //이름가져오기
		  let pname= $(this).parent().prev().text();
		  
		  sessionChange($(this), pname, $(this).next().val() , $(this).parent().next().text()); //key, 수량, 단가
		 
	  });//minusEnd
	  
	  function sessionChange(th, name , qty , price){
		 let key = th.attr("id");
		 
		 console.log(th.attr("id"));
		 let value= name + "," + qty + "," + price
		 
		 localStorage.setItem(key, value);
		 
		 totalCheck();//총금액 변경하기 
	  }
	  
	  function totalCheck(){
		  let toalprice = 0;
		  for(let i=0; i < localStorage.length; i++) {
			  let key = localStorage.key(i); 
			  let value = localStorage.getItem(key); 

			  //value의 값을 , 기준으로 분리
			  let arr = value.split(",");

			  //가격 누적
			  toalprice += parseInt(arr[1]*arr[2]); 
			} //for문 끝
		  $("#price").html("<b>주문 가격: " + toalprice + "원</b>");
	  }
	  
	  //////////////////////////////////////////////////////
	  //개별 삭제하기
	  $(document).on("click", "[name=delItem]" ,function(){
		  if(confirm("삭제하시겠습니까?")) {
			  let key = $(this).attr("id");
			  let value = localStorage.getItem(key);
			  localStorage.removeItem(key, value);
			  
			  refreshPage();
			}
	   });
	  
	  //전체 삭제하기
	  $(document).on("click", "[name=delAllItem]", function() { 
		  if(confirm("전체 삭제하시겠습니까?")) {
			  localStorage.clear();
				
			  refreshPage();
		  }
	  }); //삭제 끝

	 ////////////////////////////////////////	 

	 refreshPage();
		
	});//readyEnd
</script>

</head>
<body>
	<jsp:include page="header.jsp"/>

	<div class="menu-result-container" id="menu-result-container">
		<div>
			<h2>장바구니</h2>
			<hr class="menu-result-list-hr">
		</div>

		<!-- <div class="cartSection">
			장바구니에 담긴 상품이 없습니다.
		</div> -->

	</div>
	
	<button name="delAllItem">전체 삭제</button>
	<article class="main">
		<section>
			<table width="80%"  align="center" id="ta" >
			<caption class="caption">장바구니 리스트</caption>
			<thead>
				<tr><th>이미지</th><th>상품이름</th><th>수량</th><th>단가</th><th>합계</th><th>삭제</th></tr>
			</thead>
			<tbody id="content">
				<!-- 장바구니 목록 출력 --> 
			</tbody>
			</table>
		</section>
		<section  class="toalprice" id="price">
			<!-- 가격 -->			
		</section>
		<section class="link">
			<table   align="center">
			<tr><td align="center">
				<a href="order.jsp"><button type="button" class="btn btn-success" name="order"><h3>주문하러 가기</h3></button></a>
			</td></tr>
			</table>
		</section>
	</article>

	<jsp:include page="footer.jsp"/>
</body>
</html>