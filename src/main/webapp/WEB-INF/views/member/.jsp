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
	<c:if test="${idConfirmResult eq 1 }">
		<b style="color:red;">중복된 ID입니다.</b>
	</c:if>
	<c:if test="${idConfirmResult eq 0 }">
		<b style="color:green;">사용가능한 ID입니다.</b>
	</c:if>
  </body>
</html>