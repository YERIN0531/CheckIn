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
  <link href="${conPath }/css/hotel/hoteldetail.css" rel="stylesheet">
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
  <c:if test="${empty member and empty manager }">
  	<script>
  		alert('로그인 후 이용해주세요');
  		location="${conPath }/member.do?method=loginForm";
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
  
	<h2> ROOM DETAIL</h2>
	
	<div id="hotelname">
	<p class="p1">${hotelDetail[0].hotelname }</p>
	<p class="p2"><img src="${conPath }/hotelImg/placeholder.png" class="placehold">${param.hoteladdress }</p>
	<p class="p3"><img src ="${conPath }/hotelImg/${param.hotelimage}"></p>	
	</div>
	
	
	
	
	<div id="hotelchange">
	<form action="${conPath }/hotel.do?method=getHotelDetail" method="post">
		<input type="hidden" name="hoteladdress" value="${param.hoteladdress }">
		<input type="hidden" name="hotelimage" value="${param.hotelimage }">
		<input type="hidden" name="hotelid" value="${hotelDetail[0].hotelid.substring(0,3) }">
		<table>
			<caption>SCHEDULE CHANGE</caption>
			<tr>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>투숙객 인원수</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="schcheckindate" value="${hotelDto.schcheckindate }" required="required" id="datepicker">
				</td>
				<td>
					<input type="text" name="schcheckoutdate" value="${hotelDto.schcheckoutdate }" required="required" id="datepicker2">
				</td>
				<td>
					<input type="number" name="headcount" value="${hotelDto.headcount }" required="required">
				</td>
			</tr>
		</table>
		<div id="submitbutton"><input type="submit" value="조회"></div>
	</form>
	</div>
	
	<!--  ******************************************************************************************************-->
	<div id="roomstate">
	<table>  
		<c:if test="${checkHotelDetail.size() eq 0 }">
			<c:forEach var="hotel" items="${hotelDetail }" >
			<c:if test="${hotel.roomtype eq '스탠다드' }">
				<tr>
					<td>방 사진 : ${hotel.roomimage }</td>
					<td>스탠다드</td>
					<td>매진</td>						
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="hotel" items="${hotelDetail }">
			<c:if test="${hotel.roomtype eq '디럭스' }">
				<tr>
					<td>방 사진 : ${hotel.roomimage }</td>
					<td>디럭스</td>
					<td>매진</td>					
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="hotel" items="${hotelDetail }">
			<c:if test="${hotel.roomtype eq '스위트' }">
				<tr>
					<td>방 사진 : ${hotel.roomimage }</td>
					<td>스위트</td>
					<td>매진</td>					
				</tr>
			</c:if>
		</c:forEach>
		</c:if>
		</table>
		
		<c:set var="notStandard" value="0"/>
		<c:set var="notDeluxe" value="0"/>
		<c:set var="notSweet" value="0"/>
		
		
		<c:if test="${checkHotelDetail.size() != 0 }">
		<div id="standard">
			<table>	
				<c:forEach var="hotel" items="${checkHotelDetail }" >			
					<c:if test="${hotel.roomtype eq '스탠다드' }">
						<tr>	
							<td rowspan="7"><img src="${conPath }/hotelImg/${hotel.roomimage }"></td>
							<td class="t-1">스탠다드</td>
						</tr>
						<tr>
							<td class="t-2">요금에 포함된 인원 &nbsp;<img src="${conPath }/hotelImg/user.png" class="user">X${hotelDto.headcount }</td>
						</tr>
						<tr>
							<td class="t-3">더블침대 1개 &nbsp;<img src="${conPath }/hotelImg/bed2.png" class="bed2"></td>
						</tr>
						<tr>
							<td class="t-4"><b>1박</b> 요금 :</td>
						</tr>
						<tr>
							<td class="t-5"><fmt:formatNumber value="${hotel.roomprice }" pattern="￦ #,###" /></td>
						</tr>
						<tr>
							<td class="t-6">세금 및 기타 요금 포함</td>
						</tr>
						<tr>
							<td>
								<button onclick="location='${conPath }/hotel.do?method=insertHotelReservationView&hotelid=${hotel.hotelid }&schcheckindate=${hotelDto.schcheckindate }&schcheckoutdate=${hotelDto.schcheckoutdate }&headcount=${hotelDto.headcount }&roomprice=${hotel.roomprice }'">예약하기</button>				
							</td>					
						</tr>
					</c:if>
					<c:if test="${hotel.roomtype != '스탠다드' }">
						<c:set var="notStandard" value="${notStandard + 1 }" />
					</c:if>
				</c:forEach>		
			
				<c:if test="${checkHotelDetail.size() eq notStandard }">
					<c:forEach var="hotelDetail" items="${hotelDetail }">
						<c:if test="${hotelDetail.roomtype eq '스탠다드' }">
							<tr>
								<td><img src="${conPath }/hotelImg/${hotelDetail.roomimage }"></td>
								<td>${hotelDetail.roomtype }</td>
								<td>매진</td>
							</tr>
						</c:if>
					</c:forEach>	
				</c:if>
			</table>
		</div> <!-- standard -->
			
		<div id="deluxe">
			<table>	
				<c:forEach var="hotel" items="${checkHotelDetail }" >	
					<c:if test="${hotel.roomtype eq '디럭스' }">
						<tr>
							<td rowspan="7"><img src="${conPath }/hotelImg/${hotel.roomimage }"></td>
							<td class="t-1">디럭스</td>
						</tr>	
						<tr>
							<td class="t-2">요금에 포함된 인원 &nbsp;<img src="${conPath }/hotelImg/user.png" class="user">X${hotelDto.headcount }</td>
						</tr>
						<tr>
							<td class="t-3">싱글침대 1개<img src="${conPath }/hotelImg/bed.png" class="bed1">&nbsp;더블침대 1개<img src="${conPath }/hotelImg/bed2.png" class="bed2"></td>
						</tr>
						<tr>
							<td class="t-4">1박요금</td>
						</tr>
						<tr>
							<td class="t-5"><fmt:formatNumber value="${hotel.roomprice }" pattern="￦ #,### " /></td>		
						</tr>
						<tr>
							<td class="t-6">세금 및 기타 요금 포함</td>
						</tr>
						<tr>	
							<td>
							
								<button onclick="location='${conPath }/hotel.do?method=insertHotelReservationView&hotelid=${hotel.hotelid }&schcheckindate=${hotelDto.schcheckindate }&schcheckoutdate=${hotelDto.schcheckoutdate }&headcount=${hotelDto.headcount }&roomprice=${hotel.roomprice }'">예약하기</button>			
							</td>			
						</tr>
					</c:if>
					<c:if test="${hotel.roomtype != '디럭스' }">
						<c:set var="notDeluxe" value="${notDeluxe + 1 }" />
					</c:if>
				</c:forEach>
				<c:if test="${checkHotelDetail.size() eq notDeluxe }">
					<c:forEach var="hotelDetail" items="${hotelDetail }">
						<c:if test="${hotelDetail.roomtype eq '디럭스' }">
							<tr>
								<td><img src="${conPath }/hotelImg/${hotelDetail.roomimage }"></td>
								<td>${hotelDetail.roomtype }</td>
								<td>매진</td>
							</tr>
						</c:if>
					</c:forEach>	
				</c:if>
			</table>
		</div>
					
		<div id="sweet">
			<table>	
				<c:forEach var="hotel" items="${checkHotelDetail }" >	
					<c:if test="${hotel.roomtype eq '스위트' }">
						<tr>
							<td rowspan="7"><img src="${conPath }/hotelImg/${hotel.roomimage }"></td>
							<td class="t-1">스위트</td>
						</tr>
						<tr>
							<td class="t-2">요금에 포함된 인원 &nbsp;<img src="${conPath }/hotelImg/user.png" class="user">X${hotelDto.headcount }</td>
						</tr>	
						<tr>
							<td class="t-3">더블침대 2개&nbsp;<img src="${conPath }/hotelImg/bed2.png" class="bed2"><img src="${conPath }/hotelImg/bed2.png" class="bed2"></td>
						</tr>
						<tr>
							<td class="t-4">1박요금</td>
						</tr>
						<tr>
							<td class="t-5"><fmt:formatNumber value="${hotel.roomprice }" pattern="￦ #,### " /></td>	
						</tr>
						<tr>
							<td class="t-6">세금 및 기타 요금 포함</td>
						</tr>
						<tr>	
							<td>
								<button onclick="location='${conPath }/hotel.do?method=insertHotelReservationView&hotelid=${hotel.hotelid }&schcheckindate=${hotelDto.schcheckindate }&schcheckoutdate=${hotelDto.schcheckoutdate }&headcount=${hotelDto.headcount }&roomprice=${hotel.roomprice }'">예약하기</button>				
							</td>				
						</tr>
					</c:if>
					<c:if test="${hotel.roomtype != '스위트' }">
						<c:set var="notSweet" value="${notSweet + 1 }"/>
					</c:if>
				</c:forEach>					
				<c:if test="${checkHotelDetail.size() eq notSweet }">
					<c:forEach var="hotelDetail" items="${hotelDetail }">
						<c:if test="${hotelDetail.roomtype eq '스위트' }">
							<tr>
								<td><img src="${conPath }/hotelImg/${hotelDetail.roomimage }"></td>
								<td>${hotelDetail.roomtype }</td>
								<td>매진</td>
							</tr>
						</c:if>
					</c:forEach>	
				</c:if>
			</table>
		</div>
			
		</c:if>
		
		
	</div><!-- roomstate -->
		<jsp:include page="../main/footer.jsp"/>
  </body>
</html>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
   $(function() {
	   
	   $("#datepicker,#datepicker2").datepicker(
	            {            
	               dateFormat : 'yy-mm-dd',
	               changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
	               changeYear:true,
	               monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	                                 '7월', '8월', '9월', '10월', '11월', '12월' ],
	               showMonthAfterYear : true,
	               yearSuffix : '년', // "2020년 3월"
	               showOtherMonths : true,
	               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	               changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
	               minDate : 0, // 현재 날짜로부터 100년 이전까지 표시
	               maxDate : '10y', // 현재 날짜이전까지만 표시
	               yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
	            });

       $('#datepicker').datepicker("option", "maxDate", $("#datepicker2").val());
       $('#datepicker').datepicker("option", "onClose", function (selectedDate){
           $("#datepicker2").datepicker( "option", "minDate", selectedDate );
           });
       
       $('#datepicker2').datepicker();
       $('#datepicker2').datepicker("option", "minDate", $("#datepicker").val());
       $('#datepicker2').datepicker("option", "onClose", function (selectedDate){
           $("#datepicker").datepicker( "option", "maxDate", selectedDate );
          });
   });  
</script>


