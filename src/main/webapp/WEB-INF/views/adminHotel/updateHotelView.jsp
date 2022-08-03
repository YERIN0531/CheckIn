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
  	<c:if test="${updateHotelResult eq 3 }">
  		<script>
  			alert('호텔 수정 성공');
  		</script>
  	</c:if>
  	<c:if test="${not empty updateHotelResult and updateHotelResult != 3 }">
  		<script>
  			alert('호텔 수정 실패');
  		</script>  updateHotelRoomResult
  	</c:if>
  	<c:if test="${updateHotelRoomResult eq 1 }">
  		<script>
  			alert('호텔룸 수정 성공');
  		</script>
  	</c:if>
  	<c:if test="${not empty updateHotelRoomResult and updateHotelRoomResult != 1 }">
  		<script>
  			alert('호텔룸 수정 실패');
  		</script>
  	</c:if>
	<h1>관리자가 호텔 수정 페이지입니다.</h1>
	<form action="${conPath }/hotel.do?method=updateHotel" method="post" enctype="multipart/form-data"> 
			<input type="hidden" name="hotelid" value="${hotelDetail[0].hotelid }">
		<table>
			<caption>호텔 수정</caption>
			<tr>
				<th>호텔 이름</th>
				<td>
					<input type="text" name="hotelname" value="${hotelDetail[0].hotelname }" required="required">
				</td>
			</tr>
			<tr>
				<th>호텔 국가</th>
				<td>
					<input type="text" name="hotelcountry" value="${hotelDetail[0].hotelcountry }">
				</td>
			</tr>
			<tr>
				<th>호텔 주소</th>
				<td>
					<input type="text" name="hoteladdress" value="${hotelDetail[0].hoteladdress }">
				</td>
			</tr>
			<tr>
				<th>호텔 사진</th>
				<td>
					<input type="file" name="temphotelimage">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="호텔 수정">
				</td>
			</tr>
		</table>
	</form>
	<form action="${conPath }/hotel.do?method=updateHotelRoom" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>스탠다드 룸 가격</th>
				<td>
					<c:forEach var="hotel" items="${hotelDetail }">
						<c:if test="${hotel.roomtype eq '스탠다드' }">
							<input type="hidden" name="hotelid" value="${hotel.hotelid }">
							<input type="number" name="roomprice" value="${hotel.roomprice }">
						</c:if>
					</c:forEach>
				</td>
				<td rowspan="2">
					<input type="submit" value="스탠다드룸 수정">
				</td>
			</tr>
			<tr>
				<th>스탠다드 룸 사진</th>
				<td>
					<input type="file" name="temproomimage">
				</td>
			</tr>
		</table>
	</form>
	<form action="${conPath }/hotel.do?method=updateHotelRoom" method="post" enctype="multipart/form-data">
		<table>		
			<tr>
				<th>디럭스 룸 가격</th>
				<td>
					<c:forEach var="hotel" items="${hotelDetail }">
						<c:if test="${hotel.roomtype eq '디럭스' }">
							<input type="hidden" name="hotelid" value="${hotel.hotelid }">
							<input type="number" name="roomprice" value="${hotel.roomprice }">
						</c:if>
					</c:forEach>
				</td>
				<td rowspan="2">
					<input type="submit" value="디럭스룸 수정">
				</td>
			</tr>
			<tr>
				<th>디럭스 룸 사진</th>
				<td>
					<input type="file" name="temproomimage">
				</td>
			</tr>
		</table>
	</form>		
	<form action="${conPath }/hotel.do?method=updateHotelRoom" method="post" enctype="multipart/form-data">
		<table>	
			<tr>
				<th>스위트 룸 가격</th>
				<td>
					<c:forEach var="hotel" items="${hotelDetail }">
						<c:if test="${hotel.roomtype eq '스위트' }">
							<input type="hidden" name="hotelid" value="${hotel.hotelid }">
							<input type="number" name="roomprice" value="${hotel.roomprice }">
						</c:if>
					</c:forEach>
				</td>
				<td rowspan="2">
					<input type="submit" value="스위트룸 수정">
				</td>
			</tr>		
			<tr>
				<th>스위트 룸 사진</th>
				<td>
					<input type="file" name="temproomimage">
				</td>
			</tr>
		</table>
	</form>
	<button onclick="location='${conPath }/hotel.do?method=adminHotelList&'">뒤로가기</button>
	<button onclick="location='${conPath }/main.do'">메인으로</button>
  </body>
</html>
