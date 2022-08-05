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
	<h1>우리팀에 들어오고싶다고 신청한 사람들의 목록이 뜨는 페이지입니다. 예린씨</h1>
	<c:if test="${myteamApplyList.size() eq 0 }">
		<script>
			alert('신청한 사람이 없습니다.');
			history.back();
		</script>
	</c:if>
	<c:if test="${myteamApplyList.size() != 0 }">
		<table>
			<caption>요청 목록</caption>
				<tr>
					<th>팀 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>성별</th>
					<th>한줄메모</th>
					<th>신청일</th>
				</tr>
			<c:forEach var="applyList" items="${myteamApplyList }">
				<tr>
					<td>${applyList.tnum }</td>
					<td>${applyList.mid }</td>
					<td>${applyList.mname }</td>
					<td>${applyList.mbirth }</td>
					<td>${applyList.mtel }</td>
					<td>
						<c:if test="${applyList.mgender eq 'M' }">
							남성
						</c:if>
						<c:if test="${applyList.mgender eq 'F' }">
							여성
						</c:if>
					</td>
					<td>${applyList.trmemo }</td>
					<td>${applyList.trrdate }</td>
					<td>
						<button>수락</button>
						<button>거절</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
  </body>
</html>
