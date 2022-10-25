<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 .a{border:solid red 5px}
 span{width:150px; color:red}
 input{border:solid gray 1px}
 table{width:100%}
 th,td{border:1px gray solid; text-align:center;padding:3px}
 h2{text-align:center}
 
</style>

<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>

<script type="text/javascript">
  $(function() {
	  //전체 검색
	  function selectAll() {
		  $.ajax({
				url: "../selectAllServlet", //서버의 주소
				type: "post", //요청 방식(method 방식 = get | post | put | delete)
				dataType: "json", //서버가 보내온 데이터 타입(text | html | xml | json) 
				//data: {keyWord: $(this).val()}, //서버에게 보낼 parameter 정보 
				success: function(result) { //result 결과가 개수 | 단어, 단어, 단어
					let str = "";
					$.each(result, function(index, item) {
						str += "<tr>";
						str += `<td>${index + 1}</td>`;
						str += `<td><a href='#'>${item.id}</a></td>`;
						str += `<td>${item.name}</td>`;
						str += `<td>${item.age}</td>`;
						str += `<td>${item.tel}</td>`;
						str += `<td>${item.addr}</td>`;
						//str += `<td><input type='button' value='삭제' id='delete'></td>`;
						str += `<td><input type='button' value='삭제' id='${item.id}'></td>`;
						str += "</tr>";
					})
					
					$("#listTable tr:gt(0)").remove();
					$("#listTable tr:eq(0)").after(str);
					
				}, 
				error: function(err) { //서버의 요청 결과가 실패했을 때 콜백 함수
					alert(err + " => 오류 발생");
				}
			}); //ajax 함수 끝
	  } //selectAll 끝

	  //아이디 중복 체크
	  $("#id").keyup(function() {
		  if($(this).val() == "") {
			  $("span").html("중복 결과 여부");
			  return;
		  } else {
			  $.ajax({
					url: "../idCheckServlet", //서버의 주소
					type: "post", //요청 방식(method 방식 = get | post | put | delete)
					dataType: "text", //서버가 보내온 데이터 타입(text | html | xml | json) 
					data: {id: $(this).val()}, //서버에게 보낼 parameter 정보 
					success: function(result) { //
						$("span").html(`<b>${result}</b>`);
					}, 
					error: function(err) { //서버의 요청 결과가 실패했을 때 콜백 함수
						alert(err + " => 오류 발생");
					}
				}); //ajax 함수 끝	
		  }
	  });
	  
	  /* 등록(가입) or 수정하기 */
	  $("#btn").click(function() {
		  let state = true; //true일 때 ajax를 실행하고, false이면 실행하지 않는다.
		  //ajax 실행하기 전에 text 박스의 값 유무를 체크
		  $("input[type=text]").each(function(i, item) { //itme: 각각의 text 박스들을 의미함
			  if($(this).val() == "") {
				  alert("값을 입력해 주세요.");
				  $(this).focus();
				  
				  state = false;
				  return false; //each 함수를 빠져 나간다. /true면 리턴만 쓴 상황과 같음(▽기본이 true). 리턴만 쓰면 반복문 5개 function 중 하나만 빠져나감,
			  }
		  });
		  
		  let address = "../insertServlet";
		  if(state) {
			  //수정하기 
			  if($(this).val() == "수정하기") {
				  address = "../updateServlet";
				  
				  $("#btn").val("가입하기");
				  $("span").show();
				  $("#id").removeAttr("readonly");
			  }
			  
			  $.ajax({
					url: address, //서버의 주소
					type: "post", //요청 방식(method 방식 = get | post | put | delete)
					dataType: "text", //서버가 보내온 데이터 타입(text | html | xml | json) 
					data: $("#inForm").serialize(), //폼의 데이터를 전송 /serialize: 폼의 정보를 한 번에 보낼 때 사용 
					success: function(result) { //
						//alert(result);
						if(result > 0 ) {
							//text를 모두 초기화
							$("[type=text]").val("");
							$("span").text("중복 결과 여부");
							//table 갱신
							selectAll();
						} else {
							alert("실패하였습니다.");
						}
					}, 
					error: function(err) { //서버의 요청 결과가 실패했을 때 콜백 함수
						alert(err + " => 오류 발생");
					}
				}); //ajax 함수 끝
		  } //if문 끝
		  
	  }); //클릭 끝
	  
	  //아이디를 클릭했을 때 값을 폼에 넣기
	  $(document).on("click", "a", function() {
		//alert($(this).text())
		let id = $(this).text();
		
		let nameE = $(this).parent().next(); //next: 형제 노드
		let ageE = nameE.next();
		let phoneE = ageE.next();
		let addrE = phoneE.next();
		
		$("#id").val(id);
		$("#name").val(nameE.text());
		$("#age").val(ageE.text());
		$("#tel").val(phoneE.text());
		$("#addr").val(addrE.text());
		
		//id 박스를 비활성화
		$("#id").attr("readonly", "readonly"); //readonly: 속성, 값 순인데 그 둘의 이름은 같음
		
		//span 태그 감추기
		$("span").hide();
		
		//btn 글씨 변경
		$("#btn").val("수정하기");
		

	 });

		$(document).on("click", "input[value=삭제]", function() {
			//let idV = $(this).attr("id");
		  	//alert(idV);
		  	if(confirm("정말 삭제하실래요?")) {
				  $.ajax({
						url: "../deleteServlet", //서버의 주소
						type: "post", //요청 방식(method 방식 = get | post | put | delete)
						dataType: "text", //서버가 보내온 데이터 타입(text | html | xml | json) 
						data: {id: $(this).attr("id")}, //서버에게 보낼 parameter 정보 
						success: function(result) { //
							if(result == 0 ) {
								alert("삭제되지 않았습니다.");
							} else {
								selectAll();
							}
						}, 
						error: function(err) { //서버의 요청 결과가 실패했을 때 콜백 함수
							alert(err + " => 오류 발생");
						}
					}); //ajax 함수 끝	
		  	}
		  
	  	});
	  
	  selectAll();
	  
  }); //readyEnd

</script>

</head>
<body>

<h2> 상품 리스트  </h2>
<table  id="listTable" cellspacing="0">
	<tr bgcolor="pink">
	   <th>상품 코드</th>
	   <th>상품 카테고리</th>
		<th>상품 이름</th>
		<th>상품 가격</th>
		<th>재고량</th>	
		<th>상품 설명</th>
		<th>삭제</th>
	</tr>
</table>

</body>
</html>





<button type="button" class="e1c07x488 css-1lapv13 e17x72af0"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDUiIGhlaWdodD0iNDUiIHZpZXdCb3g9IjAgMCA0NSA0NSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGNpcmNsZSBmaWxsPSIjMkEwMDM4IiBvcGFjaXR5PSIuNSIgY3g9IjIyLjUiIGN5PSIyMi41IiByPSIyMi41Ii8+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTEuMDMgMTQuMzgpIiBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJzcXVhcmUiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPgogICAgICAgICAgICA8cGF0aCBzdHJva2Utd2lkdGg9IjEuNCIgZD0ibTIwLjQ2IDIuOTEtMi4xNyA5LjIzSDUuODdMMy43MSAyLjkxeiIvPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS13aWR0aD0iMS4yIiBjeD0iMTYuMzUiIGN5PSIxNi44NiIgcj0iMS43Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgc3Ryb2tlLXdpZHRoPSIxLjIiIGN4PSI3LjgyIiBjeT0iMTYuODYiIHI9IjEuNyIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2Utd2lkdGg9IjEuNCIgZD0iTTAgMGgzLjAybDEuNDEgNS45OCIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="장바구니 아이콘"></button>


<button type="button" class="e1c07x488 css-1lapv13 e17x72af0"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDUiIGhlaWdodD0iNDUiIHZpZXdCb3g9IjAgMCA0NSA0NSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGNpcmNsZSBmaWxsPSIjMkEwMDM4IiBvcGFjaXR5PSIuNSIgY3g9IjIyLjUiIGN5PSIyMi41IiByPSIyMi41Ii8+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTEuMDMgMTQuMzgpIiBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJzcXVhcmUiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPgogICAgICAgICAgICA8cGF0aCBzdHJva2Utd2lkdGg9IjEuNCIgZD0ibTIwLjQ2IDIuOTEtMi4xNyA5LjIzSDUuODdMMy43MSAyLjkxeiIvPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS13aWR0aD0iMS4yIiBjeD0iMTYuMzUiIGN5PSIxNi44NiIgcj0iMS43Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgc3Ryb2tlLXdpZHRoPSIxLjIiIGN4PSI3LjgyIiBjeT0iMTYuODYiIHI9IjEuNyIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2Utd2lkdGg9IjEuNCIgZD0iTTAgMGgzLjAybDEuNDEgNS45OCIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="장바구니 아이콘"></button>