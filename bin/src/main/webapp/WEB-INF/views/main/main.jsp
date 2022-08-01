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

 <c:if test="${not empty loginResult and loginResult != '로그인 성공' }"> 
       <script> 
          alert('${loginResult }');
          history.back();
       </script> 
    </c:if> 
   <c:if test="${empty member }">
	<button onclick="location='${conPath}/member.do?method=loginForm'">로그인</button>
	</c:if>
	<c:if test="${not empty member }">
	<button onclick="location='${conPath}/member.do?method=logout'">로그아웃</button>
	</c:if>
		
	<button onclick="location='${conPath}/dongjun.do'">동준</button>
	<button onclick="location='${conPath}/jinyoung.do'">진영</button>
	<button onclick="location='${conPath}/yerin.do'">예린</button>
	<button onclick="location='${conPath}/zeoilm.do'">정임</button>
</body>
</html>