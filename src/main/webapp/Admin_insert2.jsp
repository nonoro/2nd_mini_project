
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!--부트스트랩-->
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <style>
        table, th, td {
            border: 0.1px solid black;
            border-collapse: collapse;
            width: 600px;
            /* height: 5px; */
            margin: 150px auto;
        }
        input{
            border: solid 0.1px rgb(97, 92, 92);
        }
    </style>
    
</head>
<body>
    <body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <form name=updateForm method=post  enctype="multipart/form-data" action="${path}/front?key=product&methodName=insertMorePhoto">
        <table align="center" cellpadding="5" width="600">
    
    
    
            <tr>
                <td width="150" height="20">
                    <p align="center"><b><span style="font-size:9pt;">상세사진1</span></b></p>
                </td>
                
                <td width="450" height="20">
                    <b><span style="font-size:9pt;">
                         <input type="file" name="detail1" maxlength="60" size="40">
                       </span></b>
                </td>
            </tr>
            <tr>
                <td width="150" height="20">
                    <p align="center"><b><span style="font-size:9pt;">상세사진2</span></b></p>
                </td>
                <td width="450" height="20">
                    <b><span style="font-size:9pt;">
                         <input type="file" name="detail2" maxlength="60" size="40">
                       </span></b>
                </td>
            </tr>
            <tr>
                <td width="150" height="20">
                    <p align="center"><b><span style="font-size:9pt;">상세사진3</span></b></p>
                </td>
                <td width="450" height="20">
                    <b><span style="font-size:9pt;">
                         <input type="file" name="detail3" maxlength="60" size="40">
                       </span></b>
                </td>
            </tr>
            <tr>
                <td width="150" height="20">
                    <p align="center"><b><span style="font-size:9pt;">상세사진4</span></b></p>
                </td>
                <td width="450" height="20">
                    <b><span style="font-size:9pt;">
                         <input type="file" name="detail4" maxlength="60" size="40">
                       </span></b>
                </td>
            </tr>
            <tr>
                <td width="150" height="20">
                    <p align="center"><b><span style="font-size:9pt;">제품 설명 사진</span></b></p>
                </td>
                <td width="450" height="20">
                    <b><span style="font-size:9pt;">
                         <input type="file" name="info1" maxlength="60" size="40">
                       </span></b>
                </td>
            </tr>
            <tr>
                <td width="450" height="20" colspan="2" align="center">
                    <input type=submit value=등록하기> 
                    <input type=reset value=취소하기>
                </td>
            </tr>
        </table>
    </form>
    <div class="main-back">
    	<button type="button" class="btn btn-outline-primary">
   			<a class="back-button" href="${path}/Admin_main.jsp">메인으로 돌아가기</a>
   		</button>
    </div>
            
        
        
    </body>
</body>
</html>