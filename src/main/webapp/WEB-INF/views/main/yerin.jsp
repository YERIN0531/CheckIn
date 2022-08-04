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
</head>
<body>
	<h1>예린이가 구현할 기능들 여기에 버튼 만들고 구현하면 될거같아</h1>
	<button onclick="location='${conPath}/air.do?method=airMain'">항공메인</button>
	<button onclick="location='${conPath }/air.do?method=airInsertView'">관리자가 비행기등록하기</button>
	<button onclick="location='${conPath }/air.do?method=allAirList'">관리자 비행기리스트</button>
</body>
</html>