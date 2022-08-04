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
	<link href="${conPath }/css/main/intro.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
   
</head>
<body>
 <div id="back">
          <img src="${conPath }/image/intro.png" alt="" />
    </div>
    <div id="front">
        <p class="p1">Preimium Travel Service</p>
        <p class="p2">CHECK_IN</p>
    </div>
    <div id="list">
        <ul>
            <li><a href="#">JOIN</a></li>
            <li><a href="${conPath}/member.do?method=loginForm">LOGIN</a></li>
            <li><a href="${conPath }/main2.do">MAIN</a></li>
        </ul>
    </div>
</body>
</html>