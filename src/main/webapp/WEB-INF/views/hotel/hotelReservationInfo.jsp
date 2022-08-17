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
  <link href="${conPath }/css//hotel/hotelreserveinfo.css" rel="stylesheet">
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
//  		var roomprice = Number('${payprice }');
//  		var mmileage = Number($('input[name=mmileage]').val());
//  		$('.result').val(roomprice - mmileage); 		
//  		$('input[name="mmileage"]').keyup(function(){
//  			var roomprice = Number('${payprice }');
//  			var mmileage = Number($('input[name=mmileage]').val());
//  			if(mmileage > Number('${member.mmileage }') ){
//  				mmileage = Number('${member.mmileage}');
//  				$('input[name="mmileage"]').val(Number('${member.mmileage }'));
//  			}
//  			$('.result').val(roomprice - mmileage);
//  		});
 		var roomprice = Number('${param.roomprice }');
 		var mmileage = Number($('input[name=mmileage]').val());
 		$('.result').val(roomprice - mmileage); 		
 		$('input[name="mmileage"]').keyup(function(){
 			var roomprice = Number('${param.roomprice }');
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
	                   <li><a href="${conPath}/taxfree.do?method=category">면세점</a></li>
	                   <li><a href="${conPath}/notice.do?method=boardmain">게시판</a></li>
	              </ul>
	         </div>
	   </div>
	   
  	<div class="hotelword">
            <div id="word">
                <p>HOTEL RESERVATION</p>
            </div>
	</div>
	
	
	<c:if test="${empty member }">
		<script>
			alert('로그인 후 이용하실수 있습니다.');
			location='${conPath}/member.do?method=loginForm';
		</script>
	</c:if>
	
	<div id="reserveCheck">
		<div id="reservetitle"><p>RESERVE CHECK</p></div>
		

			<form action="${conPath }/hotel.do?method=insertHotelReservation" method="post" >
				<input type="hidden" name="mid" value="${member.mid }">	
				<input type="hidden" name="hotelid" value="${reservationInfo.hotelid }">
				<input type="hidden" name="checkin" value="${reservationInfo.schcheckindate }">
  				<input type="hidden" name="checkout" value="${reservationInfo.schcheckoutdate }">
  				<input type="hidden" name="headcount" value="${reservationInfo.headcount }">
			<div id="reservehotel">
				<table>
					<tr>
						<td class="td-1">${hotelInfo[0].hotelname }</td>
					</tr>
					<tr>
						<td class="td-2">${reservationInfo.schcheckindate } - ${reservationInfo.schcheckoutdate } </td>
					</tr>
				</table>
			</div> <!--  reservehotel -->
			
			<div id="mainInfo">
				<div id="hotelInfo">
					<table> 
						<tr>
							<td class="td-3"><p>We have confirmed your hotel reservation with the property</p></td>
						</tr>
						<tr>
							<td class="td-4">
								<img src="${conPath }/hotelImg/${hotelInfo[0].hotelimage }">
							</td>
						</tr>
						<tr>
							<td class="td-5">
								${hotelInfo[0].hotelname }
								<input type="hidden" name="hotelname" value="${hotelInfo[0].hotelname }">
							</td>
						</tr>
						<tr>
							<td class="td-6">
								${hotelInfo[0].hoteladdress }
							</td>
						</tr>
						<tr><td><hr></td></tr>
						<tr>
							<td class="td-7"><p>CHECK-IN / CHECK-OUT</p></td>
						</tr>
						<tr>
							<td class="td-8">
								${reservationInfo.schcheckindate } /${reservationInfo.schcheckoutdate }
							</td>
						</tr>
						<tr>
							<td class="td-9">
								<ul>
									<li> - Check-in time starts at 1PM</li>
									<li> - Your room will be guranteedforlate arrival</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="td-10"><p>인원수</p></td>
						</tr>
						<tr>
							<td class="td-11">
							${reservationInfo.headcount } 명
							</td>
						</tr>
						<tr>
							<td class="td-12">방 타입</td>
						</tr>
						<tr>
							<td class="td-13">
								<c:forEach var="resInfo" items="${hotelInfo }">
									<c:if test="${resInfo.hotelid eq reservationInfo.hotelid }">
										${resInfo.roomtype }
										<input type="hidden" name="roomtype" value="${resInfo.roomtype }">
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td class="td-14">
								<c:forEach var="resInfo" items="${hotelInfo }">
									<c:if test="${resInfo.hotelid eq reservationInfo.hotelid }">
										 <img src="${conPath }/hotelImg/${resInfo.roomimage }">
										<input type="hidden" name="roomimage" value="${resInfo.roomimage }">
									</c:if>
								</c:forEach>
							</td>
						</tr>
					
						</table>
				</div><!-- hotelInfo -->
					
					<div id="rightInfo">
						<table>
							<tr>
								<td class="td-15"><p>Price Summary</p></td>
							</tr>
							<tr>
								<td class="td-23">TOTAL PRICE</td>
							</tr>
							<tr >
							<td class="td-16">
								<c:forEach var="resInfo" items="${hotelInfo }">
									<c:if test="${resInfo.hotelid eq reservationInfo.hotelid }">
										 <fmt:formatNumber value="${resInfo.roomprice }" pattern="￦ #,### " />
										<input type="hidden" name="payprice" value="${resInfo.roomprice }">
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
						<td class="td-17"><p>Member Information</p></td>
						</tr>
						<tr>
							<td class="td-18">회원아이디</td>
						</tr>
							<tr>
								<td class="td-19">
								${member.mid } 
								</td>
							</tr>
							<tr><td class="td-24">예약자 성함</td></tr>
							<tr>
								<td class="td-20">
								 ${member.mname }
								</td>
							</tr>
							<tr><td class="td-25">예약자성함</td></tr>
							<tr>
								<td class="td-21">
									 ${member.mtel }
								</td>
							</tr>
							<!-- 수정된 부분 -->
							<tr>
								<td class="td-17"><p>PAYMENT</p></td>
							</tr>
							<tr>
								<td class="td-27">호텔가격</td>
							</tr>
							<tr>
								<td class="td-28"><fmt:formatNumber value="${param.roomprice }" pattern="￦ #,###"/></td>
							</tr>
							<tr>
								<td class="td-29">사용가능 마일리지</td>
							</tr>
							<tr>
								<td class="td-26"><input type="number" name="mmileage" value="${member.mmileage }" ></td>
							</tr>
							<tr>
								<td class="td-29">최종결제가격</td>
							</tr>
							<tr>
								<td class="td-26"><input type="number" name="paymoney" value=""  class="result" readonly="readonly" ></td>
							</tr>
							
							<tr><td><hr></td></tr>
							<tr>
								<td class="td-22">
									예약 정보를 모두 확인하셨습니까?
								</td>
							</tr>
							<tr>
								<td class="td-23">
									<input type="submit" value="예약하기">
									<input type="button" value="뒤로가기" onclick="history.back()">
								</td>
							</tr>
					</table>
				</div><!--  rightInfo -->
			</div> <!-- mainInfo -->
			</form>
		</div>
		  <jsp:include page="../main/footer.jsp"/>
  </body>
</html>
