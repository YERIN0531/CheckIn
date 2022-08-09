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
 	table {
 		border: 1px solid red;
 		margin: 0 auto;
 	}
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>

 <body>
 	
 	<jsp:include page="../main/header.jsp"/>
 	
 	<form action="${conPath }/cart.do?method=buyProduct" method="post">
  	<table>
  		<caption><b>결제정보</b></caption>
  		<tr>
  			<td colspan="4"><b>여권정보</b></td>
  		</tr>
  		<tr>
  			<td>여권정보</td><td>${member.mname } / ${member.mgender }</td>
  			<td>생년월일</td><td>${member.mbirth }</td>
  		</tr>
  		<tr>
  			<td>국적</td><td>대한민국</td>
  			<td>여권번호</td><td> </td>
  		</tr>
  		<tr>
	  		<td>여권이름(영문)</td><td>${member.mename }</td>
	  		<td>주소</td><td>${member.maddress }</td>
  		</tr>
  		
  		<tr>
  			<td colspan="4">
  			출국자 여권번호가 일치하지 않거나, 구 여권번호 혹은 잘못 입력하신 여권번호로 주문하시면 상품 수령이 불가능합니다. <br>
			영문이름은 여권에 기입된 영문이름과 동일해야 상품 수령이 가능합니다.
  			</td>
  		</tr>
  		
	
  		<tr>  		
	  		<td colspan="4"><b>출국정보</b></td>
  		</tr>
  		<tr>
  			<td>출발지</td>
  			<td><select name="departure">
  					<option>출발장소 선택</option>
  					<option>인천국제공항</option>
  					<option>김포국제공항</option>
  					<option>김해(부산)국제공항</option>
  					<option>제주국제공항</option>
  					<option>대구국제공항</option>
  				</select>
  			</td>
  			<td>출국일시</td>
  			<td><input type="date"></td>
  		</tr>
  		<tr>
  			<td>항공편</td><td><input type="text" placeholder="KE"><input type="text" placeholder="1234" size="4"></td>
  			<td>경유지</td><td><input type="radio" value="직항" checked="checked"> 직항 &nbsp;<input type="radio" value="경유" size="4"> 경유</td>
  		</tr>
  		
  		<tr>
  			<th colspan="2">상품정보</th><th>수량</th><th>가격</th><th>총가격</th>
  		</tr>
  		<c:forEach items="${cartList }" var="cart">
  		<tr>
  			<td><img src="${conPath }/taxfree/${cart.pimage1 }" width="100" height="100"></td>
  			<td>${cart.pname }</td>
  			<td>${cart.qty }</td>
  			<td>${cart.pprice }</td>
  			<td>${cart.cost }</td>
  		</tr>
  		</c:forEach>
  		
  		<tr>
  			<td colspan="4"><b>결제정보</b></td>
  		</tr>
  		<tr>
  			<td>결제방법</td>
  			<td colspan="3">
  			카드선택 
  				<select>
  					<option>카드사 선택</option>
  					<option>KB국민카드</option>
  					<option>롯데카드</option>
  					<option>신한카드</option>
  					<option>하나카드</option>
  					<option>BC카드</option>
  					<option>삼성카드</option>
  					<option>현대카드</option>
  					<option>우리카드</option>
  					<option>NH농협카드</option>
  					<option>씨티카드</option>
  					<option>카카오뱅크카드</option>
  					<option>토스뱅크카드</option>
  					<option>기타(은행/증권)카드</option>
  				</select>
  				<input type="text" size="4">
  				<input type="password" size="4">
  				<input type="password" size="4">
  				<input type="text" size="4">
  			&nbsp;&nbsp; 할부기간 
  			<select>
  					<option>일시불</option>
  					<option>2개월(무이자)</option>
  					<option>3개월(무이자)</option>
  					<option>4개월</option>
  					<option>5개월</option>
  					<option>6개월</option>
  					<option>7개월</option>
  					<option>8개월</option>
  				</select>
  			</td>
  		</tr>
  		
  		<tr>
  			<td colspan="4">
  				<input type="button" value="뒤로가기" onclick="history.back();">
  				<input type="submit" value="결제하기">
  			</td>
  		</tr>
  	</table> 
  	</form>
  	
  	<jsp:include page="../main/footer.jsp"/>
  	
  </body>
</html>
