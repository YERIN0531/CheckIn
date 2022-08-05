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
	<h1>나의 여행팀 리스트 페이지입니다.</h1>
	<table>
		<c:forEach var="teamList" items="${myTeamList }">
			<tr>
				<td> 팀이름 : ${teamList.teamname }</td>
				<td> 팀번호 : ${teamList.tnum }</td>
				<td>
					 <button onclick="location='${conPath }/trip.do?method=myTeamDetail&tnum=${teamList.tnum }'">팀 조회</button>
				</td>
				<c:if test="${teamList.tstep eq 0 }">
					<td>
						<button onclick="location='${conPath }/trip.do?method=myTeamApplyList&tnum=${teamList.tnum }&mid=${teamList.mid }'">요청 확인</button>
					</td>
				</c:if>
			</tr>				
		</c:forEach>
	</table>
  </body>
</html>