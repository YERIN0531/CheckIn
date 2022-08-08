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
  <link href="${conPath }/css/hotel/hotelmain.css" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function(){
 		
 	});
 </script>  
</head>
  <body>
  <jsp:include page="../main/header.jsp" />
		<h1>내가 예약한 호텔 조회 페이지.</h1>
	<c:forEach var="hotel" items="${myHotelList }">
		<div class="hotelticket">
		<table>
			<tr class="hotelListTr">
				<td rowspan="5">

					<img src="${conPath }/hotelImg/room.png">
				</td>
				<td class="td-1">
					${hotel.hotelname }
				</td>
				<td rowspan="3"></td>
			</tr>	
			<tr>
				<td></td>
			</tr>
			<tr>		
				<td class="td-3">방 타입 : 
					<c:if test="${hotel.hotelid.substring(4) eq 'SD' }">
						스탠다드
					</c:if>
					<c:if test="${hotel.hotelid.substring(4) eq 'DL' }">
						디럭스
					</c:if>
					<c:if test="${hotel.hotelid.substring(4) eq 'SW' }">
						스위트
					</c:if>
				</td>
			</tr>
			<tr>	
				<td>
					<fmt:formatDate value="${hotel.checkin }" dateStyle="long"/>
				</td>
				<td>
					<fmt:formatDate value="${hotel.checkout }" dateStyle="long"/>
				</td>
			</tr>
			<tr>
				<td>
					${hotel.headcount } 명
				</td>
				<td>
					가격 : <fmt:formatNumber value="${hotel.roomprice }" pattern="#,### 원" />
				</td>
			</tr>
		</table>
		</div>
	</c:forEach>
	 <jsp:include page="../main/footer.jsp" />	
  </body>
</html>
