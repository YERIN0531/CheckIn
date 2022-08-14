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
   <form action="${conPath }/review.do?method=replyReview" method="post" enctype="multipart/form-data">
   		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="rgroup" value="${replyDto.rgroup }">
		<input type="hidden" name="rstep" value="${replyDto.rstep }">
		<input type="hidden" name="rindent" value="${replyDto.rindent }">
   		<table>
   				<caption>${param.rnum }번 글의 답글 쓰기 </caption>
   				<tr>
   				  <th> 작성자 </th>
   				  <td>
   				  	<input type="text" name="mid" value="${member.mid }" readonly="readonly">
   				  </td>
   				<tr>
   					<th>글제목</th>
   						<td><input type="text" name="rtitle" required="required"value="[답]${replyDto.rtitle }"  ></td>
   				</tr>
   				<tr>
   					<th>글본문</th>
   						<td><input type="text" name="rcontent" required="required"></td>
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
				<input type="submit" value="등록">
				<input type="button" value="목록" onclick="location='${conPath }/review.do?method=reviewList&pageNum=${param.pageNum}'">	
   		</table>
   </form>
   </div>     
   <jsp:include page="../main/footer.jsp"/>
</body>
</html>