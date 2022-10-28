
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--부트스트랩 css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!--review_write_test.css-->
    <link href="${pageContext.request.contextPath}/css/review_write_test.css" rel="stylesheet">
   
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Document</title>
	

</head>
<body>
    <!--부트스트랩 js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<form action="${path}/front?key=review&methodName=insert" method="post" enctype="multipart/form-data" >
   <table>
        <tr>
            <td  class="review-first" colspan="3">
                <h5><strong>구매후기 작성</strong></h5>
                <input type="hidden" name="userId" value="${sessionScope.loginUser}">
                 <input type="hidden" name="dogName" value="${sessionScope.loginDogName}">
            </td>
        </tr>
        <tr>
            <td>
                 <!--상품 사진-->
                 <div class="product-icon">
                    <img src="${pageContext.request.contextPath}//food/dryfood/55596_originalView_01256815.jpeg">
                </div>
            </td>
            <td>
                <div class="review-product-box">
                    <div class="review-product-date">
                        <h6>등록일 2022.10. 28</h6>
                    </div>
                    <div class="review-product-name" >
                        <h6>상품이름 애니펫 비타 칼슘 비스킷</h6>
                        <input type="hidden" name="productName" value="사료222">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <h5>별점을 선택해주세요.</h5>
                <!--별-->
                <div class="star">
                    <div id="myform" >
                        <fieldset name="reviewGrade">
                            <input type="radio" name="reviewStar" value="5" id="rate1"><label
                                for="rate1">★</label>
                            <input type="radio" name="reviewStar" value="4" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="reviewStar" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="reviewStar" value="2" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="reviewStar" value="1" id="rate5"><label
                                for="rate5">★</label>
                        </fieldset>
                        </div>		
                </div>
                <!--별-->
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div>&nbsp;</div>
                <h5>어떤 점이 좋았나요?</h5>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label"></label>
                    <textarea class="form-control" name = "reviewDetail" id="exampleFormControlTextarea1" rows="4"></textarea>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="photo-attach" >
                    <input type="file" name="file" maxlength="60" size="40" class="btn btn-outline-danger">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="register">
                     <button type="submit"  class="btn btn-danger btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                     <button type="reset" class="btn btn-danger btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취소하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                </div>
            </td>
        </tr>
   </table>
   </form>
      
    
</body>
</html>