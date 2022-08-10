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
 		border: 1px solid red;
 		text-align: center;
 	}
 	.order {
 		text-align: left;
 	}
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   <jsp:include page="../main/header.jsp"/>
   
   	<!-- 주문 디테일  -->
   	<table>
   		<caption>order_detail</caption>
   		<tr>
   			<td colspan="7">
   				<button onclick="location='${conPath}/taxfree.do?method=category&pageNum=1'">면세점으로</button>
   			</td>
   		</tr>
   		<tr>
   			<!-- <th>주문번호</th><th>주문날짜</th> --><th>상품이름</th><th>대표이미지</th><th>수량</th><th>상품가격</th><th>최종금액</th>
   		</tr>
		
		<c:forEach items="${orderDetailList }" var="order">
   		<tr>
   			<td colspan="7" class="order">주문번호 : ${order.or_num } / 주문날짜 : ${order.ordate }</td>
   		</tr>
   		<tr>
   		<%-- <td>${order.or_num }</td>
   			 <td>${order.ordate }</td> --%>
   			 <td>${order.pname }</td>
   			 <td><img src="${conPath }/taxfree/${order.pimage1 }" alt="${order.pimage1 }" width="100" height="100"></td>
   			 <td>${order.qty }</td>
   			 <td>${order.pprice }</td>
   			 <td>${order.cost }</td>
   		</tr>
 		</c:forEach>
   	</table>

   	<jsp:include page="../main/footer.jsp"/>
  </body>
</html>