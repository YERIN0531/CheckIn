<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="${conPath }/css/taxfree/listcart.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
   #reserve {
            padding-left: 4px;
            background: url("${conPath}/image/tax1.png") no-repeat;
            background-size:100%;
            width: 100%;
            height: 400px;
        }
 /* 꼭 있어야 하는 CSS */
  input[type="checkbox"]{
  	display:none;
  }
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function() {
 		

		$('.modify').click(function(){
 			var cartnum = $(this).attr('id');
			var qty = $('.qty'+cartnum).val();
			location.href='${conPath}/cart.do?method=modify&cartnum='+cartnum+'&qty='+qty;
			//location.reload();
		  });
	});
	</script>  
</head>
  <body>
   	<!-- 넘어온 장바구니 내역 출력 -->
   	<!--  대표이미지, 상품이름, 가격, 수량, 총가격 -->
   	
   	 <c:set var="SUCCESS" value="1"></c:set>
	 <c:set var="FAIL" value="0"></c:set>
   	<c:if test="${deleteCart eq SUCCESS}">
		<script>
			alert('선택하신 상품이 장바구니에서 삭제되었습니다.');
		</script>
	</c:if>
	<c:if test="${not empty deleteAllCart}">
		<script>
			alert('장바구니 비우기가 완료되었습니다.');
		</script>
	</c:if>
	<c:if test="${not empty modifyResult}">
		<script>
			alert('수량이 정상적으로 변경되었습니다.');
		</script>
	</c:if>
   	
   <!-- 	modifyResult -->
   	<jsp:include page="../main/header.jsp"/>
   			 <div id="list">
            <div id="lnb">
                <ul>
	                   <li><a href="${conPath }/air.do?method=airMain">항공</a></li>
	                   <li><a href="${conPath }/hotel.do?method=hotelMain">호텔</a></li>
	                   <li><a href="${conPath}/taxfree.do?method=category">면세점</a></li>
	                   <li><a href="${conPath}/notice.do?method=boardmain">게시판</a></li>
	              </ul>
            </div><!-- lnb -->
        </div><!-- list -->
	
        <div id="reserve">
            <div id="word">
                <p>DUTY FREE</p>
            </div><!-- word -->

        </div><!-- reserve -->
        <div id="logos">
        <p>CART LIST</p>
    </div>
   	
   	
   	
   	
   	
   	
   	<%-- ${cartList } --%>
   	<section>
   		<form action="${conPath }/cart.do?method=buyInfo" method="post">
   			<input type="hidden" name="mid" value="${member.mid }">
   			<table>
   				<caption>${member.mname }님 CART</caption>
   				<tr>
	   					<th class="th-1">PRODUCT IMG</th>
	   					<th class="th-2">PRODUCT</th>
	   					<th class="th-3">QTY</th>
	   					<th class="th-4">PRICE</th>
	   					<th class="th-5">TOTAL</th>
	   					<th class="th-6"></th>
   				</tr>
   				
   				<c:if test="${empty cartList }">
   				<tr><td colspan="7">YOUR BASKET IS EMPTY</td></tr>
   				</c:if>
   				
   				<c:forEach items="${cartList }" var="cart">
   				<tr>
   					<td class="td-1"><a href="${conPath}/taxfree.do?method=detail&pnum=${cart.pnum }&mid=${member.mid }"><img src="${conPath }/taxfree/${cart.pimage1}" width="250" height="180"></a></td>
   					<td class="td-2">${cart.pname }</td>
   					<td class="td-3"><input type="number" value=${cart.qty } name="qty" class="qty${cart.cartnum }"> </td>
   					<td class="td-4">＄${cart.pprice }</td>
   					<td class="td-5">
   					<!-- 환율 정보 받아와서 출력할 수 있도록 해주기 : 지금 해놓은 건 임의로 집어넣은 환율 -->
   						＄${cart.cost } <br> 
   						<fmt:formatNumber value="${cart.cost * 1300 }" type="number" var="numberType" />
    					<b><fmt:formatNumber type="currency" currencySymbol="￦ " value="${cart.cost * 1300 }"  /></b>
                    </td>
   					<td class="td-6">
   						<input type="button" class="modify" id="${cart.cartnum }" value="MODIFY"><br><br>
   						<input type="button" onclick="location.href='${conPath}/cart.do?method=delete&cartnum=${cart.cartnum}'" value="DELETE">
   						<%-- form 태그 안에서의 button 태그는 submit의 역할을 하기 때문에 input type=button을 사용 해야한다. --%>
   					</td>
   				</tr>
   				</c:forEach>
   			</table>
   			<div id="deletebutton">
	   			<table >
	   				<tr>
	   					<td colspan="7" class="btn">
	   					<c:if test="${not empty cartList }">
	   						<input type="submit" value="BUY">
	   					</c:if>
	   						<input type="button" value="DUTY-FREE" onclick="location.href='${conPath}/taxfree.do?method=category&pageNum=1&mid=${member.mid }'">	
	   						<input type="button" value="DELETE-ALL" id="show" onclick="location.href='${conPath}/cart.do?method=deleteAll'">
	   					</td>
	   				</tr>
	   			</table>
   			</div>
   		</form>
   	</section>
   	
   	<jsp:include page="../main/footer.jsp"/>
   	
  </body>
</html>