<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link href="${conPath }/css/board/write.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
   <style>
	table{
	    border-spacing: 0px;
	}
	th{
		border: 1px solid lightgray;
	}
	td{
		border: 1px solid lightgray;
	}
</style>
</head>
<body>
<jsp:include page="../board/boardmain.jsp"/>
<div id="content">
   <form action="${conPath }/review.do?method=modifyReview" method="post" enctype="multipart/form-data">
   		<input type="hidden" name="pageNum" value="${param.pageNum }">
   		<input type="hidden" name="rnum" value="${param.rnum }">
   		<table>
   				<caption>${param.rnum }번 글 수정</caption>
   				<tr>
   					<th>아이디</th>
   						<td>${reviewDto.mid }</td>
   				</tr>
   				<tr>
   					<th>글제목</th>
   						<td><input type="text" name="rtitle" value="${reviewDto.rtitle }"></td>
   				</tr>
   				<tr>
   					<th>글본문</th>
   						<td><input type="text" name="rcontent" value="${reviewDto.rcontent }"></td>
   				</tr>
   				<tr>
   					<th>사진1</th><td><input type="file" name="temprimage1" ></td>
   			     </tr>
   			     <tr>
   					<th>사진2</th><td><input type="file" name="temprimage2" ></td>
   				</tr>
   				<tr>
   					<th>사진3</th><td><input type="file" name="temprimage3" ></td>
   				</tr>
   				<tr>
   					<th>사진4</th><td><input type="file" name="temprimage4" ></td>
   				</tr>
   				<tr>
   					<th>사진5</th><td><input type="file" name="temprimage5" ></td>
   				</tr>
   					<tr><td colspan="2" class="btn">
				<input type="submit" value="저장">
				<input type="button" value="목록" onclick="location='${conPath }/review.do?method=reviewList&pageNum=${param.pageNum}'">	
   		</table>
   </form>
   </div>
      <jsp:include page="../main/footer.jsp"/>
</body>
</html>