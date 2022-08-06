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
 		get_rate();
 	});
 	function get_rate(){
 		$.ajax({
 			type : "GET",
 			url : "http://spartacodingclub.shop/sparta_api/rate",
 			data : {},
 			success : function (response){
 				let now_rate = response['rate'];
 				$('#now-rate').text(now_rate);
 			}
 		})
 	}
 </script>  
</head>
  <body>
	<p class="rate">달러-원 환율: <span id="now-rate">1219.15</span></p>
  </body>
</html>
