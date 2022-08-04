<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<div id="content">
		<div>
			<form action="${conPath }/air.do">
				<input type="hidden" name="method" value="airList">
				<table>
				<tr>
					<td>
					출발지<br>
					<input type="text" name="adepartloc" value="${param.adepartloc }">
					</td>
					<td>
					도착지<br>
					<input type="text" name="aariveloc" value="${param.aariveloc }">
					</td>
					<td>
					가는날<br>
					<input type="date" name="agodate" value="${param.agodate }">
					</td>
					<td>
					오는날<br>
					<input type="date" name="acomedate" value="${param.acomedate }">
					</td>
					</tr>
					<tr><td colspan="5">
						<input type="submit" value="항공권검색">
					</td></tr>
				</table>
			</form>
		</div>
		
			
		<table>
			<caption>항공 LIST</caption>
			<tr>
			<td>항공코드</td><td>출발지</td><td>도착지</td><td>출발시간</td><td>도착시간</td><td>출발시간</td><td>도착시간</td><td>항공가격</td>
			<td>예약</td>
			</tr>			
			<c:forEach var="air" items="${airList }">
			<tr>
				<td>
					${air.acode }
					</td>
					<td>
					${air.adepartloc }
					</td>
					<td>
					${air.aariveloc }
					</td>
					<td>
					${air.agotime} 
					</td>
					<td>
					${air.ago_arrivetime }
					</td>
					<td>
					${air.acome_departtime }
					</td>
					<td>
					${air.acome_arrivetime }
					</td>
					<td>
					${air.aprice }
					</td>
					<td>
						<button onclick="location='${conPath }/air.do?method=airReserveForm&acode=${air.acode }&agodate=${param.agodate }&acomedate=${param.acomedate }&aprice=${air.aprice }'">예약하기</button>
					</td>
			</tr>
			</c:forEach>						
		</table>
	</div>
</body>
</html>