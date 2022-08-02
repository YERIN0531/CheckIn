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
 *{
 	margin: 0 auto;
 	border: 1px solid red;
 	text-align: center;
 }
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   	<!-- 면세상품 상세보기 페이지 -->
   	<table>
   		<caption>${taxfreeDto.pname }</caption>
   		<tr>
   		<td rowspan="5">
   			<img src="${conPath }/taxfree/${taxfreeDto.pimage1 }" alt="${pDto.pimage1 }" width="250" height="300">
   		</td></tr>
   		<tr><td>상품번호</td><td>${taxfreeDto.pnum }</td></tr>
   		<tr><td>판매가</td><td>USD ${taxfreeDto.pprice }</td></tr>
   		<tr><td>재고수량</td><td>${taxfreeDto.pstock }</td></tr>
   		<tr><td>상품위치</td><td>${taxfreeDto.ploc }</td></tr>
   		<tr>
   			<td colspan="3">
   				<button onclick="location='${conPath}/taxfree.do?method=list'">목록</button>	
   				<button onclick="location='${conPath}/taxfree.do?method=list'">장바구니</button>	
   			</td>
   		</tr>
   	</table>
  </body>
</html>