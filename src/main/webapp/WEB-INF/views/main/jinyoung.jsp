<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>진영이가 구현할 기능들 여기에 버튼 만들고 구현하면 될거같아</h1>
	
	<button onclick="location='${conPath }/hotel.do?method=hotelSearch'">호텔 검색하기</button>
	<button onclick="location='${conPath }/hotel.do?method=insertHotel'">관리자가 숙소등록하기</button>
	<button onclick="location='${conPath }/hotel.do?method=adminHotelList'">관리자 숙소리스트</button>
	<button onclick="location='${conPath }/trip.do?method=tripBoardList&pageNum=1'">동행 게시판</button>
	<button onclick="location='${conPath }/trip.do?method=myTeamList'">나의 동행팀 요청 수락창</button>
</body>
</html>