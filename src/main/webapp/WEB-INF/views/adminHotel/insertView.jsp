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
  <link href="${conPath }/css/manager/managerhotelinsert.css" rel="stylesheet">
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

	<div id="logos">
        <p>HOTEL REGISTER</p>
    </div>
    
    <section>
	<form action="${conPath }/hotel.do?method=adminInsertHotel" method="post" enctype="multipart/form-data"> 
		<div id="joinform">
		<table>
			<caption>CHECK IN</caption>
			<tr>
				<th>호텔 이름</th>
				<td>
					<input type="text" name="hotelname" placeholder="호텔 이름을 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<th>호텔 일련번호</th>
				<td>
					<input type="text" name="hotelid" placeholder="알파벳 3글자를 입력하세요" required="required">
				</td>
			</tr>
			<tr>
				<th>호텔 국가</th>
				<td>
					<input type="text" name="hotelcountry">
				</td>
			</tr>
			<tr>
				<th>호텔 주소</th>
				<td>
					<input type="text" name="hoteladdress">
				</td>
			</tr>
			<tr>
				<th>호텔 사진</th>
				<td>
					<input type="file" name="temphotelimage">
				</td>
			</tr>
			<tr>
				<th>스탠다드 가격</th>
				<td>
					<input type="number" name="standardprice">
				</td>
			</tr>
			<tr>
				<th>스탠다드 사진</th>
				<td>
					<input type="file" name="tempstandardimage">
				</td>
			</tr>
			<tr>
				<th>디럭스 가격</th>
				<td>
					<input type="number" name="deluxeprice">
				</td>
			</tr>
			<tr>
				<th>디럭스 사진</th>
				<td>
					<input type="file" name="tempdeluxeimage">
				</td>
			</tr>
			<tr>
				<th>스위트 가격</th>
				<td>
					<input type="number" name="sweetprice">
				</td>
			</tr>		
			<tr>
				<th>스위트 사진</th>
				<td>
					<input type="file" name="tempsweetimage">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
		</div>
	</form>
	</section>
	  	<jsp:include page="../main/footer.jsp" />
  </body>
</html>
