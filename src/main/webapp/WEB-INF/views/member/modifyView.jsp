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
	<jsp:include page="myPage.jsp" />
	<form action="${conPath }/member.do?method=modifyMember" method="post">
		<table>
		<c:if test="${param.modify eq 'all' }">
			<caption>정보수정</caption>
			<tr>
				<td>
					
				</td>
			</tr>
		</c:if>
		<c:if test="${param.modify eq 'pw' }">
			<caption>비밀번호 변경</caption>
			<tr>
				<th>현재비밀번호</th>
				<td>
					<input type="password" name="oldMpw" required="required">
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
				<td>
					<input type="password" name="mpw" required="required">
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호 재확인</th>
				<td>
					<input type="password" name="chkMpw" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
		</c:if>
		</table>
	</form>
  </body>
</html>
