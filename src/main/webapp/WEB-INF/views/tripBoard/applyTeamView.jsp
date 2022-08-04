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
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<h1>여행 팀 가입 신청입니다.</h1>
	<form action="${conPath }/trip.do?method=applyTeam" method="post">
		<input type="hidden" name="tnum" value="${param.tnum }">
		<table>
			<tr>
				<td>팀 번호 : ${param.tnum }</td>
			</tr>
			<tr>
				<td>
					본인 아이디 : <input type="text" name="mid" value="${mid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="trmemo" placeholder="한줄 메모를 남겨주세요">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="신청">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
