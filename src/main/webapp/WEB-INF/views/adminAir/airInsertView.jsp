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
  	<form action="${conPath }/air.do?method=airInsert" method="post">
  		<table>
  			<tr><td>항공코드</td><td><input type="text" name="acode"></td></tr>
  			<tr><td>항공사</td><td><input type="text" name="airline"></td></tr>
  			<tr><td>출발지</td><td><input type="text" name="adepartloc"></td></tr>
  			<tr><td>도착지</td><td><input type="text" name="aariveloc"></td></tr>
  			<tr><td>가는날출발시간</td><td><input type="text" name="agotime"></td></tr>
  			<tr><td>가는날도착시간</td><td><input type="text" name="ago_arrivetime"></td></tr>
  			<tr><td>오는날도착시간</td><td><input type="text" name="acome_departtime"></td></tr>
  			<tr><td>오는날도착시간</td><td><input type="text" name="acome_arrivetime"></td></tr>
  			<tr><td>비행가격</td><td><input type="number" name="aprice"></td></tr>
  			<tr><td colspan="2"><input type="submit" value="등록"></td></tr>
  		</table>
  	</form>
  </body>
</html>
