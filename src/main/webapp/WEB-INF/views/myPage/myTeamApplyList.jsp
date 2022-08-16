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
 <style>
 #teamdetail table caption{
	font-size:1.2em;
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-weight: bold;
		color:#2c4451;
		margin-bottom: 20px;
}
 </style>
</head>
  <body>
	<c:if test="${myteamApplyList.size() eq 0 }">
		<script>
			alert('신청한 사람이 없습니다.');
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
        <p>MYPAGE</p>
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
               <li><a href="${conPath }/cart.do?method=orderDetailList">주문 조회</a></li>
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
	 <div id="teamdetail">   
	
	<c:if test="${myteamApplyList.size() != 0 }">
		<table>
			<caption>요청 목록</caption>
				<tr>
					<th>팀 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>성별</th>
					<th>한줄메모</th>
					<th>신청일</th>
					<th>-</th>
				</tr>
			<c:forEach var="applyList" items="${myteamApplyList }">
				<tr>
					<td>${applyList.tnum }</td>
					<td>${applyList.mid }</td>
					<td>${applyList.mname }</td>
					<td>${applyList.mbirth }</td>
					<td>${applyList.mtel }</td>
					<td>
						<c:if test="${applyList.mgender eq 'M' }">
							남성
						</c:if>
						<c:if test="${applyList.mgender eq 'F' }">
							여성
						</c:if>
					</td>
					<td>${applyList.trmemo }</td>
					<td>${applyList.trrdate }</td>
					<td class="btn">
						<button onclick="location='${conPath }/trip.do?method=agreeTeam&tnum=${applyList.tnum }&mid=${applyList.mid }'" class="buttons">수락하기</button>
						<button onclick="location='${conPath }/trip.do?method=disagreeTeam&tnum=${applyList.tnum }&mid=${applyList.mid }'" class="buttons">거절하기</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	</div>
	</section>
  </body>
</html>
