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
  <link href="${conPath }/css/hotel/hotelpay.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
  <style>
.hotelword {
                padding-left: 4px;
                background: url("${conPath }/image/hotel4.png") no-repeat;
                width: 100%;
                height: 350px;
            }
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function(){
 		var roomprice = Number('${payprice }');
 		var mmileage = Number($('input[name=mmileage]').val());
 		$('.result').val(roomprice - mmileage); 		
 		$('input[name="mmileage"]').keyup(function(){
 			var roomprice = Number('${payprice }');
 			var mmileage = Number($('input[name=mmileage]').val());
 			if(mmileage > Number('${member.mmileage }') ){
 				mmileage = Number('${member.mmileage}');
 				$('input[name="mmileage"]').val(Number('${member.mmileage }'));
 			}
 			$('.result').val(roomprice - mmileage);
 		});
 	});
 </script>  
</head>
  <body>
  <jsp:include page="../main/header.jsp"/>
     <div id="list">
	         <div id="lnb">
	              <ul>
	                   <li><a href="${conPath }/air.do?method=airMain">항공</a></li>
	                   <li><a href="${conPath }/hotel.do?method=hotelMain">호텔</a></li>
	                   <li><a href="#">면세점</a></li>
	                   <li><a href="${conPath}/notice.do?method=boardmain">게시판</a></li>
	              </ul>
	         </div>
	   </div>
	   
  	<div class="hotelword">
            <div id="word">
                <p>HOTEL RESERVATION</p>
            </div>
	</div>
  		<form action="${conPath }/hotel.do?method=insertHotelReservation" method="post" >
  			<input type="hidden" name="mid" value="${member.mid }">
  			<input type="hidden" name="hotelid" value="${hotel_rs.hotelid }">
  			<input type="hidden" name="checkin" value="${hotel_rs.checkin }">
  			<input type="hidden" name="checkout" value="${hotel_rs.checkout }">
  			<input type="hidden" name="headcount" value="${hotel_rs.headcount }">
		<h1>결제 페이지입니다.</h1>
		<hr>
		<div>${hotelname }</div>
		<div>호텔 사진 이미지태그쓰세요 누나 : ${roomimage }</div>
		<div>방 타입 : ${roomtype }</div>
		<div>상품 가격 : <fmt:formatNumber value="${payprice }" pattern="#,###"/></div>
		<div>사용 가능 마일 리지 : <input type="number" name="mmileage" value="${member.mmileage }" ></div>
		<div> 결제 가격 : <input type="number" name="paymoney" value=""  class="result" readonly="readonly" > </div> 
		<input type="submit" value="결제하기">
		<input type="button" value="뒤로가기" onclick="history.back()">
		</form>
	<jsp:include page="../main/footer.jsp"/>	
  </body>
</html>
