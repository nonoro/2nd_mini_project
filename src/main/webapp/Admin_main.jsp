
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!--부트스트랩-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <title>Document</title>
    <style>
        table, th, td {
            /* border: 0.1px solid black; */
            border-collapse: collapse;
            margin: 200px auto;
        }
        td > img{
            width: 120px;
            height: 120px;
            margin: 12px 70px;


	
        }
        button{
            margin: 5px 90px;
        }
        body{
            background-color: rgb(123, 220, 189);
        }
        :hover img{
	    transform:scale(1.1);             /*  default */
	    -webkit-transform:scale(1.1);     /*  크롬 */
	    -moz-transform:scale(1.1);       /* FireFox */
	    -o-transform:scale(1.1);  
        }

        
    </style>
</head>
<body>
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<div class="back">

    <table>
        <tr>
            <td style="background-color: rgb(145,217,190)"><img src="img/dogdog.png"></td>
            <td style="background-color: rgb(145,217,190)"><img src="img/dogdog.png"></td>
            <td style="background-color: rgb(145,217,190)"><img src="img/dogdog.png"></td>
        </tr>
        <tr>
            <td style="background-color: rgb(145,217,190)">
                <!-- <button type="button" class="btn btn-primary">회원관리</button> -->
                <a href="${path}/front?key=user&methodName=userCount">회원관리</a>
            </td>
            <td style="background-color: rgb(145,217,190)">
                <!-- <button type="button" class="btn btn-primary">상품관리</button> -->
                <a href="${path}/front?key=product&methodName=selectAll">상품관리</a>
            </td>
            <td style="background-color: rgb(145,217,190)">
                <!-- <button type="button" class="btn btn-primary">판매통계</button> -->
                <a href="#" onclick="location.href='Adimin_sale_main.jsp'">판매통계</a>
            </td>
        </tr>
    </table>
</div>
  
    
</body>
</html>