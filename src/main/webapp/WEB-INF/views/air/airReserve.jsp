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
  <link href="${conPath }/css/air/airseat.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>


 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
 <script>
		$(document).ready(function(){
			//checkbox 이벤트
			$('input[type="checkbox"]').click(function(){
				var seatid = $(this).attr('id');
				var checked = $(this).is(':checked');
				if(checked){
					$('.img'+seatid).attr('src','${conPath }/image/check.png');
				}else {
					$('.img'+seatid).attr('src','${conPath }/image/uncheck.png');
				}
			});
			//좌석 선택마다 항공가격 변동 되는 부분
			
			$("input[type='checkbox']").click(function(){
				var checknum = $("input:checkbox[name='seatid']:checked").length;
		 		var totalprice = Number('${airDto.aprice}')*checknum;
	 			$('input[name="totalprice"]').val(totalprice);
			});
			$("input[type='checkbox']").click(function(){
				var checknum = $("input:checkbox[name='seatid']:checked").length;
				$('input[name="checknum"]').val(checknum);
			});
			
			$('form').submit(function(){
				var checknum = $("input:checkbox[name='seatid']:checked").length;
				if(checknum <= 0 ){
					alert('좌석을 선택해주세요');
					return false;
				}
			});
			
		});
	</script> 
</head>
  <body>
  <jsp:include page="../main/header.jsp"/>
  	<div id="reserve">
            <div id="word">
                <p>AIR RESERVATION</p>
            </div>
	</div>
  
  
  
  <div id="formdiv">
  
   <form action="${conPath }/air.do">
    	<input type="hidden" name="method" value="airReserveInfo">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="acode" value="${param.acode }">
 		<input type="hidden" name="agodate" value="${airDto.agodate }">
 		<input type="hidden" name="acomedate" value="${airDto.acomedate }">
 		<input type="hidden" name="aprice" value="${airDto.aprice }">
 		<input type="hidden" name="checknum">
 		
 			 <div id="seatprice">
                    <table>
                    	<caption>TOTAL AIRPRICE</caption>
                        <tr><td class="t2">총 항공 가격</td></tr>
                        <tr><td class="t3"><input type="text" name="totalprice" value="${airDto.aprice}" /></td></tr>
                        <tr><td class="t4">예약자정보</td></tr>
                        <tr><td><input type="text" name="cname" placeholder="이름"></td></tr> 
                        <tr><td><input type="text" name="cemail" placeholder="이메일주소"></td></tr>
                        <tr><td><input type="text" name="cphone" placeholder="휴대폰번호"></td></tr>
                        <tr><td class="t5"> <input type="submit" value="예약하기"></td></tr>
                    </table>
                </div><!--seatprice-->
 	<div id="seatback">
		<div id="seat">
		
		<div id="seat2">
		  <c:forEach var="i" begin="0" end="19">
			<c:set var="seatid" value="A${i+1 }"/>
				<c:if test="${seats.get(i) == '' }">
					<label for="A${i+1 }">
<%-- 					<span  class="span1 imgA${i+1 }">${seatId}</span> --%>
					<img src="${conPath }/image/uncheck.png" class="imgA${i+1 }">
					</label>
					<input type="checkbox" name="seatid" value="A${i+1}" id="A${i+1 }">
				</c:if>
				
				<c:if test="${seats.get(i) != '' }">
					<label for="A${i+1 }">
<%-- 					<span class="span2">${seatid}</span> --%>
					<img src="${conPath }/image/reserved.png" class="imgA${i+1 }">
					</label>
					<input type="checkbox" name="seatid" value="A${i+1}" id="A${i+1 }" disabled="disabled">
				</c:if>
				<c:if test="${i%2 == 1 }">
					<tr>					
				</c:if>
				<c:if test="${i%4 eq 3 }"></div><div></c:if>
		  </c:forEach>
		</div> 
		</div><!-- SEAT -->
		</div>
		 <div id="seatstate">
            <table>
     			<caption>STATE</caption>
                
                <tr><td><img src="${conPath }/image/check.png" width="24" height="24" /></td><td>Check seat</td></tr>
                <tr><td><img src="${conPath }/image/uncheck.png" width="24" height="24" /></td><td>Available seat</td></tr>
                <tr><td><img src="${conPath }/image/reserved.png" width="24" height="24" /></td><td>Reserved seat</td></tr>
            </table>
        </div>
		</form>
	</div> <!-- formdiv -->
	<div class="reserve">
            <div id="word">
            </div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
  </body>
</html>
