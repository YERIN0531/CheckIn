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
  <form action="${conPath }/qna.do?method=qnaModify" method="post" enctype="multipart/form-data">
   		<input type="hidden" name="pageNum" value="${param.pageNum}">
   		<input type="hidden" name="qnum" value="${param.qnum}">
   		<input type="text" name="qid" value="${qnaDto.qid}">
   		<input type="hidden" name="qsecret" value="${qnaDto.qsecret }">
   		<input type="hidden" name="qpassword" value="${qnaDto.qpassword}">
   		<table>
   				<caption>${param.qnum }번 글 수정/${qnaDto}</caption>
   				<tr>
   					<th>글제목</th>
   						<td><input type="text" name="qtitle" value="${qnaDto.qtitle}"></td>
   				</tr>
   				<tr>
   					<th>글본문</th>
   						<td><input type="text" name="qcontent" value="${qnaDto.qcontent}"></td>
   				</tr>
   				<tr>
   					<th>사진1</th><td><input type="file" name="tempqimage1" ></td>
   			     </tr>
   			     <tr>
   					<th>사진2</th><td><input type="file" name="temprqmage2" ></td>
   				</tr>
   				
   					<tr><td colspan="2">
				<input type="submit" value="저장">
				<input type="button" value="목록" onclick="location='${conPath }/qna.do?method=qnaList&pageNum=${param.pageNum}'">	
   		</table>
   </form>
 </div>
</body>
</html>