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
	<link href="${conPath }/css/main/header.css" rel="stylesheet">
</head>
<body>
 <header>
        <div id="gnb">
            <div id="logo">
                <p class="p1"><a href="${conPath }/main2.do">CHECK IN</a></p>
                <p class="p2"><a href="${conPath }/main2.do">for your life</a></p>
            </div>
            <div id="right">
           	 <c:if test="${empty member }">
                <ul>
                    <li><a href="#">NOTICE</a></li>
                    <li><a href="${conPath }/member.do?method=joinAgreePage">JOIN</a></li>
                    <li><a href="${conPath }/member.do?method=loginForm">LOGIN</a></li>
                </ul>
             </c:if>   
             <c:if test="${not empty member }">
             	<ul>
             		<li><a href="#">NOTICE</a></li>
                    <li><a href="${conPath }/member.do?method=myPage">MYPAGE</a></li>
                    <li><a href="${conPath }/member.do?method=logout">LOGOUT</a>
                    <li><a href="#">${member.mname } 님</a></li>
                </ul>    
             </c:if>
            </div>
        </div>
    </header>
</body>
</html>