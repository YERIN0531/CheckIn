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
  <link href="${conPath }/css/air/airreserve.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
    	var airprice = Number('${airDto.totalprice }');
 		var mmileage = Number($('input[name=mmileage]').val());

 		if(mmileage >= airprice){
             $('.result').val(0);
             $('.useMmileage').val(airprice);    
        }else{
	  		$('.result').val(airprice - mmileage); 		
          }
 		$('input[name="mmileage"]').keyup(function(){
 			var airprice = Number('${airDto.totalprice }');
 			var mmileage = Number($('input[name=mmileage]').val());
 			if(mmileage > Number('${member.mmileage }') ){
 				mmileage = Number('${member.mmileage}');
 				$('input[name="mmileage"]').val(Number('${member.mmileage }'));

 			}
 			if(mmileage > airprice){
 	             $('.result').val(0);
 	             $('.useMmileage').val(airprice);    
 	          }
 			$('.result').val(airprice-mmileage);

 		});
    });
 </script>  
</head>
  <body>
  <jsp:include page="../main/header.jsp"/>
  <section>
   <form action="${conPath }/air.do?method=airReserve" method="post">
 		<input type="hidden" name="acode" value="${param.acode }">
 		<input type="hidden" name="mid" value="${member.mid }">
 		<input type="hidden" name="agodate" value="${airDto.agodate }">
 		<input type="hidden" name="acomedate" value="${airDto.acomedate }">
 		<c:forEach items="${seatid }" var="seat">
 			<input type="hidden" name="seatid" value="${seat }">
 		</c:forEach>
 		
 	<div id=Customer>
 	<h4>예약 및 결제 정보 입력</h4>
 	<p>입력한 정보로 예약 및 결제가 진행됩니다</p>
 	</div>
   	<div id=Customerinfo>
   		<p>예약자정보</p>
	   	<input type="text" name="cname" placeholder="이름">
   		<input type="text" name="cemail" placeholder="이메일주소">
   		<input type="text" name="cphone" placeholder="휴대폰번호">
   	</div>
   	
   	<c:set var="checked" value="${airDto.checknum }"/>
   	<c:forEach var="i" begin="0" end="${checked-1 }">
   	<div id="Passengerinfo">
   		<p>탑승객정보 ${i+1 }</p>
   		<input type="text" name="cename" placeholder="영문이름">
   		<input type="text" name="cbirth" id="datepicker" placeholder="생년월일">
   		<select >
   			<option>국적</option>
   			<option>한국</option>
   			<option>미국</option>
   			<option>일본</option>
   		</select>
		<div class="blank">&nbsp;</div>	
   		<input type="text" name="cpassport" placeholder="여권번호">
   		<input type="radio" name="gender" value="m">남성   		
		<input type="radio" name="gender" value="f">여성
   	</div> <!-- passengerinfo -->
   </c:forEach>	
   	<div id="Pay">
   	
   		<div id="Payinfo">
 		  	<p>결제수단선택</p>
   			<table>
   				<tr>
   				<td>카드사</td>
   				<td>
   					<select id="cardselect">
   						<option>삼성카드</option>
   						<option>하나카드</option>
   						<option>농협카드</option>
   						<option>우리카드</option>
   						<option>국민카드</option>
   					</select>
   				</td>
   				</tr>
   				<tr>
   				<td>카드번호</td>
   				<td>
	   				<input type="text" name="card1">-
				    <input type="text" name="card2">-
				    <input type="text" name="card3">
			    </td>
   				</tr>
				<tr>
				<td>카드소유자</td>
				<td><input type="text" name="cardname" placeholder="카드소유자명을 입력해주세요"></td>
				</tr>
				<tr>
				<td>법정생년월일</td>
				<td><input type="date" name="cardbirth" placeholder="법정생년월일을 입력해주세요"></td>
				</tr>
					<tr>
   				<td>유효기간</td>
   				<td>
	   				<input type="text" name="cardmonth" placeholder="월(MM)">
				    <input type="text" name="cardyear" placeholder="년도(YYYY)">
			    </td>
   				</tr>
   			</table>
   		</div> <!-- Payinfo -->
   	</div> <!-- Pay -->
   		
   	<div id="mileage">
   	<p class="title">총 결제금액</p>
   	<table>
   		<tr>
   			<td>항공권가격</td>
   			<td><p><fmt:formatNumber value="${airDto.totalprice }" pattern="#,### 원"/></p></td>
   		</tr>
   		<tr>
   			<td>마일리지</td>
   			<td><input type="text" name="mmileage" value="${member.mmileage }" class="useMmileage"></td>
   		</tr>
   		<tr>
   			<td>총 결제금액</td>
   			<td><input type="number" name="paymoney" value=""  class="result" readonly="readonly" ></td>
   		</tr>
   	</table>
   	</div>
   	<div id="submitbutton">
   	<input type="submit" value="예약하기">
   	</div>
   </form>
   </section>
  <jsp:include page="../main/footer.jsp"/>
  </body>
</html>
 <link rel="stylesheet"
            href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("#datepicker").datepicker(
            {            
               dateFormat : 'yy-mm-dd',
               changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
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
   });  
</script>  
