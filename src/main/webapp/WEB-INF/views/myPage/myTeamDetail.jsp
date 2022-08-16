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
  <c:if test="${deleteResult eq 1 }">
  	<script>
  		alert('추방완료');
  	</script>
  </c:if>
   <c:if test="${deleteResult eq 0 }">
  	<script>
  		alert('추방실패');
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
	<table>
		<tr>
			<td><p>${myTeamDetail[0].teamname }</p></td>
		</tr>
		<tr>
			<td><p>${myTeamDetail[0].tnum }</p></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>직급</th>
			<th>이름</th>
			<th>연락처</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>가입시점</th>
			<th>-</th>
		</tr>
		<c:forEach var="myTeam" items="${myTeamDetail }">
			<c:if test="${myTeam.tstep eq 0 }">
				<tr>
					<td>
						팀장
					</td>
					<td>
						${myTeam.mname }
					</td>
					<td>
						${myTeam.mtel }
					</td>
					<td>
						<c:if test="${myTeam.mgender eq 'M'}">
							남성
						</c:if>
						<c:if test="${myTeam.mgender eq 'F'}">
							여성
						</c:if>
					</td>
					<td>
						${myTeam.mbirth }
					</td>
					<td>
						${myTeam.ttrdate }
					</td>
				</tr>		
			</c:if>
		</c:forEach>	
			<c:forEach var="myTeam" items="${myTeamDetail }">
				<c:if test="${myTeam.tstep != 0 }">
				<tr>
					<td>
						팀원
					</td>
					<td>
						${myTeam.mname }
					</td>
					<td>
						${myTeam.mtel }
					</td>
					<td>
						<c:if test="${myTeam.mgender eq 'M'}">
							남성
						</c:if>
						<c:if test="${myTeam.mgender eq 'F'}">
							여성
						</c:if>
					</td>
					<td>
						${myTeam.mbirth }
					</td>
					<td>
						${myTeam.ttrdate }
					</td>
					<c:if test="${member.mid eq teamLeader }">
						<td>
							<button onclick="location='${conPath }/trip.do?method=deleteMemberTeam&tnum=${myTeam.tnum }&mid=${myTeam.mid }&teamname=${myTeam.teamname }'" class="buttons">추방하기</button>
						</td>
					</c:if>
				</tr>
				</c:if>
			</c:forEach>
	
	</table>
	</div></div>
	</section>
		<jsp:include page="../main/footer.jsp" />
  </body>
</html>
