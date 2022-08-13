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
  <link href="${conPath }/css/board/tripwrite.css" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function(){
 		
 	});
 </script>  
</head>
  <body>
  <jsp:include page="../board/boardmain.jsp"/>
		 <div id="logos">
        <p>MAKING TRIPMATE</p>
    </div>
    <div id="content">
	<form action="${conPath }/trip.do?method=tripBoardModify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="tnum" value="${boardDto.tnum }">
		<table>
			<caption>MODIFY</caption>
			<tr>
			<th>글제목</th>
				<td> <input type="text" name="ttitle" value="${boardDto.ttitle }">
				</td>
			</tr>
			<tr>
			<th>팀이름</th>
				<td><input type="text" name="teamname" value="${boardDto.teamname }">
				</td>
			</tr>
			<tr>
			<th>인원수</th>
				<td><input type="number" name="tmaxmembercount" value="${boardDto.tmaxmembercount }">
				</td>
			</tr>
			<tr>
			<th>원하는동행성별</th>
				<td>
								<c:if test="${boardDto.tgender eq 'F' or boardDto.tgender eq 'M'}">
									<input type="radio" name="tgender" value="${member.mgender }" checked="checked">동성
									<input type="radio" name="tgender" value="MG">혼성
								</c:if>
								<c:if test="${boardDto.tgender eq 'MG' }">
									<input type="radio" name="tgender" value="${member.mgender }">동성
									<input type="radio" name="tgender" value="MG" checked="checked">혼성
								</c:if>
				</td>
			</tr>
			<tr>
			<th>여행스타일</th>
				<td><c:if test="${boardDto.tstyle eq 'TRIPBUSY' }">
									<input type="radio" name="tstyle" value="TRIPBUSY" checked="checked">바쁜 일정
									<input type="radio" name="tstyle" value="TRIPSTAY">호캉스
								</c:if>
								 <c:if test="${boardDto.tstyle eq 'TRIPSTAY' }">
									<input type="radio" name="tstyle" value="TRIPBUSY">바쁜 일정
									<input type="radio" name="tstyle" value="TRIPSTAY" checked="checked">호캉스
								</c:if>
				</td>
			</tr>
			<tr>
			<th>숙소스타일</th>
				<td><c:if test="${boardDto.thotelstyle eq 'CHEAP' }">
									<input type="radio" name="thotelstyle" value="CHEAP" checked="checked">가성비
									<input type="radio" name="thotelstyle" value="EXPENSIVE">호화로운
								</c:if>	
								<c:if test="${boardDto.thotelstyle eq 'EXPENSIVE' }">
									<input type="radio" name="thotelstyle" value="CHEAP">가성비
									<input type="radio" name="thotelstyle" value="EXPENSIVE" checked="checked">호화로운
								</c:if>	
				</td>
			</tr>
			<tr>
			<th>노는스타일</th>
				<td><c:if test="${boardDto.tplaystyle eq 'QUIET' }">
									<input type="radio" name="tplaystyle" value="QUIET" checked="checked" >휴양
									<input type="radio" name="tplaystyle" value="ACTIVITY">액티비티
								</c:if>
								<c:if test="${boardDto.tplaystyle eq 'ACTIVITY' }">
									<input type="radio" name="tplaystyle" value="QUIET">휴양
									<input type="radio" name="tplaystyle" value="ACTIVITY" checked="checked" >액티비티
								</c:if>
				</td>
			</tr>
			<tr>
			<th>하고싶은말</th>
				<td><input type="text" name="tcontent" value="${boardDto.tcontent }">
				</td>
			</tr>
			<tr>
			<th>파일</th>
				<td><input type="file" name="temptimage">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
					<input type="submit" value="글 수정">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</div>
	<jsp:include page="../main/footer.jsp"/>

  </body>
</html>
