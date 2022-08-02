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
  	<c:if test="${insertHotelReservation eq 0 }">
  		<script>
  			alert('예약에 실패하였습니다. 다시 시도해주세요.');
  			history.back();
  		</script>
  	</c:if>
	 <h2>
	 	예약이 완료되었습니다.
	 	예약내역은 마이페이지에서 확인하실수 있습니다.
	 	<br>
	 	<button onclick="location='${conPath }/main.do'">메인으로</button>
	 	<button>마이페이지</button>
	 </h2>
  </body>
</html>
