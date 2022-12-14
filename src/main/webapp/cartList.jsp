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

<!-- <link  rel="stylesheet" type="text/css" href="css/basic.css"  /> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<style type="text/css">
	.top {position: relative;  top: 50px;  right:30px; }
.main{position: relative;  top: 100px; width: 70%; margin: 0 auto;  }
.bottom {
	position: relative;  
	top: 10px;
	width:200px;
	margin: 0 auto; 
}
	
.link{position: relative;  top: 10px; width: 70%; margin: 0 auto; }
.caption {  
	background-color:#222;
	vertical-align: middle;   
	text-align: center; 
	padding: 20px;
	font-size: 20px;
	color: #fff;
}
		   
.toalprice {  
	/* background-color:orange;   */
	height:35px;  
	vertical-align: middle;   
	text-align: right;  
	padding: 5px 20px;
	width:75%;
	margin: 0 auto;
} 

thead tr {
	height: 30px;
	margin: 10px;
}

.orderviewbox {	
	position: absolute;  top: 150px;
   	width: 70%;	height: 300px;  
   	vertical-align: middle;    
}
	
.orderview{
	/* border: 1px  solid  orange;	 */
	width: 350px;  
	height: 100px;  
	text-align: center; 
	vertical-align: middle;   
}

.poster {
	width : 150px;
	height : 150px;
}

a{text-decoration: none}

td {text-align: center;}

.title{
		border-bottom: 2px solid red;
	}		
	
	.title2{
		border-bottom: 2px solid gray;
		padding-bottom: 50px;
	}	
	

</style>

<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		let nf = Intl.NumberFormat();
		
		function refreshPage() {
			let str = ""; 
			let toalprice = 0;
			
			for(let i=0; i < localStorage.length; i++) {
				let key = localStorage.key(i); 
				let value = localStorage.getItem(key); 

				//value??? ?????? , ???????????? ??????
				let arr = value.split(",");
				let pro = arr[2];
				let total = arr[1] * pro; 

				str += `<tr>`;
				str += `<td><img src="img/${"${arr[3]}"}" class="poster"></td>`;
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
				str += `<td>${"${pro}"}</td>`;
				str += `<td><span id="proPrice">${"${nf.format(total)}"}</span></td>`;
				str += `<td><button type='button' id="${"${key}"}" name='delItem'>??????</button></td>`; 
				str += `</tr>`;

				//?????? ??????
				toalprice += parseInt(arr[1] * arr[2]); 

			} //for??? ???
			
			//???????????? ??????
			if(str != "") {
				$("#content").html(str);
			} else {
				$("#content").html("<br><br><br><h5 align='center'>??????????????? ?????? ????????? ????????????.</h5><br><br><br>");	
			}

			//?????? ??????
			$("#price").html("<b>?????? ??????: " + nf.format(toalprice) + "???</b>");	
			
	}//refresh ???
	
	////////////////////////////////////////////////////////////////////////
	//?????? ?????????
		$(document).on("click","[name=plus]", function(){
			//text?????? ??????????????? +1 
			$(this).prev().val(parseInt($(this).prev().val()) + 1);
			  
			//??? * ??????
			let total_price = parseInt($(this).prev().val()) * parseInt($(this).parent().next().text());
			
			$(this).parent().next().next().text(nf.format(total_price));
			 
			//??????????????????
			let pname= $(this).parent().prev().text();
			  
			sessionChange( $(this) , pname ,  $(this).prev().val() , $(this).parent().next().text() ); //key ??????, ??????, ?????? 
		 
		  });
		
		  //?????????????????? 
	      $(document).on("click","[name=minus]", function(){
	    	  //text?????? ??????????????? -1 
	    	  let no =  parseInt($(this).next().val());
	    	  if(no==1){
	    		  alert("1??? ????????? ????????? ??????????????????.")
	    		  return;
	    	  }
	    	 
	    	  $(this).next().val(no -1);
			  
			  //????????? ??????
			  let total_price = parseInt($(this).next().val()) * parseInt($(this).parent().next().text());
			  
			  $(this).parent().next().next().text(nf.format(total_price));
			  
			  //??????????????????
			  let pname= $(this).parent().prev().text();
			  
			  sessionChange($(this), pname, $(this).next().val() , $(this).parent().next().text()); //key, ??????, ??????
			 
		  });//minusEnd
		  
	  function sessionChange(th, name , qty , price){
		 let key = th.attr("id");
	
		 let value= name + "," + qty + "," + price
		 
		 localStorage.setItem(key, value);
		 
		 totalCheck();//????????? ???????????? 
	  }
	  
	  function totalCheck(){
		  let toalprice = 0;
		  for(let i=0; i < localStorage.length; i++) {
			  let key = localStorage.key(i); 
			  let value = localStorage.getItem(key); 

			  //value??? ?????? , ???????????? ??????
			  let arr = value.split(",");

			  //?????? ??????
			  toalprice += parseInt(arr[1]*arr[2]); 
			} //for??? ???
		  $("#price").html("<b>?????? ??????: " + nf.format(toalprice) + "???</b>");
	  }
	  
	  //////////////////////////////////////////////////////
	  //?????? ????????????
		  $(document).on("click", "[name=delItem]" ,function(){
			  if(confirm("?????????????????????????")) {
				  let key = $(this).attr("id");
				  let value = localStorage.getItem(key);
				  localStorage.removeItem(key, value);
				  
				  refreshPage();
				}
		   });
		  
		  //?????? ????????????
		  $(document).on("click", "[name=delAllItem]", function() { 
			  if(confirm("?????? ?????????????????????????")) {
				  localStorage.clear();
					
				  refreshPage();
			  }
		  }); //?????? ???

	 ////////////////////////////////////////	 

	 refreshPage();
		
	});//readyEnd
</script>

</head>
<body style="background-color: rgba(255,241,193,1)">
	<jsp:include page="header.jsp"/>

	<div class="menu-result-container" id="menu-result-container">

	</div>

	<article class="main">
		<section>
			<table width="80%"  align="center" id="ta" >
				<div>
			
		</div>
			
			<thead>
				<h2>????????????</h2>
				<tr align="center"><th></th><th>????????????</th><th>??????</th><th>??????</th><th>??????</th><th>??????</th></tr>
				<tr class="title" colspan="4" ></tr>
			</thead>
			<tbody id="content">
				<!-- ???????????? ?????? ?????? --> 
			</tbody>
			</table>
		</section>
		<section  class="toalprice" id="price">
			<!-- ?????? -->			
		</section>
		<section class="link">
			<table align="center">
			<tr>
				<td align="center">
					<a href="order2.jsp"><button type="button" class="btn btn-danger" name="order">????????????</button></a>
				</td>
				<td>
					<button type="button" class="btn btn-secondary" name="delAllItem">????????????</button>
				</td>
			</tr>
			</table>
		</section>
	</article>

	<jsp:include page="footer.jsp"/>
</body>
</html>