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
<link href="${conPath }/css/member/myPage.css" rel="stylesheet">
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
        <p>AIRTICKET</p>
    </div>
  
  
  <section>
	<div id="navigation">
      <ul class="menu">
         <li>
            <a href="#">마이 페이지</a>
            <ul class="submenu">
               <li><a href="${conPath }/member.do?method=modifyPWCheck&modify=all">개인정보 변경</a></li>  
               <li><a href="${conPath }/member.do?method=modifyPWCheck&modify=pw">비밀번호 변경</a></li>
               <li><a href="${conPath }/member.do?method=modifyPWCheck&modify=mileage">마일리지 조회</a></li>
            </ul>
         </li>
         <li>
            <a href="#">조회</a>
            <ul class="submenu">
               <li><a href="${conPath }/air.do?method=myAirReserveList&mid=${member.mid }">항공권 조회</a></li>
               <li><a href="${conPath }/hotel.do?method=myHotelReservationList&mid=${member.mid }">호텔예약 조회</a></li>
               <li><a href="${conPath }/cart.do?method=orderDetailList">주문조회</a></li>
                <li><a href="${conPath }/trip.do?method=myTeamList">내 여행팀 조회</a></li>
            </ul>
         </li>
         <li>
            <a href="#">기타</a>
            <ul class="submenu">
              
               <li><a href="#">예약 조회</a></li>
               <li><a href="#">배송 조회</a></li>
            </ul>
         </li>
         <li>
            <a href="#">회원탈퇴</a>
            <ul class="submenu">
               <li><a href="#">회원 탈퇴</a></li>
            </ul>
         </li>
      </ul>
   </div>
  
  
    <div id="content">
  <div id="reservedair">
          <div id="airlist">

            <c:forEach var="airList" items="${myAirReserveList }">
                <div class="airticket">
                    <table>
                    
                        <tr>
                        <td rowspan="2" >${airList.acode }</td>
                            <td>${airList.adepartloc }</td>
                            <td>------------------------</td>
                            <td>${airList.aariveloc }</td>
                            <td rowspan="2" colspan="2" class="w3">
                            ${airList.aprice} / ${airList.seatid }
                            </td>
                        </tr>
                        <tr>
                               <td>${airList.agodate }</td>
                              <td>------------------------</td>
                               <td>${airList.acomedate }</td>
                        </tr>
                    </table>
                </div>
            </c:forEach>
            </div>
            </div>
        </div>
  
  
  
<!--   <div id="content"> -->
<!--   <div id="reservedair"> -->
<%-- 		<c:forEach var="airList" items="${myAirReserveList }"> --%>
<!-- 	<div class="airticket"> -->
<!-- 		<table> -->
<%-- 			<caption>RESERVED AIR</caption>			 --%>
		
<!-- 				<tr> -->
<!-- 					<th>출발 도시</th> -->
<%-- 					<td>${airList.adepartloc }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>도착 도시</th> -->
<%-- 					<td>${airList.aariveloc }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>좌석 번호</th> -->
<%-- 					<td>${airList.seatid }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>가는날</th> -->
<%-- 					<td>${airList.agodate }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>오는날</th> -->
<%-- 					<td>${airList.acomedate }</td> --%>
<!-- 				</tr> -->
	
	
<!-- 		</table>		 -->
<!-- 	</div>		  -->
<%-- 		</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->
	</section>
	 <jsp:include page="../main/footer.jsp" />
  </body>
</html>
