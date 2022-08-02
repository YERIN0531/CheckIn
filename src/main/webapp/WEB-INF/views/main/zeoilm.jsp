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
</head>
<body>
	<h1>정임이가 구현할 기능들 여기에 버튼 만들고 구현하면 될거같아</h1>
	<button onclick="#">구현 전</button>
	<button onclick="location='${conPath}/taxfree.do?method=insertForm'">면세점상품등록</button>
	<button onclick="location='${conPath}/taxfree.do?method=list'">면세점리스트(페이징)</button>
	
	
</body>
</html>