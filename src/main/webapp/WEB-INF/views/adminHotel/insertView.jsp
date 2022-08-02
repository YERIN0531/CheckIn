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
	<h1>관리자가 호텔 등록 페이지입니다.</h1>
	<form action="${conPath }/hotel.do?method=adminInsertHotel" method="post" enctype="multipart/form-data"> 
		<table>
			<caption>호텔 등록</caption>
			<tr>
				<th>호텔 이름</th>
				<td>
					<input type="text" name="hotelname" placeholder="호텔 이름을 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<th>호텔 일련번호</th>
				<td>
					<input type="text" name="hotelid" placeholder="알파벳 3글자를 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<th>호텔 국가</th>
				<td>
					<input type="text" name="hotelcountry">
				</td>
			</tr>
			<tr>
				<th>호텔 주소</th>
				<td>
					<input type="text" name="hoteladdress">
				</td>
			</tr>
			<tr>
				<th>호텔 사진</th>
				<td>
					<input type="file" name="temphotelimage">
				</td>
			</tr>
			<tr>
				<th>스탠다드 룸 가격</th>
				<td>
					<input type="number" name="standardprice">
				</td>
			</tr>
			<tr>
				<th>스탠다드 룸 사진</th>
				<td>
					<input type="file" name="tempstandardimage">
				</td>
			</tr>
			<tr>
				<th>디럭스 룸 가격</th>
				<td>
					<input type="number" name="deluxeprice">
				</td>
			</tr>
			<tr>
				<th>디럭스 룸 사진</th>
				<td>
					<input type="file" name="tempdeluxeimage">
				</td>
			</tr>
			<tr>
				<th>스위트 룸 가격</th>
				<td>
					<input type="number" name="sweetprice">
				</td>
			</tr>		
			<tr>
				<th>스위트 룸 사진</th>
				<td>
					<input type="file" name="tempsweetimage">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
