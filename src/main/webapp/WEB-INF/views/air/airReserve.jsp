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
  #reserve {
                padding-left: 4px;
                background: url("${conPath}/image/air6.png") no-repeat;
                background-size:100%;
                width: 100%;
                height: 200px;
            }
                  #word {
            color: white;
            width: 70%;
            text-align: center;
            margin: 0 auto;
            padding-top: 70px;
        }
 .reserve {
                padding-left: 4px;
                 background: url("${conPath}/image/air6.png") no-repeat;
                width: 100%;
                height: 150px;
            }
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
  
  	<div id="seatalert">
   		<table>

   		<tr>
   			<td colspan="3">
   				<h3>좌석예약 이용안내</h3>
   				<h4>좌석 예약시 주의사항</h4>
   				<ol>
					<li>1. 할인석 예약시 신분할인(아동,경로,도민,장애 등) <b>중복할인 불가합니다</b></li>   					
					<li>2. 신분할인을 선택하여 발권한 항공권은 탑승수속 시 관련 증비 서류를 제시해주셔야 합니다.<br>
					<li>3. 일반석/할인석은 판매운임과 취소 수수료가 상이하며 탑승하는 좌석의 차이는 없습니다.</li>   					
   				</ol>
   				<h4>여권정보</h4>
   				<ol>
					<li>1. 반드시 출국자명으로 로그인 하셔야 하며 여권정보는 출국자 본인의 여권정보를 입력해 주셔야 합니다. <br>
						(구여권번호 또는 잘못입력하신 여권번호로 주문 시 상품수령이 불가합니다.)
					</li>   					
					<li>2. 여권 정보수정은 마이페이지 > 회원정보에서 변경가능합니다. <br>
						(연1회는 사이트에서 직접 변경 가능하나, 1회이상은 신규여권이미지를 업로드하여 신청하여 주시기 바랍니다.)<br>
						CHECK IN에서는 1인 1여권번호 정책으로 동일 여권번호를 다른아이디에 중복등록할 수 없습니다.
					</li>
					<li>3. 예약시 탑승자 성함은 최대 4글자까지 제한됩니다.</li>   					
   				</ol>
   			</td>
   		</tr>
   	</table>
   	</div> <!-- taxfreeinfo -->
  
 
  
  
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
