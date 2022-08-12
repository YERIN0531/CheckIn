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
  <link href="${conPath }/css/style.css" rel="stylesheet">
 <style>
 /* 꼭 있어야 하는 CSS */
 #show {
 	display: none;
 }
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function() {
 		$.ajax({
 			type : "GET",
 			url : "http://spartacodingclub.shop/sparta_api/rate",
 			data : {},
 			success : function (response){
 				let now_rate = Number(response['rate']);
 				$('#now-rate').text(now_rate);
 				var price = $('.price');
 				$(price).each(function(idx, item){
 					$(item).html('<b>'+Math.ceil(Number($(item).text()) * now_rate)+ '</b>');
 				});
 			}
 		})
 		
		$('.check-all').click(function() {
			$('.selectAll').prop('checked', this.checked);
			$('#show').toggle();
		});

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
   	 <c:set var="SUCCESS" value="1" />
	 <c:set var="FAIL" value="0" />
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
   	<%-- ${cartList } --%>
   	<section>
   		<form action="${conPath }/cart.do?method=buyInfo" method="post">
   			<input type="hidden" name="mid" value="${member.mid }">
   			<table>
   				<caption>${member.mname }'S CART</caption>
   				<tr>
   					<th><label for="all">ALL</label><br><input type='checkbox' name='cartnum' id ='all' name="all" class="check-all"/></th>
   					<th></th><th>PRODUCT</th><th>QTY</th><th>PRICE</th><th>TOTAL</th><th></th>
   				</tr>
   				
   				<c:if test="${empty cartList }">
   				<tr><td colspan="7">YOUR BASKET IS EMPTY</td></tr>
   				</c:if>
   				
   				<c:forEach items="${cartList }" var="cart">
   				<tr>
   					<td><input type="checkbox" name="cartnum" value="${cart.cartnum }" class="selectAll"></td>
   					<td><a href="${conPath}/taxfree.do?method=detail&pnum=${cart.pnum }&mid=${member.mid }"><img src="${conPath }/taxfree/${cart.pimage1}"></a></td>
   					<td>${cart.pname }</td>
   					<td><input type="number" value=${cart.qty } name="qty" class="qty${cart.cartnum }"> </td>
   					<td>USD ${cart.pprice }</td>
   					<td>
   					<!-- 환율 정보 받아와서 출력할 수 있도록 해주기 : 지금 해놓은 건 임의로 집어넣은 환율 -->
   						USD ${cart.cost } <br> 
   						<span class="price">${cart.cost}</span>
   						<%-- <fmt:formatNumber value="${cart.cost}" type="number" var="numberType" />
    					<fmt:formatNumber type="currency" currencySymbol="￦ " value="${cart.cost * 1300 }"  /> --%>
                    </td>
   					<td>
   						<input type="button" class="modify" id="${cart.cartnum }" value="MODIFY">
   						<input type="button" onclick="location.href='${conPath}/cart.do?method=delete&cartnum=${cart.cartnum}'" value="DELETE">
   						<%-- form 태그 안에서의 button 태그는 submit의 역할을 하기 때문에 input type=button을 사용 해야한다. --%>
   					</td>
   				</tr>
   				</c:forEach>
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
   		</form>
   	</section>
   	
   	<jsp:include page="../main/footer.jsp"/>
   	
  </body>
</html>