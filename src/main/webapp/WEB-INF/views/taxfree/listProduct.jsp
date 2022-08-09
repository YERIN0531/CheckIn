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
 	margin: 0 auto;
 	padding: 0;
 	text-align: center;
 	}
 	tr, td {
 	border: 1px solid red;
 	}
 	div{
 	margin-top: 20px;
 	}
 	caption{
 	font-size: 2em;
 	padding: 10px;
 	}
 	.paging {
 	text-align: center;
 	margin-bottom: 70px;
 	}
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
  
  <c:set var="SUCCESS" value="1"></c:set>
  <c:set var="FAIL" value="0"></c:set>
	
	<c:if test="${not empty insertResult and insertResult eq SUCCESS }">
		<script>
			alert('상품등록 성공');
		</script>
	</c:if>
	<c:if test="${not empty insertResult and insertResult eq FAIL }">
  	<script>alert('상품등록 실패');</script>
  </c:if>
	<c:if test="${not empty modifyResult and modifyResult eq SUCCESS }">
		<script>
			alert('상품수정 성공');
		</script>
	</c:if>
	<c:if test="${not empty modifyResult and modifyResult eq FAIL }">
  	<script>
  		alert('상품수정 실패');
  	</script>
  </c:if>
	<c:if test="${not empty deleteResult}">
		<script>
			alert('상품삭제 성공');
		</script>
	</c:if>
		
		
	<jsp:include page="../main/header.jsp"/>
	
   	<table>
   	<caption>DUTY FREE</caption>
   	<tr>
   			<td colspan="3">
   			<c:if test="${not empty manager }">
   				<button onclick="location='${conPath }/taxfree.do?method=insertForm&aid=${manager.aid }'">INSERT</button>
   				<button onclick="location='${conPath }/main2.do?aid=${manager.aid }'">MAIN</button>
   			</c:if>
   			<c:if test="${not empty member }">
   				<button onclick="location='${conPath}/cart.do?method=list&mid=${member.mid }'">CART</button>
   				<button onclick="location='${conPath }/main2.do?mid=${member.mid }'">MAIN</button>
   			</c:if>
   			</td>
   		</tr>
   		<tr>
   		<c:set var="i" value="0"/>
   		<c:forEach items="${productList }" var="pDto">
   				<td onclick="location.href='${conPath}/taxfree.do?method=detail&mid=${member.mid }&pnum=${pDto.pnum }&pageNum=${paging.currentPage}'">
   				${pDto.pnum } <br>
   				<c:if test="${pDto.pimage1 eq null or '' }">
	   			<img src="${conPath }/taxfree/noimg.jpg" alt="noimg.jpg" width="250" height="300">
	   			</c:if>
	   			<c:if test="${pDto.pimage1 != null or '' }">
	   			<img src="${conPath }/taxfree/${pDto.pimage1 }" alt="${pDto.pimage1 }" width="300" height="300">
	   			</c:if>
   				<br>
   				${pDto.pname }<br>
   				USD ${pDto.pprice }</td>
   				<c:if test="${i % 3 == 2 }">
					<tr>   				
   				</c:if>
   				<c:set var="i" value="${i+1 }"/>
   		</c:forEach>
   		</tr>
   		
   	</table>
	
	<!-- 페이징 처리 -->   	
   	<div class="paging">
	<c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="${conPath }/taxfree.do?method=list&pageNum=${paging.startPage+1 }">이전</a> ]
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }"> 
			<b>[ ${i } ]</b> 
		</c:if>
		<c:if test="${paging.currentPage != i }">
			[ <a href="${conPath }/taxfree.do?method=list&pageNum=${i }">${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage < paging.pageCnt }">
		[ <a href="${conPath }/taxfree.do?method=list&pageNum=${paging.endPage+1 }">다음</a> ]
	</c:if>
	</div>
   	
   	<jsp:include page="../main/footer.jsp"/>
   	
  </body>
</html>