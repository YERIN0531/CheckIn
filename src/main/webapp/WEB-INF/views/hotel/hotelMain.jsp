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
  <link href="${conPath }/css/hotel/hotelmain.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('.hotelListTr').click(function(){
			var hotelid = $(this).children().eq(0).text();
				location.href='${conPath }/hotel.do?method=getHotelDetail&hotelid='+hotelid+'&schcheckindate=${hotel.schcheckindate }&schcheckoutdate=${hotel.schcheckoutdate }&headcount=${hotel.headcount }';
		});
	});
</script> 
</head>
  <body>
  <jsp:include page="../main/header.jsp"/>
  <section>
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
	   
	    <div id="reserve">
            <div id="word">
                <p>HOTEL RESERVATION</p>
            </div>
            <div id="rsform">
	<form action="${conPath }/hotel.do?method=schHotel" method="post">
		<table>
			<tr>
				<td>
					<p class="w1">국가</p>
					<input type="text" name="schcountry" value="${hotel.schcountry }" placeholder="목적지를 입력하세요">
				</td>
				<td  class="td-2">
					<p class="w1">체크인</p>
					<input type="text" name="schcheckindate" required="required" value="${hotel.schcheckindate }" id="datepicker">
				</td>
				<td class="td-3">
				<p class="w1">체크아웃</p>
					<input type="text" name="schcheckoutdate" required="required" value="${hotel.schcheckoutdate }" id="datepicker2">
				</td>
				<td class="td-4">
					<p class="w1">투숙객</p>
					<input type="number" name="headcount" required="required" value="${hotel.headcount }">
				</td>
			</tr>
			<tr>
				<td colspan="3">					
					<input type="submit" value="호텔검색">
				</td>
			</tr>
		</table>
	</form>
      </div>
        </div>	
        
	<h2>HOTEL LIST</h2>
	 <c:if test="${empty hotelList}">
        <div id="noneairlist">
					<table>
					<tr><td>호텔 스케쥴을 검색해 주세요</td></tr>
					</table>
        </div>

		</c:if>
	
	
	
	
	<div id="airList">	
		<c:if test="${hotelList.size() != 0 }">
			<c:forEach var="hotel" items="${hotelList }">
				<div class="airticket">
				<table>
					<tr class="hotelListTr">
						<td id="hidden">${hotel.hotelid }</td>
						<td>호텔 이름 : ${hotel.hotelname }</td>
						<td>호텔 국가 : ${hotel.hotelcountry }</td>
						<td>호텔 주소 : ${hotel.hoteladdress }</td>
						<td>이미지 태그 써써 호텔 사진 뿌리십쇼 : ${hotel.hotelimage }</td>		
						<td><fmt:formatNumber value="${hotel.roomprice }" pattern="#,###" /></td>		
					</tr>
				</table>	
				</div>
			</c:forEach>
		</c:if>		
	</div>
	
	 </section>
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
