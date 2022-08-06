<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
</head>
<body>
   	<c:if test="${emailConfirmResult eq 1 }">중복된 email 입니다</c:if>
   	<c:if test="${emailConfirmResult eq 0 }">사용 가능한 메일입니다</c:if>
</body>
</html>