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
 table {
 	margin: 0 auto;
 	margin-top: 30px;
 	margin-bottom: 70px;
 	text-align: center;
 	width: 550px;
 	height: 600px;
 }
 h1 {
 	text-align: center;
 }
 img {
 	width: 100px;
 	height : 100px;
 }
 .btn {
 	text-align: center;
 }
 #show {
 	display: none;
 }
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function() {
 		
		$('.check-all').click(function() {
			$('.ab').prop('checked', this.checked);
			$('#show').toggle();
			// $( 'ul' ).append( '<input type="button" value="장바구니 비우기" onclick="location.href='${conPath}/cart.do?method=deleteAll'">' );
		});
	});
	</script>  
</head>
  <body>
   	<!-- 넘어온 장바구니 내역 출력 -->
   	<!--  대표이미지, 상품이름, 가격, 수량, 총가격 -->
   	
   	 <c:set var="SUCCESS" value="1"></c:set>
	 <c:set var="FAIL" value="0"></c:set>
   	<c:if test="${not empty deleteCart and deleteCart eq SUCCESS}">
		<script>
			alert('선택하신 상품이 장바구니에서 삭제되었습니다.');
		</script>
	</c:if>
   	
   	<jsp:include page="../main/header.jsp"/>
   	<%-- ${cartList } --%>
   	<section>
   		<form action="" method="post">
   			<table>
   				
   				<caption>${member.mname }(${member.mid }) 님의 장바구니 페이지</caption>
   				
   				<tr>
   					<th>ALL <input type='checkbox' name='cartnum' id ='all' name="all" class="check-all"/></th>
   					<th>상품이미지</th><th>상품이름</th><th>가격</th><th>수량</th><th>총가격</th><th></th>
   				</tr>
   				
   				<c:if test="${empty cartList }">
   				<tr><td colspan="6">장바구니가 비었습니다.</td></tr>
   				</c:if>
   				
   				<c:forEach items="${cartList }" var="cart">
   				<tr>
   					<td><input type="checkbox" name="cartnum" value="${cart.cartnum }" class="ab"> ${cart.cartnum }</td>
   					<td><img src="${conPath }/taxfree/${cart.pimage1}"></td>
   					<td>${cart.pname }</td>
   					<td>${cart.pprice }</td>
   					<td>${cart.qty }</td>
   					<td>${cart.cost }</td>
   					<td>
   						<button onclick="location.href='${conPath}/cart.do?method=delete&cartnum=${cart.cartnum}'">삭제</button>
   						<%-- <button onclick="delete('${cart.cartnum}')">삭제</button> --%>
   						<!-- 자바 스크립트로 함수를 넣어주고 onclick 로 했을때 삭제 location.href = method delete로 넘어가도록 처리 -->
   						<!-- method=delete&cartnum=2 -->
   					</td>
   				</tr>
   				</c:forEach>
   				<tr>
   					<td colspan="6" class="btn">
   						<input type="submit" value="구매하기">
   						<input type="button" value="면세 홈페이지로 이동" onclick="location.href='${conPath}/taxfree.do?method=list&pageNum=1'">	
   						<input type="button" value="장바구니 비우기" id="show" onclick="location.href='${conPath}/cart.do?method=deleteAll'">
   					</td>
   				</tr>
   			</table>
   		</form>
   	</section>
   	
   	<jsp:include page="../main/footer.jsp"/>
   	
  </body>
</html>