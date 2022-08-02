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
	<c:if test="${not empty insertHotelResult and insertHotelResult eq 3 }">
		<script>
			alert('호텔 등록에 성공했습니다.');
		</script>
	</c:if>
	<c:if test="${not empty insertHotelResult and insertHotelResult != 3 }">
		<script>
			alert('호텔 등록에 실패했습니다.');
			
		</script>
	</c:if>
	<h1>오지게 관리자 호텔 리스트 뿌리는 페이지입니다</h1>
  </body>
</html>
