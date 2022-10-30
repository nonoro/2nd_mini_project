<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>myPage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.min.css" rel="stylesheet">



    <!-- ###############################################mypage############################################### -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage/myPage.css">

    <style>@font-face {
        font-family: 'LeferiPoint-WhiteObliqueA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    details {
        border-bottom: 1px solid #efefef;
        color: #666;
        font-size: 16px;
        padding: 15px;
    }


    details[open] summary {
        font-weight: 800;
    }

    details > summary {
        color: #333;
        font-size: 24px;
        padding: 15px 0;
    }
    </style>

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
            $(document).on("click", "#order", function () {
                if (false) {
                    $("#order").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageOrder.jsp");
                } else {
                    $("#order").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#cancelOrder", function () {
                if (false) {
                    $("#cancelOrder").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageCancelOrder.jsp");
                } else {
                    $("#cancelOrder").attr("href", "${pageContext.request.contextPath}/mypagepart/myPageCancelOrderEmpty.jsp");
                }
            });

            $(document).on("click", "#pointDetail", function () {
                if (false) {
                    $("#pointDetail").attr("href", "${pageContext.request.contextPath}/mypagepart/pointOk.jsp");
                } else {
                    $("#pointDetail").attr("href", "${pageContext.request.contextPath}/mypagepart/pointEmpty.jsp");
                }
            });

            $(document).on("click", "#notice", function () {
                if (false) {
                    $("#notice").attr("href", "${pageContext.request.contextPath}/mypagepart/noticeDetail.jsp");
                } else {
                    $("#notice").attr("href", "${pageContext.request.contextPath}/mypagepart/noticeEmpty.jsp");
                }
            });
        });
    </script>

</head>

<!-- header -->

<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"/>

<div class="shopTool">
    <div class="shopTool-detail">
        <span style="margin-left: 10px">홈&nbsp;>&nbsp;</span>
        <span>마이페이지&nbsp;>&nbsp;</span>
        <span id="pageName">자주묻는질문&nbsp;</span>
    </div>
</div>

<div class="myPageMain">
    <jsp:include page="${pageContext.request.contextPath}/informationBar.jsp"/>
    <div class="menuMain">
        <jsp:include page="${pageContext.request.contextPath}/menu.jsp"/>
        <div class="menu-result-container" id="menu-result-container">
            <h2>자주 묻는 질문</h2>
            <details>
                <summary>1. 포인트는 어떻게 사용하나요?</summary>
                상품을 구매할 경우 일반 현금과 동일하게 사용할 수 있습니다.
                상품 구매 시 주문결제 페이지의 포인트 항목에서 사용할 포인트를 입력하시면 됩니다.
            </details>
            <details>
                <summary>2.주문취소는 어떻게 하나요?</summary>
                '[MY페이지 > 주문 취소]에서 취소 가능합니다.
                '발송준비중' '발송처리완료' 상태인 경우 배송사로 인계되어 취소가 불가능하므로, 수령하신 후 반품해 주셔야 합니다.
                또한, 반품 배송비는 고객님께서 부담하시게 됩니다.
                <a href="#">주문 취소 페이지로 이동</a>
            </details>
            <details>
                <summary>3.배송지 변경은 어떻게 하나요?</summary>
                '입금대기, 입금확인' 상태인 경우에는 [MY페이지 > 주문·배송 > 주문상세보기 > 배송정보 변경] 에서 배송지를 변경하시면 됩니다.
                '발송준비중, 발송처리완료' 상태인 경우에는 배송사로 인계되어 변경이 불가능합니다.
                <a href="#">주문·배송 페이지로 이동</a>
            </details>
            <details>
                <summary>4.토요일, 공휴일에 배송이 가능한가요?</summary>
                토요일에는 배송이 되나 일요일, 공휴일에는 배송이 불가능합니다.
                <a href="#">주문·배송 페이지로 이동</a>
            </details>
            <details>
                <summary>5.아무래도 사료보다는 집에서 만들어서 만드는 음식이 더 좋은 것 아닌가요?</summary>
                그렇다고만 할 수는 없습니다. 아이들에게 필요한 영양성분들이 있습니다.
                그것들을 제외된다면 영양불균형이 발생합니다.
                고기가 많은 육류의 식사는 비타민이나 미네랄의 섭취가 부족할 수 있고 반대로 채소류가 많은 식사에서는 단백질 등의 에너지원의 불균형이 발생될 수 있습니다.
                집에서 만들어주는 사랑과 정성의 음식도 아이들에게 좋은 식사일 수 있지만 하림펫푸드와 같이 영양요소의 균형을 고루 갖춘 제품을 추천합니다.
            </details>
            <details>
                <summary>6.회원탈퇴는 어떻게 하나요?</summary>
                로그인 후 상단 마이페이지 메뉴를 클릭 하여 회원탈퇴 버튼을 통해 가능합니다.
                단 남아있는 예치금,적립금,쿠폰이 있으실 경우엔 회원 탈퇴 시 모두 삭제되며 복구가 불가합니다. 또한 동일 이름, 동일 계정, 동일 연락처 등으로 재가입이 불가능합니다.
            </details>
            <details>
                <summary>7.제품의 유통기한은 얼마나 되나요?</summary>
                하림펫푸드의 건식제품은 제조일로부터 1년을 유통기한으로 설정하고 있으며 유통기한만 표시하는 것이 아닌 제조일자도 표시하여 제품의 신선함을 보여드리고 있습니다.
                하림펫푸드에서는 아이들에게 보다 신선하고 안전한 음식을 제공하고자 노력하겠습니다.
            </details>
            <details>
                <summary>8.제품군이 다양한데 이유가 있나요?</summary>
                사람도 각기 다른 입맛을 가지고 있습니다.
                애완견들도 각자 선호하는 입맛을 가지고 있습니다.
                또한 연령, 환경, 활동량 등 각자 생활 환경이 다르기 때문에 필요로 하는 영양도 다른 것입니다.
                따라서 애완견들의 영양 상태와 입맛을 맞추기 위하여 하림펫푸드에서는 다양한 제품군을 제공하고 있습니다.
            </details>
        </div>
    </div>
</div>

        <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>