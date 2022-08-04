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
	<h1>여행메이트 구인 글 작성 페이지입니다.</h1>
	<form action="" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>
					글제목 : <input type="text" name="ttitle">
				</td>
			</tr>
			<tr>
				<td>
					팀 이름 : <input type="text" name="teamname">
				</td>
			</tr>
			<tr>
				<td>
					인원수 : <input type="number" name="tmaxmembercount">
				</td>
			</tr>
			<tr>
				<td>
					여행 스타일 : <input type="radio" name="tstyle" value="tripbusy">바쁜 일정
								<input type="radio" name="tstyle" value="tripStay">호캉스
				</td>
			</tr>
			<tr>
				<td>
					숙소 스타일 : <input type="radio" name="thotelstyle" value="cheap">가성비
								<input type="radio" name="thotelstyle" value="expensive">호화로운
				</td>
			</tr>
			<tr>
				<td>
					노는 스타일 : <input type="radio" name="tplaystyle" value="quiet">휴양
								<input type="radio" name="tplaystyle" value="activity">액티비티
				</td>
			</tr>
			<tr>
				<td>
					하고싶은말 : <input type="text" name="tcontent">
				</td>
			</tr>
			<tr>
				<td>
					파일 : <input type="file" name="timage">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="글 등록">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
