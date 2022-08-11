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
   <jsp:include page="../main/header.jsp"/>
   
   	<!-- 주문 디테일  -->
   	<table>
   		<caption>ORDER DETAILS</caption>
   		<tr>
   			<td colspan="7">
   				<button onclick="location='${conPath}/taxfree.do?method=category&pageNum=1'">면세점으로</button>
   			</td>
   		</tr>
   		<tr>
   			<th></th><th>PRODUCT</th><th>QTY</th><th>PRICE</th><th>TOTAL</th>
   		</tr>
   		<c:if test="${orderDetailList.size() == 0 }">
   		<tr>
   			<td colspan="7">WE'RE WATING FOR YOUR ORDER</td>
   		</tr>
   		</c:if>
		<c:set var="or_num_temp" value="0"/>
		<c:forEach items="${orderDetailList }" var="order">
		<c:if test="${or_num_temp != order.or_num}">
	   		<tr>
	   			<td colspan="7" class="order">주문번호 ${order.or_num } | 주문날짜 ${order.ordate }</td>
	   		</tr>
	   		<c:set var="or_num_temp" value="${order.or_num }"/>
	   	</c:if>
   		<tr>
   			 <td><img src="${conPath }/taxfree/${order.pimage1 }" alt="${order.pimage1 }" width="100" height="100"></td>
   			 <td>${order.pname }</td>
   			 <td>${order.qty }</td>
   			 <td>${order.pprice }</td>
   			 <td>${order.cost }</td>
   		</tr>
 		</c:forEach>
   	</table>

   	<jsp:include page="../main/footer.jsp"/>
  </body>
</html>