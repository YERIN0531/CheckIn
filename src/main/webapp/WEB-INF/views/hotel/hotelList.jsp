<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
	#hidden {
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('tr').click(function(){
			var hotelid = $(this).children().eq(0).text();
				location.href='${conPath }/hotel.do?method=getHotelDetail&hotelid='+hotelid+'&schcheckindate=${hotel.schcheckindate }&schcheckoutdate=${hotel.schcheckoutdate }&headcount=${hotel.headcount }';
		});
	});
</script>
</head>
<body>
	<h1>특정 호텔, 체크인, 체크아웃으로 검색했을때 리스트 뿌려주는 페이지</h1>
	<table>
		<c:if test="${hotelList.size() == 0 }">
			<tr>
				<td>해당 일정에 예약할 수 있는 호텔이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${hotelList.size() != 0 }">
			<c:forEach var="hotel" items="${hotelList }">
				<tr>
					<td id="hidden">${hotel.hotelid }</td>
					<td>호텔 이름 : ${hotel.hotelname }</td>
					<td>호텔 국가 : ${hotel.hotelcountry }</td>
					<td>호텔 주소 : ${hotel.hoteladdress }</td>
					<td>이미지 태그 써써 호텔 사진 뿌리십쇼 : ${hotel.hotelimage }</td>				
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td><button onclick="history.back()">뒤로가기</button></td>
		</tr>
	</table>
</body>
</html>