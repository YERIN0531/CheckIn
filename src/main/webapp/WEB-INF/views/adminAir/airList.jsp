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
  <link href="${conPath }/css/manager/manageairlist.css" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
  a{
 text-decoration: none;
 color:black;
 }
 #paging{
 margin-top:20px;
 }
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   <c:if test="${insertAirResult eq 1 }">
		<script>
			alert('항공 등록에 성공했습니다.');
		</script>
	</c:if>
	<c:if test="${not empty insertAirResult and insertAirResult != 1 }">
		<script>
			alert('항공 등록에 실패했습니다.');
		</script>
	</c:if>
	   <c:if test="${airModifyResult eq 1 }">
		<script>
			alert('항공 수정에 성공했습니다.');
		</script>
	</c:if>
	<c:if test="${not empty airModifyResult and airModifyResult != 1 }">
		<script>
			alert('항공 수정에 실패했습니다.');
		</script>
	</c:if>	
	<c:if test="${airDeleteResult eq 1 }">
		<script>
			alert('항공 삭제에 성공했습니다.');
		</script>
	</c:if>
	<c:if test="${not empty airDeleteResult and airDeleteResult != 1 }">
		<script>
			alert('항공 삭제에 실패했습니다.');
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
        <p>AIR LIST</p>
    </div>
	<section>
			 <div id="register">
                <p><a href="${conPath }/air.do?method=airInsertView">항공기 등록 	바로가기</a></p>
             </div>
			<div id="content">
				<table>
					<tr>
					<th>항공코드</th><th>출발지</th><th>도착지</th><th>출발시간</th><th>도착시간</th><th>출발시간</th><th>도착시간</th><th>가격</th>
					<th>수정</th><th>삭제</th>
					</tr>			
					<c:forEach var="air" items="${allAirList }">
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
								<button onclick="location='${conPath }/air.do?method=airModifyView&pageNum=${param.pageNum}&acode=${air.acode}'">수정</button>
							</td>
							<td>
								<button onclick="location='${conPath }/air.do?method=airDelete&acode=${air.acode}'">삭제</button>
							</td>
					</tr>
					</c:forEach>						
				</table>
			</div>
	
		<div id="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			 <a href="${conPath }/air.do?method=allAirList&pageNum=${paging.startPage+1 }">이전</a> 
		</c:if>	
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }"> 
				<b> ${i } </b> 
			</c:if>
			<c:if test="${paging.currentPage != i }">
				 <a href="${conPath }/air.do?method=allAirList&pageNum=${i }">${i }</a> 
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			 <a href="${conPath }/air.do?method=allAirList&pageNum=${paging.endPage+1 }">다음</a> 
		</c:if>
		</div>
	</section>
	<jsp:include page="../main/footer.jsp" />
  </body>
</html>
