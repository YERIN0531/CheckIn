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
  <link href="${conPath }/css/manager/managehotellist.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 	.paging {
 		text-align: center;8
 	margin-top:20px;
 	
 	}
 	 a{
 text-decoration: none;
 color:black;
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
	
	
	<jsp:include page="../main/header.jsp" />
	<div class="slider">
		<div class="image">
			<input type="radio" name="slide" id="slide1" checked>
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio" name="slide" id="slide3"> <input type="radio" name="slide" id="slide4">
			<ul id="imgholder" class="imgs">
				<li><img src="${conPath }/image/main8.png"></li>
				<li><img src="${conPath }/image/slide3.png"></li>
				<li><img src="${conPath }/image/slide2.png"></li>
				<li><img src="${conPath }/image/slide22.png"></li>
			</ul>
		</div>
		<div class="bullets">
			<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
			<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
		</div>
	</div>
	<div id="logos">
        <p>HOTEL LIST</p>
    </div>
	
	<section>
			<div id="register">
	                <p><a href="${conPath }/hotel.do?method=insertHotel">호텔 등록 	바로가기</a></p>
	        </div>
		<div id="content">
			<table>
				<tr>
					<th>호텔아이디</th><th>국가</th><th>이름</th><th>호텔주소</th><th></th><th></th>
					
				</tr>	
				<c:forEach var="hotel" items="${hotelList }">
					<tr>
						<td>${hotel.hotelid }</td>
						<td> ${hotel.hotelcountry }</td>
						<td> ${hotel.hotelname }</td>
						<td>${hotel.hoteladdress }</td>
						<td>
							<button onclick="location='${conPath }/hotel.do?method=updateHotelView&hotelid=${hotel.hotelid }&pageNum=${paging.currentPage }'">수정</button>
						</td>
						<td>
							<button onclick="location='${conPath }/hotel.do?method=deleteHotelView&hotelid=${hotel.hotelid }&pageNum=${paging.currentPage }'">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
				 <a href="${conPath }/hotel.do?method=adminHotelList&pageNum=${paging.startPage-1}">이전</a> 
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage }">
					 <b> ${i } </b> 
				</c:if>
				<c:if test="${i != paging.currentPage }">
					 <a href="${conPath }/hotel.do?method=adminHotelList&pageNum=${i}">${i }</a> 
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
				 <a href="${conPath }/hotel.do?method=adminHotelList&pageNum=${paging.endPage+1}">다음</a> 
			</c:if>
		</div>
	</section>
	<jsp:include page="../main/footer.jsp" />
  </body>
</html>
