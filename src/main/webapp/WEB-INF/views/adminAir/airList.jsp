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
	
	<div>
		<table>
			<caption>관리자 항공 LIST</caption>
			<tr>
			<td>항공코드</td><td>항공사</td><td>출발지</td><td>도착지</td><td>출발시간</td><td>도착시간</td><td>출발시간</td><td>도착시간</td><td>가격</td>
			<td>수정</td><td>삭제</td>
			</tr>			
			<c:forEach var="air" items="${allAirList }">
			<tr>
				<td>
					${air.acode }
					</td>
					<td>${air.airline }</td>
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
	
	<div>
	<c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="${conPath }/air.do?method=allAirList&pageNum=${paging.startPage+1 }">이전</a> ]
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }"> 
			<b>[ ${i } ]</b> 
		</c:if>
		<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/air.do?method=allAirList&pageNum=${i }">${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="${conPath }/air.do?method=allAirList&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
	</div>
	
  </body>
</html>
