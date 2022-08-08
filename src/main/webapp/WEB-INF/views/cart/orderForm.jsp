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
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   
   <!-- order에 전달받아야 할 것들 : 주문번호, 상품명, 가격, 회원아이디, 총 금액
   		테이블에 들어가 있는 것들 :  -->
   	<c:forEach var="list" items="${cartOderDetailList }">
   		<p>${list }</p> [1, 1] 이런 식으로 출력 됨.
   	</c:forEach>
   	
   	<!-- 주문 디테일  -->
   	<table>
   		<caption>order_detail</caption>
   		<tr>
   			<th colspan="4">주문번호</th>
   		</tr>
   		<tr>
   			<th>pname/상품이름</th><th>pprice/상품가격</th><th>qty/수량</th><th>cost/최종금액</th>
   		</tr>
   		<tr>
   			<c:forEach items="${productList }" var="pDto">
   			
   			</c:forEach>
   		</tr>
   	</table>
   	
  </body>
</html>