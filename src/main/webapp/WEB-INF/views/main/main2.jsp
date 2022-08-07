<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/main/main.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap"
	rel="stylesheet">

<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<c:if test="${not empty loginResult and loginResult != '로그인 성공' }">
		<script>
			alert('${loginResult }');
			history.back();
		</script>
	</c:if>
	<c:if
		test="${not empty managerLogin and managerLogin != '관리자 로그인 성공' }">
		<script>
			alert('${managerLogin }');
			history.back();
		</script>
	</c:if>
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

	<section>
		<div id="main">
			<table id="mt">
				<tr>
					<td id="one"></td>
					<td id="two"><a href="${conPath }/air.do?method=airMain">AIR<br>RESERVATION
					</a>
						<div>&nbsp;</div>
						<p>
							This is a page where you can reserve the airplne.<br /> If you
							want to see the list of airschedule list ,<br /> press this
							letter
						</p></td>
				</tr>
				<tr>
					<td id="three"><a href="#">HOTEL<br>RESERVATION
					</a>
						<div>&nbsp;</div>
						<p>
							This is a page where you can reserve the acomodation.<br /> If
							you want to see the list of hotel list ,<br /> press this letter
						</p></td>
					<td id="four"></td>
				</tr>
				<tr>
					<td id="five"></td>
					<td id="six"><a href="#">DUTYFREE<br>RESERVATION
					</a>
						<div>&nbsp;</div>
						<p>
							This is a page where you can see the dutyfree products.<br /> If
							you want to see the list of product list,<br /> press this
							letter
						</p></td>
				</tr>
			</table>
		</div>
	</section>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
