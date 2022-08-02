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
	<c:if test="${empty member }">
		<script>
			alert('로그인 후 이용하실수 있습니다.');
			location='${conPath}/member.do?method=loginForm';
		</script>
	</c:if>
		<h1>예약 전 예약 확인페이지입니다.</h1>
		<form action="${conPath }/hotel.do?method=payPage" method="post">
			
			<input type="hidden" name="mid" value="${member.mid }">	
			<input type="hidden" name="hotelid" value="${reservationInfo.hotelid }">		
		<table> 
			<tr>
				<td>
					호텔 이름 : ${hotelInfo[0].hotelname }
					<input type="hidden" name="hotelname" value="${hotelInfo[0].hotelname }">
				</td>
			</tr>
			<tr>
				<td>
					호텔 위치 : ${hotelInfo[0].hoteladdress }
				</td>
			</tr>
			<tr>
				<td>
					호텔 사진 : ${hotelInfo[0].hotelimage }
				</td>
			</tr>
			<tr>
				<td>
					선택한 체크인 날짜 : <input type="date" name="checkin" value="${reservationInfo.schcheckindate }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					선택한 체크아웃 날짜 : <input type="date" name="checkout" value="${reservationInfo.schcheckoutdate }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					선택한 인원수 : <input type="number" name="headcount" value="${reservationInfo.headcount }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					<c:forEach var="resInfo" items="${hotelInfo }">
						<c:if test="${resInfo.hotelid eq reservationInfo.hotelid }">
							선택한 방 : ${resInfo.roomtype }
							<input type="hidden" name="roomtype" value="${resInfo.roomtype }">
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					<c:forEach var="resInfo" items="${hotelInfo }">
						<c:if test="${resInfo.hotelid eq reservationInfo.hotelid }">
							선택한 방 사진 : 이미지 태그 :${resInfo.roomimage }
							<input type="hidden" name="roomimage" value="${resInfo.roomimage }">
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					<c:forEach var="resInfo" items="${hotelInfo }">
						<c:if test="${resInfo.hotelid eq reservationInfo.hotelid }">
							선택한 방 가격 : <fmt:formatNumber value="${resInfo.roomprice }" pattern="#,### 원" />
							<input type="hidden" name="payprice" value="${resInfo.roomprice }">
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					회원 정보
				</td>
			</tr>
			<tr>
				<td>
					회원 아이디 : ${member.mid }
				</td>
			</tr>
			<tr>
				<td>
					예약자분 성함 : ${member.mname }
				</td>
			</tr>
			<tr>
				<td>
					예약자분 전화번호 : ${member.mtel }
				</td>
			</tr>
			<tr>
				<td>
					예약 정보를 확인하셨습니까?
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="예약하러 가기">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
		</form>
  </body>
</html>
