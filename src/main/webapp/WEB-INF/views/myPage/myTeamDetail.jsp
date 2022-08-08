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
  <c:if test="${deleteResult eq 1 }">
  	<script>
  		alert('추방완료');
  	</script>
  </c:if>
   <c:if test="${deleteResult eq 0 }">
  	<script>
  		alert('추방실패');
  	</script>
  </c:if>
  <jsp:include page="../member/myPage.jsp" />
	<h1>특정 여행팀 상세보기 페이지입니다. 예린씨 css화이팅 입니다</h1>
	<table>
		<tr>
			<td>팀 이름 : ${myTeamDetail[0].teamname }</td>
		</tr>
		<tr>
			<td>팀 번호 : ${myTeamDetail[0].tnum }</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>직급</th>
			<th>이름</th>
			<th>연락처</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>가입시점</th>
		</tr>
		<c:forEach var="myTeam" items="${myTeamDetail }">
			<c:if test="${myTeam.tstep eq 0 }">
				<tr>
					<td>
						팀장
					</td>
					<td>
						${myTeam.mname }
					</td>
					<td>
						${myTeam.mtel }
					</td>
					<td>
						<c:if test="${myTeam.mgender eq 'M'}">
							남성
						</c:if>
						<c:if test="${myTeam.mgender eq 'F'}">
							여성
						</c:if>
					</td>
					<td>
						${myTeam.mbirth }
					</td>
					<td>
						${myTeam.ttrdate }
					</td>
				</tr>		
			</c:if>
		</c:forEach>	
			<c:forEach var="myTeam" items="${myTeamDetail }">
				<c:if test="${myTeam.tstep != 0 }">
				<tr>
					<td>
						팀원
					</td>
					<td>
						${myTeam.mname }
					</td>
					<td>
						${myTeam.mtel }
					</td>
					<td>
						<c:if test="${myTeam.mgender eq 'M'}">
							남성
						</c:if>
						<c:if test="${myTeam.mgender eq 'F'}">
							여성
						</c:if>
					</td>
					<td>
						${myTeam.mbirth }
					</td>
					<td>
						${myTeam.ttrdate }
					</td>
					<c:if test="${member.mid eq teamLeader }">
						<td>
							<button onclick="location='${conPath }/trip.do?method=deleteMemberTeam&tnum=${myTeam.tnum }&mid=${myTeam.mid }&teamname=${myTeam.teamname }'">추방하기</button>
						</td>
					</c:if>
				</tr>
				</c:if>
			</c:forEach>
			
	</table>
  </body>
</html>
