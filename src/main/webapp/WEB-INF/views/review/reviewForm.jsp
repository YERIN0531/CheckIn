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
   <form action="${conPath }/review.do?method=insertReview" method="post" enctype="multipart/form-data">
   		<input type="hidden" name="mid" value="${mid }">
   		<table>
   				<caption>후기 남기기</caption>
   				<tr>
   					<th>글제목</th>
   						<td><input type="text" name="rtitle" required="required"></td>
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
				<input type="button" value="목록" onclick="location='${conPath }/review.do?method=reviewList&pageNum=${param.pageNum}'">	
   		</table>
   </form>
   </div>   
</body>
</html>