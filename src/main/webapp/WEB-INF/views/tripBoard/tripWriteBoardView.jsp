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
  <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 #reserve {
                padding-left: 4px;
                background: url("${conPath }/image/hotel4.png") no-repeat;
                width: 100%;
                height: 350px;
            }
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
	<form action="${conPath }/trip.do?method=tripWriteBoard" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mid" value="${mid }">
		<table>
		<caption>동행구하기</caption>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="ttitle"></td>
			</tr>
			<tr>
				<th>팀 이름</th>
				<td><input type="text" name="teamname"></td>
			</tr>
			<tr>
				<th>인원수</th>
				<td class="td-6"><input type="number" name="tmaxmembercount"></td>
			</tr>
			<tr>
				<th>원하는성별구성 </th>
				<td>
					<input type="radio" name="tgender" value="${member.mgender }">동성
					&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="tgender" value="MG">혼성
				</td>
			</tr>
			<tr>
				<th>여행 스타일</th>
				<td>
					 <input type="radio" name="tstyle" value="TRIPBUSY">바쁜 일정
				   	 <input type="radio" name="tstyle" value="TRIPSTAY">호캉스
				</td>
			</tr>
			<tr>
				<th>숙소 스타일</th>
				<td>
					<input type="radio" name="thotelstyle" value="CHEAP">가성비
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="thotelstyle" value="EXPENSIVE">호화로운
				</td>
			</tr>
			<tr>
				<th>노는 스타일 </th>
				<td>
					<input type="radio" name="tplaystyle" value="QUIET">휴양
					&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="tplaystyle" value="ACTIVITY">액티비티
				</td>
			</tr>
			<tr>
				<th>하고싶은말</th>
				<td>
					<input type="text" name="tcontent">
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="temptimage">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
					<input type="submit" value="글 등록">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
	    <jsp:include page="../main/footer.jsp"/>
  </body>
</html>
