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
	<h1> 호텔 상세보기 페이지 입니다.</h1>
	<div>${hotelDetail[0].hotelname }</div>
	<hr>
	<form action="${conPath }/hotel.do?method=getHotelDetail" method="post">
		<input type="hidden" name="hotelid" value="${hotelDetail[0].hotelid.substring(0,3) }">
		<table>
			<caption>일정 변경하기</caption>
			<tr>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>투숙객 인원수</td>
			</tr>
			<tr>
				<td>
					<input type="date" name="schcheckindate" value="${hotelDto.schcheckindate }" required="required">
				</td>
				<td>
					<input type="date" name="schcheckoutdate" value="${hotelDto.schcheckoutdate }" required="required">
				</td>
				<td>
					<input type="number" name="headcount" value="${hotelDto.headcount }" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="조회 ->">
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<!--  ******************************************************************************************************-->
	<table>  
		<c:if test="${checkHotelDetail.size() eq 0 }">
			<c:forEach var="hotel" items="${hotelDetail }" >
			<c:if test="${hotel.roomtype eq '스탠다드' }">
				<tr>
					<td> 호텔 아이디 : ${hotel.hotelid }</td>
					<td>방 사진 : ${hotel.roomimage }</td>
					<td>스탠다드</td>
					<td>매진</td>						
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="hotel" items="${hotelDetail }">
			<c:if test="${hotel.roomtype eq '디럭스' }">
				<tr>
					<td>방 사진 : ${hotel.roomimage }</td>
					<td>디럭스</td>
					<td>매진</td>					
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="hotel" items="${hotelDetail }">
			<c:if test="${hotel.roomtype eq '스위트' }">
				<tr>
					<td>방 사진 : ${hotel.roomimage }</td>
					<td>스위트</td>
					<td>매진</td>					
				</tr>
			</c:if>
		</c:forEach>
		</c:if>
		
		<c:set var="notStandard" value="0"/>
		<c:set var="notDeluxe" value="0"/>
		<c:set var="notSweet" value="0"/>
		<c:if test="${checkHotelDetail.size() != 0 }">
			<c:forEach var="hotel" items="${checkHotelDetail }" >			
				<c:if test="${hotel.roomtype eq '스탠다드' }">
					<tr>
						<td> 호텔 아이디 : ${hotel.hotelid }</td>
						<td>방 사진 : ${hotel.roomimage }</td>
						<td>스탠다드</td>
						<td>방 가격 : <fmt:formatNumber value="${hotel.roomprice }" pattern="#,###" /></td>
						<td>
							<button onclick="location='${conPath }/hotel.do?method=insertHotelReservation&hotelid=${hotel.hotelid }
								&schcheckindate=${hotelDto.schcheckindate }&schcheckoutdate=${hotelDto.schcheckoutdate }&headcount=${hoteldDto.headcount }'">예약하기</button>				
						</td>					
					</tr>
				</c:if>
				<c:if test="${hotel.roomtype != '스탠다드' }">
					<c:set var="notStandard" value="${notStandard + 1 }" />
				</c:if>
			</c:forEach>	
			<c:if test="${checkHotelDetail.size() eq notStandard }">
				<c:forEach var="hotelDetail" items="${hotelDetail }">
					<c:if test="${hotelDetail.roomtype eq '스탠다드' }">
						<tr>
							<td>방사진 : ${hotelDetail.roomimage }</td>
							<td>${hotelDetail.roomtype }</td>
							<td>매진이다;</td>
						</tr>
					</c:if>
				</c:forEach>	
			</c:if>
			
			
			<c:forEach var="hotel" items="${checkHotelDetail }" >	
				<c:if test="${hotel.roomtype eq '디럭스' }">
					<tr>
						<td> 호텔 아이디 : ${hotel.hotelid }</td>
						<td>방 사진 : ${hotel.roomimage }</td>
						<td>디럭스</td>
						<td>방 가격 : <fmt:formatNumber value="${hotel.roomprice }" pattern="#,###" /></td>		
						<td>
							<button onclick="location='${conPath }/hotel.do?method=insertHotelReservation&hotelid=${hotel.hotelid }&
								schcheckindate=${hotelDto.schcheckindate }&schcheckoutdate=${hotelDto.schcheckoutdate }&headcount=${hoteldDto.headcount }'">예약하기</button>			
						</td>			
					</tr>
				</c:if>
				<c:if test="${hotel.roomtype != '디럭스' }">
					<c:set var="notDeluxe" value="${notDeluxe + 1 }" />
				</c:if>
			</c:forEach>
			<c:if test="${checkHotelDetail.size() eq notDeluxe }">
				<c:forEach var="hotelDetail" items="${hotelDetail }">
					<c:if test="${hotelDetail.roomtype eq '디럭스' }">
						<tr>
							<td>방사진 : ${hotelDetail.roomimage }</td>
							<td>${hotelDetail.roomtype }</td>
							<td>매진이다;</td>
						</tr>
					</c:if>
				</c:forEach>	
			</c:if>
					
			<c:forEach var="hotel" items="${checkHotelDetail }" >	
				<c:if test="${hotel.roomtype eq '스위트' }">
					<tr>
						<td> 호텔 아이디 : ${hotel.hotelid }</td>
						<td>방 사진 : ${hotel.roomimage }</td>
						<td>스위트</td>
						<td>방 가격 : <fmt:formatNumber value="${hotel.roomprice }" pattern="#,###" /></td>	
						<td>
							<button onclick="location='${conPath }/hotel.do?method=insertHotelReservation&hotelid=${hotel.hotelid }&
								schcheckindate=${hotelDto.schcheckindate }&schcheckoutdate=${hotelDto.schcheckoutdate }&headcount=${hoteldDto.headcount }'">예약하기</button>				
						</td>				
					</tr>
				</c:if>
				<c:if test="${hotel.roomtype != '스위트' }">
					<c:set var="notSweet" value="${notSweet + 1 }"/>
				</c:if>
			</c:forEach>					
			<c:if test="${checkHotelDetail.size() eq notSweet }">
				<c:forEach var="hotelDetail" items="${hotelDetail }">
					<c:if test="${hotelDetail.roomtype eq '스위트' }">
						<tr>
							<td>방사진 : ${hotelDetail.roomimage }</td>
							<td>${hotelDetail.roomtype }</td>
							<td>매진이다;</td>
						</tr>
					</c:if>
				</c:forEach>	
			</c:if>
		</c:if>
	</table>
  </body>
</html>