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
   <link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
 <div id="content">
   <form action="${conPath }/review.do?method=replyReview" method="post" enctype="multipart/form-data">
   		<input type="text" name="mid" value="${mid }">
   		<input type="text" name="pageNum" value="${param.pageNum }">
		<input type="text" name="rgroup" value="${replyDto.rgroup }">
		<input type="text" name="rstep" value="${replyDto.rstep }">
		<input type="text" name="rindent" value="${replyDto.rindent }">
   		<table>
   				<caption>${param.rnum }번 글의 답글 쓰기 </caption>
   				<tr>
   				  <th> 작성자 </th>
   				  <td>
   				  	<input type="text" name="rname" value="${member.mname }" readonly="readonly">
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
   					<tr><td colspan="2">
				<input type="submit" value="등록">
				<input type="button" value="목록" onclick="location='review.do?method=reviewList&pageNum=${param.pageNum}'">	
   		</table>
   </form>
   </div>     
</body>
</html>