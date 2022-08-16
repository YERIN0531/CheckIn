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
  <link href="${conPath }/css/manager/managermain.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function(){
 		
 	});
 </script>  
</head>
  <body>
	<jsp:include page="../main/header.jsp" />
	<div class="slider">
		<div class="image">
			<input type="radio" name="slide" id="slide1" checked>
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio" name="slide" id="slide3"> <input type="radio" name="slide" id="slide4">
			<ul id="imgholder" class="imgs">
					<li><img src="${conPath }/image/main8.png"></li>
				<li><img src="${conPath }/image/slide3.png"></li>
				<li><img src="${conPath }/image/slide2.png"></li>
				<li><img src="${conPath }/image/slide22.png"></li>
			</ul>
		</div>
		<div class="bullets">
			<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
			<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
		</div>
	</div>
	
	<section>
		<div id="main">
			<table>
				<tr>
					<td id="one"></td>
					<td id="two"></td>
					<td id="three"></td>
					<td id="four"></td>
				</tr>
				<tr>
					<td id="five">
						<a href="${conPath }/air.do?method=allAirList">AIR<br>MANAGE</a>
						<div>&nbsp;</div>
						<p>
						press this letter
						</p>
					</td>
					<td id="six">
						<a href="${conPath }/hotel.do?method=adminHotelList">HOTEL<br>MANAGE</a>
						<div>&nbsp;</div>
						<p>
						press this letter
						</p>
					</td>
					<td id="seven">
						<a href="${conPath}/taxfree.do?method=category">DUTYFREE<br>MANAGE</a>
						<div>&nbsp;</div>
						<p>
						press this letter
						</p>
					</td>
					<td id="eight">
						<a href="${conPath}/notice.do?method=boardmain">BOARD<br>MANAGE</a>
						<div>&nbsp;</div>
						<p>
						press this letter
						</p>
					</td>
				</tr>	
			
			
			</table>		
		</div>
	</section>
<jsp:include page="../main/footer.jsp" />
	
  </body>
</html>






















