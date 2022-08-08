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
 	.paging {
 		text-align: center;8
 	}
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 	$(document).ready(function(){
 		
 	});
 </script>  
</head>
  <body>
	<c:if test="${insertHotelResult eq 3 }">
		<script>
			alert('호텔 등록에 성공했습니다.');
		</script>
	</c:if>
	<c:if test="${not empty insertHotelResult and insertHotelResult != 3 }">
		<script>
			alert('호텔 등록에 실패했습니다.');
			location="${conPath }/hotel.do?method=failInsertHotelMail";			
		</script>
	</c:if>
	<c:if test="${deleteHotelResult eq 3 }">
		<script>
			alert('호텔 삭제에 성공했습니다.');
		</script>
	</c:if>
	<c:if test="${not empty deleteHotelResult and deleteHotelResult != 3 }" >
		<script>
			alert('호텔 삭제에 실패했습니다.');
		</script>
	</c:if>
	<h1>오지게 관리자 호텔 리스트 뿌리는 페이지입니다</h1>
	<table>
		<c:forEach var="hotel" items="${hotelList }">
			<tr>
				<td>호텔 아이디 : ${hotel.hotelid }</td>
				<td>호텔 국가 : ${hotel.hotelcountry }</td>
				<td>호텔 이름 : ${hotel.hotelname }</td>
				<td>호텔 사진 : ${hotel.hotelimage }</td>
				<td>호텔 주소 : ${hotel.hoteladdress }</td>
				<td>
					<button onclick="location='${conPath }/hotel.do?method=updateHotelView&hotelid=${hotel.hotelid }&pageNum=${paging.currentPage }'">수정하기</button>
				</td>
				<td>
					<button onclick="location='${conPath }/hotel.do?method=deleteHotelView&hotelid=${hotel.hotelid }&pageNum=${paging.currentPage }'">삭제하기</button>
				</td>
			</tr>
		</c:forEach>
	</table>
		<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/hotel.do?method=adminHotelList&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/hotel.do?method=adminHotelList&pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/hotel.do?method=adminHotelList&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
  </body>
</html>
