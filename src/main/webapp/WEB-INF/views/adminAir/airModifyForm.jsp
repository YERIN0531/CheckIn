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
  <link href="${conPath }/css/manager/managerairmodify.css" rel="stylesheet">
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
        <p>AIR MODIFY</p>
    </div>
   <section> 
   <div id="content">
	   <form action="${conPath }/air.do?method=airModify" method="post">
	   <input type="hidden" name="acode" value="${airdetail.acode }">
	  		<table>
	  			<caption>${airdetail.acode }의 항공스케쥴 수정하기</caption>
	  			<tr><th>가는날출발시간</th><td><input type="text" name="agotime" value="${airdetail.agotime }"></td></tr>
	  			<tr><th>가는날도착시간</th><td><input type="text" name="ago_arrivetime" value="${airdetail.ago_arrivetime }"></td></tr>
	  			<tr><th>오는날도착시간</th><td><input type="text" name="acome_departtime" value="${airdetail.acome_departtime }"></td></tr>
	  			<tr><th>오는날도착시간</th><td><input type="text" name="acome_arrivetime" value="${airdetail.acome_arrivetime }"></td></tr>
	  			<tr><th>비행가격</th><td><input type="number" name="aprice" value="${airdetail.aprice }"></td></tr>
	  			<tr><td colspan="2" class="btn"><input type="submit" value="수정"></td></tr>
	  		</table>
	  	</form>
  	</div>
  	</section>
  		<jsp:include page="../main/footer.jsp" />
  </body>
</html>
