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
               <li><a href="#">항공권 조회</a></li>
               <li><a href="${conPath }/hotel.do?method=myHotelReservationList&mid=${member.mid }">호텔예약 조회</a></li>
               <li><a href="${conPath }/cart.do?method=orderDetailList">주문목록</a></li>
            </ul>
         </li>
         <li>
            <a href="#">시부렁시부렁</a>
            <ul class="submenu">
               <li><a href="${conPath }/trip.do?method=myTeamList">내 여행팀 조회</a></li>
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
   <jsp:include page="../main/footer.jsp" />
  </body>
</html>
