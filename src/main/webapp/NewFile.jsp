<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="css/basic.css"  />
<style type="text/css">
.poster {
   width : 150px;
   height : 150px;
}

a{text-decoration: none}

td {text-align: center;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script type="text/javascript">
   $(function() {
      function refreshPage() {
         let str = ""; 
         let toalprice = 0;
         
         for(let i=0; i < localStorage.length; i++) {
            let key = localStorage.key(i); //1001 
            let value = localStorage.getItem(key); //쿵푸팬더,img/movie_image2.jpg,3000

            //value의 값을 , 기준으로 분리
            let arr = value.split(",");

            str += `<tr>`;
            str += `<td><img src="${arr[1]}" class="poster"></td>`;
            str += `<td>${arr[0]}</td>`;
            str += `<td>
                  <button class="minus" tabindex="0" type="button" name="minus">
                         <span class="minus">&nbsp;-&nbsp;</span>
                      </button>
                      <input type="text" inputmode="decimal" class="MuiInputBase-input MuiInput-input jss1390" id="qty" value="${arr[1]}"}>
                      <button class="plus" tabindex="0" type="button" name="plus">
                         <span class="plus">&nbsp;+&nbsp;</span>
                      </button>
                  </td>`; 
            str += `<td><span id="amount"></span></td>`;
            
            
            str += `<td><span id="total">${arr[3]}</span></td>`;
            
            
            str += `<td><button type='button' id='${key}' name='delItem'>삭제</button></td>`; 
            str += `</tr>`;

            //가격 누적
            toalprice += parseInt(arr[3]); //그냥 arr[2]만 가져오면 문자열로 인식함

         } //for문 끝

         //테이블에 추가
         $("#content").html(str);

         //가격 추가
         $("#price").html("<b>주문 가격: " + toalprice + "원</b>");
      
         let onePrice = $('#total').text() / $("#qty").val(); //상품의 원래 가격 6000
         console.log(onePrice + "!!!!!!!"); 
         let newPrice = 0;
         $("#qty").change(function() {
            /* let amount = ${selectByName.productPrice}*$(this).val();
            $("#amount").html(amount); */
            
            
            /* (${selectByName.productPrice}*$('#qty').val()) */
            
            newPrice = onePrice * $(this).val(); //변경된 총가격
            
            //console.log(origin * $(this).val());//단가 * 수량
            //console.log($(this).val());//수량
            //console.log(oprice);
         });
         
         
         $("[name=minus]").on("click", function() { 
            
             //현재상품의 가격을 가져와서 그 가격만큼 현재 출력된 가격에서 빼기하고 다시 화면 출력
             
             //localStorage.setItem(key, value);  //key는 현재상품코드, value는 상품명,개수,단가,총금액
             let key=this.key
             

             //문자열일 것이므로 parseInt() 써야 됨
            
            
            let value = $(this).next().val();
            value--;
            $('#qty').val(value).change();
            $('#amount').val(value);
            
            newPrice = onePrice * $('#qty').val();
            
            //console.log(newPrice + "@@@@@@")
            console.log(key);
         });

         $("[name=plus]").on("click", function() { 
            let value = $('#qty').val();
            value++;
            $('#qty').val(value).change();
         });

      } //함수 끝

      $(document).on("click", "[name=delItem]", function() { 
         if(confirm("삭제하시겠습니까?")) {
            let key = $(this).parent().parent().find("td:eq(1)").text() 
            localStorage.removeItem(key);

            refreshPage();
         }
      }); //삭제 끝
      
      $(document).on("click", "[name=delAllItem]", function() { 
         if(confirm("전체 삭제하시겠습니까?")) {
            localStorage.clear();
            
            refreshPage();
         }
      }); //삭제 끝
      
      
      $("[name=order]").click(function() { 
         location.href = "order.html"; 
         
         /* let str = "";
         str += "${selectByName.productName}" + ","
         str += $('#qty').val() + ","
         str += oprice + ","
         str += (${selectByName.productPrice}*$('#qty').val()) */
         
         
         //console.log(key);
         /* localStorage.setItem(key, str); */
         
         
      });

      refreshPage();
   });
   
   
   
</script>
</head>
<body>
   <button name="delAllItem">전체 삭제</button>
      <article class="main">
      <section>
         <table width="80%"  align="center" id="ta" >
         <caption class="caption">장바구니 리스트</caption>
         <thead>
            <tr><th>이미지</th><th>상품이름</th><th>수량</th><th>가격</th><th>삭제</th></tr>
         </thead>
         <tbody id="content">
            <!-- 찜 목록 출력 --> 
         </tbody>
         </table>
      </section>
      <section  class="toalprice" id="price">
         <!-- 가격 -->         
      </section>
      <section class="link">
         <table   align="center">
         <tr><td align="center">
            <!-- <a href="order.html">주문하러 가기</a>  -->
            <button type="button" class="btn btn-success" name="order"><h3>주문하러 가기</h3></button>
            <!-- <a href="index.html">DVD LIST</a>  -->
         </td></tr>
         </table>
      </section>
      </article>
</body>
</html>