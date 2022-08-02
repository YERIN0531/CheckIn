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
  <link href="${conPath }/css/style.css" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   <form action="뷰단">
   	<div id=Customerinfo>
   		<p>예약자정보</p>
   		<input type="text" name="cname" placeholder="이름">
   		<input type="text" name="cemail" placeholder="이메일주소">
   		<input type="text" name="cphone" placeholder="휴대폰번호">
   	</div>
   	
   	<div id="Passengerinfo">
   		<p>탑승객정보</p>
   		<input type="text" name="cename" placeholder="영문이름">
   		<input type="date" name="cbirth" placeholder="생년월일">
   		<select >
   			<option>국적</option>
   			<option>한국</option>
   			<option>미국</option>
   			<option>일본</option>
   		</select>
		<br>	
   		<input type="text" name="cpassport" placeholder="여권번호">
   		<input type="radio" name="gender" value="m">남성   		
		<input type="radio" name="gender" value="f">여성
   	</div>
   	<div id="Pay">
   	
   	<p>결제수단선택</p>
   	<hr>
   		<div id="Payinfo">
   			<table>
   				<tr>
   				<td>카드사</td>
   				<td>
   					<select>
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
   		<p>결제금액 :${airDto.aprice } <p>
   		<p>사용가능한 마일리지 <input type="text" name="mileage" value="${member.mmileage }"></p>
   		<p>총 결제금액 : </p>
   	</div>
   	
   	<input type="submit" value="예약하기">
   </form>
  </body>
</html>
