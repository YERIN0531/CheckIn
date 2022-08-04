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
$(document).ready(function(){
	$('tr').click(function(){
		var tnum = $(this).children().eq(0).text();
			location.href='${conPath }/trip.do?method=tripBoardDetail&tnum='+tnum+'&pageNum=${paging.currentPage }';
	});
});
</script>
</head>
<body>
	<c:if test="${applyResult eq 1}">
		<script>
			alert('신청에 성공했습니다. 여행팀장이 확인할때까지 기다려주세요');
		</script>
	</c:if>
	<div>
		<a href="${conPath }/trip.do?method=tripWriteBoardView">여행 구인글 쓰기</a>
	</div>
	<div>
		<table>
			<caption>Trip Mate 게시판</caption>			
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>성별</th>
				<th>현재인원</th>
				<th>모집인원<th>
				<th>조회수</th>
			</tr>
			<c:forEach var="trip" items="${tripList }">
				<tr>
					<td>${trip.tnum }</td>
					<td>${trip.ttitle }</td>
					<td>${trip.tgender }</td>
					<td>${trip.tnowmembercount }</td>
					<td>${trip.tmaxmembercount }</td>
					<td>${trip.thit }</td>
				</tr>
			</c:forEach>
		</table>
	</div>	
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/trip.do?method=tripBoardList&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/trip.do?method=tripBoardList&pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/trip.do?method=tripBoardList&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
</body>
</html>
