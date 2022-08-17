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
  <link href="${conPath }/css/main/reserveresult.css" rel="stylesheet">
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

<c:if test="${reserveResult eq 0 }">
   <script>
      alert('예약 실패하셧습니다.');
      history.back();
   </script>
</c:if>
  	<c:if test="${insertHotelReservation eq 0 }">
  		<script>
  			alert('예약에 실패하였습니다. 다시 시도해주세요.');
  			history.back();
  		</script>
  	</c:if>
  	
  	<jsp:include page="../main/header.jsp"/>
     <div id="list">
	         <div id="lnb">
	              <ul>
	                   <li><a href="${conPath }/air.do?method=airMain">항공</a></li>
	                   <li><a href="${conPath }/hotel.do?method=hotelMain">호텔</a></li>
	                   <li><a href="${conPath}/taxfree.do?method=category">면세점</a></li>
	                   <li><a href="${conPath}/notice.do?method=boardmain">게시판</a></li>
	              </ul>
	         </div>
	   </div>
	   
  	<div id="reserve">
            <div id="word">
                <p>HOTEL RESERVATION</p>
            </div>
	</div>
  	
  <section>	
	<div id="reserveResult"> 
		<div id="reservetable"> 	
		 	<p class="p1">예약이 완료되었습니다.</p>
		 	<p class="p2">예약내역은 마이페이지에서 확인하실수 있습니다.<p>
		 	<button onclick="location='${conPath }/main2.do'">MAIN</button>
		 	<button onclick="location='${conPath}/member.do?method=myPage'">MYPAGE</button>
	 	</div>
	 </div>
  </section>
  
	 <jsp:include page="../main/footer.jsp"/>
  </body>
</html>







