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
  <link href="${conPath }/css/taxfree/buyinfo.css" rel="stylesheet">
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
 	<jsp:include page="../main/header.jsp"/>
<section>	
 	<form action="${conPath }/cart.do?method=buyProduct" method="post">
  	
  	<div id=Customer>
	  	<h4>예약 및 결제 정보 입력</h4>
	 	<p>입력한 정보로 예약 및 결제가 진행됩니다</p>
  	</div>
  	<div id="Customerinfo">
		<p>여권정보</p>  		
  		<table>
  		<tr>
  			<th>성함/성별</th><td>${member.mname } / ${member.mgender }</td>
  			<th>생년월일</th><td>${member.mbirth }</td>
  		</tr>
  		<tr>
  			<th>국적</th><td>대한민국</td>
  			<th>여권번호</th><td> </td>
  		</tr>
  		<tr>
	  		<th>여권이름(영문)</th><td>${member.mename }</td>
	  		<th>주소</th><td>${member.maddress }</td>
  		</tr>

  		<tr>
  			<td colspan="4" class="passportinfo">
  			출국자 여권번호가 일치하지 않거나, 구 여권번호 혹은 잘못 입력하신 여권번호로 주문하시면 상품 수령이 불가능합니다. <br>
			영문이름은 여권에 기입된 영문이름과 동일해야 상품 수령이 가능합니다.
  			</td>
  		</tr>
  		</table>
	</div>
	
	
	<div id="Passengerinfo">
	
		<p>출국정보</p>
	<table >
  		<tr>
  			<th>출발지</th>
  			<td><select name="departure">
  					<option>출발장소 선택</option>
  					<option>인천국제공항</option>
  					<option>김포국제공항</option>
  					<option>김해(부산)국제공항</option>
  					<option>제주국제공항</option>
  					<option>대구국제공항</option>
  				</select>
  			</td>
  			<th>출국일시</th>
  			<td><input type="date"></td>
  		</tr>
  		<tr>
  			<th>항공편</th><td><input type="text" placeholder="KE"><input type="text" placeholder="1234" size="4"></td>
  			<th>경유지</th><td><input type="radio" value="직항" checked="checked"> 직항 &nbsp;<input type="radio" value="경유" size="4"> 경유</td>
  		</tr>
  		</table>
  		</div> <!-- Passengerinfo -->
  		
  		
  		
  		<div id="Productinfo">
  		<p>상품정보</p>
	  		<table>
	  		<tr>
	  			<th class="th-1">상품이미지</th><th class="th-2">상품정보</th><th class="th-3">수량</th><th class="th-4">가격</th><th class="th-5">총가격</th>
	  		</tr>
	  		<c:forEach items="${cartList }" var="cart">
	  		<tr>
	  			<td><img src="${conPath }/taxfree/${cart.pimage1 }" width="1
	  			00" height="100"></td>
	  			<td>${cart.pname }</td>
	  			<td>${cart.qty }</td>
	  			<td>＄${cart.pprice }</td>
	  			<td>＄${cart.cost }</td>
	  		</tr>
	  		</c:forEach>
	  	
	  		</table>
  		</div>
  		
  		
  		
  		
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
  		
  		
  		
  		
  		<div id="submitbutton">
  				<input type="button" value="뒤로가기" onclick="history.back();">
  				<input type="submit" value="결제하기" onclick="alert('주문이 성공되었습니다.');">
		</div>
  	</form>
  	</section> 
  	<jsp:include page="../main/footer.jsp"/>
  	
  </body>
</html>
