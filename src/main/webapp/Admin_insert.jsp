<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    table, th, td {
        border: 0.1px solid black;
        border-collapse: collapse;
        width: 600px;
        /* height: 5px; */
        margin: 50px auto;
    }
    input{
        border: solid 0.1px rgb(97, 92, 92);
    }

</style>
  
<body>
<form name="writeForm" method="post" enctype="multipart/form-data" action="${path}/front?key=product&methodName=insert">
    <table align="center" cellpadding="5" width="600">
    	 <tr>
            <td width="1220" height="20" colspan="2">
                <p align="center"><b> 상품 등록 </b></font></p>
            </td>
        </tr>
       <%--  <input type="hidden" name="productCode" value="${??}"> --%>
        <tr>
            <td width="150" height="20" >
                <p align="center"><b><span style="font-size:9pt;">카테고리</span></b></p>
            </td>
            <td width="450" height="20"><b><span style="font-size:9pt;">
            <input type=text name="productCategory" size="30"
            value=""></span></b></td>
        </tr>
        <tr>
            <td width="150" height="20">
                <p align="center"><b><span style="font-size:9pt;">상품이름</span></b></p>
            </td>
            <td width="450" height="20"><b><span style="font-size:9pt;">
            <input type=text name="productName" size="30"></span></b></td>
        </tr>
        <tr>
            <td width="150" height="20">
                <p align="center"><b><span style="font-size:9pt;">상품가격</span></b></p>
            </td>
            <td width="450" height="20" ><b><span style="font-size:9pt;">
            <input type=text name="productPrice" size="50"></span></b></td>
        </tr>
        <tr>
            <td width="150" height="20">
                <p align="center"><b><span style="font-size:9pt;">상품수량</span></b></p>
            </td>
            <td width="450" height="20" ><b><span style="font-size:9pt;">
            <input type=text name="productQty" size="50"></span></b></td>
        </tr>
        <tr>
            <td width="150" height="20">
                <p align="center"><b><span style="font-size:9pt;">상품설명</span></b></p>
            </td>
            <td width="450" height="20"><b><span style="font-size:9pt;">
            <textarea name="productExplain" cols="50" rows="5"></textarea></span></b></td>
        </tr>
        
        <tr>
            <td width="150" height="20">
                <p align="center"><b><span style="font-size:9pt;">대표사진 파일첨부</span></b></p>
            </td>
            <td width="450" height="20">
                <b><span style="font-size:9pt;">
                     <input type="file" name="fname" maxlength="60" size="40">
                   </span></b>
            </td>
        </tr>
        <tr>
            <td width="150" height="20">
                <p align="center"><b><span style="font-size:9pt;">상세사진 파일첨부</span></b></p>
            </td>
          <!-- <td>
                <button type="button" onclick="location.href='Admin_insert2.jsp'">
                    파일선택(상세사진 첨부하는 페이지로 이동할거임)
                </button>
            </td> -->
        </tr>
        
        <tr>
            <td width="450" height="20" colspan="2" align="center">
                <input type=submit value=다음> 
                <input type=reset value=취소하기>
            </td>
        </tr>
    </table>
 </form>       
    
    
</body>
</html>