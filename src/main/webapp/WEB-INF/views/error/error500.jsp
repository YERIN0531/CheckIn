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
  <link href="${conPath }/css/error/error.css" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
	 $(document).ready(function(){
			$.ajax({
				url : '${conPath }/error.do',
				data : "method=error500",
				success : function(data){
					setTimeout(function(){
						location="${conPath }/main2.do";
					},3000);
				}
			});
		});
 </script>  
</head>
  <body>
  <div>
	<h1>문제가 발생했습니다. 잠시후 이용해 주세요.</h1>
	<h1>3초뒤에 메인페이지로 이동합니다.</h1>
  </div>
  </body>
</html>
