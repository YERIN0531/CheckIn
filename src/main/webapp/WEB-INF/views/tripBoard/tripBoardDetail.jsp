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
  <link href="${conPath }/css/board/reviewdetail.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 	.boardImage {
 		width:200px;
 	}
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function(){
 		$('form').submit(function(){
 			var mgender = '${member.mgender }';
 			var tgender = '${tripBoard.tgender }';
 			if(mgender == tgender || tgender == 'MG'){				
 				return true;
 			} else {
 				alert('작성자가 희망하는 성별이 아닙니다.');
 				return false;
 			}			
 		});
 	});
 	function finishMate(){
 		alert('마감되었습니다.');
 	}
 </script>  
</head>
  <body>
   <c:if test="${empty member and empty manager }">
  	<script>
  		alert('로그인 후 이용해주세요');
  		location="${conPath }/member.do?method=loginForm";
  	</script>
  </c:if> 
  <jsp:include page="../board/boardmain.jsp"/>
  	<form action="${conPath }/trip.do?method=applyTeamView" method="post" >
  		<input type="hidden" name="tnum" value="${tripBoard.tnum }">
		<table>
			<caption>DETAIL</caption>
			<tr>
				<th>글번호</th>
				<td>${tripBoard.tnum }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${tripBoard.mid }</td>
			</tr>
			<tr>
			<th>제목</th>
				<td>${tripBoard.ttitle }</td>
			</tr>
			<tr>
				<th>모집성별</th>
				<td>
					<c:if test="${tripBoard.tgender eq 'M' }">
						남성
					</c:if>
					<c:if test="${tripBoard.tgender eq 'F' }">
						여성
					</c:if>
					<c:if test="${tripBoard.tgender eq 'MG' }">
						혼성
					</c:if>
				</td>
			</tr>
			<tr>
				<th>팀이름</th>
				<td>${tripBoard.teamname }</td>
			</tr>
			<tr>
				<th>현재인원</th>
				<td>
					<c:if test="${tripBoard.tnowmembercount != tripBoard.tmaxmembercount }">
						 ${tripBoard.tnowmembercount } / ${tripBoard.tmaxmembercount }
					</c:if>					
					<c:if test="${tripBoard.tnowmembercount eq tripBoard.tmaxmembercount }">
						마감
					</c:if>
				</td>
			</tr>
			<tr>
				<th>여행스타일</th>
				<td>${tripBoard.tstyle }</td>
			</tr>
			<tr>
				<th>숙소스타일</th>
				<td>${tripBoard.thotelstyle }</td>
			</tr>
			<tr>
				<th>놀이스타일</th>
				<td>${tripBoard.tplaystyle }</td>
			</tr>
			<tr>
				<th>글본문</th>
				<td>${tripBoard.tcontent }</td>
			</tr>
			<c:if test="${tripBoard.timage != null }">
				<tr>
					<th>사진</th>
					<td><img src="${conPath}/fileUpload/${tripBoard.timage }" class="boardImage"></td>
				</tr>
			</c:if>
			<tr>
				<th>작성시점</th>
				<td>${tripBoard.trdate }</td>  
			</tr>
			<tr>
				<td colspan="2" class="btn">
					<c:if test="${tripBoard.tnowmembercount != tripBoard.tmaxmembercount and member.mid != tripBoard.mid}">
						<input type="submit" value="신청하기">
					</c:if>										
					<c:if test="${tripBoard.tnowmembercount eq tripBoard.tmaxmembercount }">
						<input type="button" value="마감" onclick="finishMate()">
					</c:if>
					<input type="button" value="뒤로가기" onclick="location='${conPath }/trip.do?method=tripBoardList&pageNum=${param.pageNum }'">
					<c:if test="${mid eq tripBoard.mid }">
						<input type="button" value="글 수정하기" onclick="location='${conPath }/trip.do?method=tripBoardModifyView&tnum=${tripBoard.tnum }'">
					</c:if>
					
				</td>
			</tr>
		</table>
	</form>     
	  <jsp:include page="../main/footer.jsp"/>
  </body>
</html>
