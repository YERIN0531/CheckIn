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
	<form action="${conPath }/hotel.do?method=schHotel" method="post">
		<table>
			<tr>
				<td>어디에 숙소를 잡고 싶으신가요?</td>	
			</tr>
			<tr>
				<td colspan="3">
					<input type="text" name="schcountry">
				</td>
			</tr>
			<tr>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>투숙객 인원수</td>
			</tr>
			<tr>
				<td>
					<input type="date" name="schcheckindate" required="required">
				</td>
				<td>
					<input type="date" name="schcheckoutdate" required="required">
				</td>
				<td>
					<input type="number" name="headcount" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="호텔검색 ->">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>