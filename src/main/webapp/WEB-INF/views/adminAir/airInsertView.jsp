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
  <link href="${conPath }/css/manager/managerairinsert.css" rel="stylesheet">
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
				<li><img src="${conPath }/image/slide1.png"></li>
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

	<div id="logos">
        <p>AIR REGISTER</p>
    </div>
  <section>
  	<form action="${conPath }/air.do?method=airInsert" method="post">
		<div id="joinform">
	  		<table>
	  		<caption>CHECK IN</caption>
	  			<tr><th>항공코드</th><td><input type="text" name="acode" placeholder="AIRCODE"></td></tr>
	  			<tr><th>항공사</th><td><input type="text" name="airline" placeholder="AIRLINE"></td></tr>
	  			<tr><th>출발지</th><td><input type="text" name="adepartloc"></td></tr>
	  			<tr><th>도착지</th><td><input type="text" name="aariveloc"></td></tr>
	  			<tr><th>가는날출발시간</th><td><input type="text" name="agotime"></td></tr>
	  			<tr><th>가는날도착시간</th><td><input type="text" name="ago_arrivetime"></td></tr>
	  			<tr><th>오는날도착시간</th><td><input type="text" name="acome_departtime"></td></tr>
	  			<tr><th>오는날도착시간</th><td><input type="text" name="acome_arrivetime"></td></tr>
	  			<tr><th>비행가격</th><td><input type="number" name="aprice" placeholder="AIRPRICE"></td></tr>
	  			<tr><td colspan="2"><input type="submit" value="등록"></td></tr>
	  		</table>
	  	</div>	
  	</form>
  	</section>
  		<jsp:include page="../main/footer.jsp" />
  </body>
</html>
