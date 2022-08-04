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
 		$('form').submit(function(){
 			var mgender = ${member.mgender };
 			var tgender = ${tripBoard.tgender };
 			if(mgender == tgender || tgender == 'MG'){				
 				return true;
 			} else {
 				alert('작성자가 희망하는 성별이 아닙니다.');
 				return false;
 			}			
 		});
 	});
 	function finish(){
 		alert('마감되었습니다.');
 	}
 </script>  
</head>
  <body>
  	<c:if test="${empty member and empty admin }">
  		<script>
  			alert('로그인 후 이용해주세요');
  			location="${conPath }/member.do?method=loginform";
  		</script>
  	</c:if>
  	<form action="${conPath }/trip.do?method=applyTeamView" method="post" >
  		<input type="hidden" name="tnum" value="${tripBoard.tnum }">
		<table>
			<tr>
				<td>글번호 : ${tripBoard.tnum }</td>
			</tr>
			<tr>
				<td>작성자 : ${tripBoard.mid }</td>
			</tr>
			<tr>
				<td>제목 : ${tripBoard.ttitle }</td>
			</tr>
			<tr>
				<td>모집 성별 : ${tripBoard.tgender }</td>
			</tr>
			<tr>
				<td>팀 이름 : ${tripBoard.teamname }</td>
			</tr>
			<tr>
				<td>
					현재인원 :
					<c:if test="${tripBoard.tnowmembercount != tripBoard.tmaxmembercount }">
						 ${tripBoard.tnowmembercount } / ${tripBoard.tmaxmembercount }
					</c:if>					
					<c:if test="${tripBoard.tnowmembercount eq tripBoard.tmaxmembercount }">
						마감
					</c:if>
				</td>
			</tr>
			<tr>
				<td>여행 스타일 : ${tripBoard.tstyle }</td>
			</tr>
			<tr>
				<td>숙소 스타일 : ${tripBoard.thotelstyle }</td>
			</tr>
			<tr>
				<td>놀이 스타일 : ${tripBoard.tplaystyle }</td>
			</tr>
			<tr>
				<td>글 본문 : ${tripBoard.tcontent }</td>
			</tr>
			<tr>
				<td>작성 시점 : ${tripBoard.trdate }</td>
			</tr>
			<tr>
				<td>
					<c:if test="${tripBoard.tnowmembercount != tripBoard.tmaxmembercount }">
						<input type="submit" value="신청하기">
					</c:if>										
					<c:if test="${tripBoard.tnowmembercount eq tripBoard.tmaxmembercount }">
						<input type="button" value="마감" onclick="finish()">
					</c:if>
					<input type="button" value="뒤로가기" onclick="location='${conPath }/trip.do?method=tripBoardList&pageNum=${param.pageNum }'">
				</td>
			</tr>
		</table>
	</form>     
  </body>
</html>
