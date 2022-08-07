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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
<body>
 	<table>
 	<c:if test="${manager.aid == 'admin' }">
<button onclick="location='manager.do?method=managerDelete&aid=${managerDto.aid}'">삭제</button>
 	</c:if>
 	   <caption>관리자 상세보기 </caption>
 	   <tr>
 	     <th>아이디</th>
 	         <td>${managerDto.aid }</td>
 	   </tr>
 	    <tr>
 	     <th>직책</th>
 	         <td>${managerDto.aname }</td>
 	   </tr>      
 	    <tr>
 	     <th>이메일</th>
 	         <td>${managerDto.aemail }</td>
 	   </tr>            
 	</table>
   
</body>
</html>