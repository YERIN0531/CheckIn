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
<link href="${conPath }/css/board/write.css" rel="stylesheet">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
<jsp:include page="../board/boardmain.jsp"/>
	<form action="${conPath }/trip.do?method=applyTeam" method="post">
		<input type="hidden" name="tnum" value="${param.tnum }">
		<table class="teamapply">
		<caption>TEAM APPLY</caption>
			<tr>
				<th class="th-11">팀번호</th>
				<td><p>${param.tnum }</p></td>
			</tr>
			<tr>
			<th class="th-11">본인아이디</th>
				<td>
					<input type="text" name="mid" value="${mid }" readonly="readonly">
				</td>
			</tr>
			<tr>
			<th class="th-33">한줄메모</th>
				<td>
					<input type="text" name="trmemo" placeholder="한줄 메모를 남겨주세요">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
					<input type="submit" value="신청">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
