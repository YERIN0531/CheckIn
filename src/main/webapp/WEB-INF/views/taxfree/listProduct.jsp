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
 	* {
 	margin: 0 auto;
 	padding: 0;
 	text-align: center;
 	}
 	div{
 	margin-top: 20px;
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
	<c:if test="${insertResult == SUCCESS }">
		<script>
			alert('상품 등록 성공');
		</script>
	</c:if>
	<c:set var="FAIL" value="0"></c:set>
	<c:if test="${insertResult == FAIL }">
  	<script>alert('상품 등록 실패');</script>
  </c:if>
	
	<!--  -->	
   	<table>
   	<caption>Check In_ DUTY FREE</caption>
   		<tr>
   		<c:set var="i" value="0"/>
   		<c:forEach items="${productList }" var="pDto">
   				<td onclick="location.href='${conPath}/taxfree.do?method=detail&pnum=${pDto.pnum }'">
   				${pDto.pnum } <br>
   				<img src="${conPath }/taxfree/${pDto.pimage1 }" width=220 height=220><br>
   				${pDto.pname }<br>
   				USD ${pDto.pprice }</td>
   				<c:if test="${i % 3 == 2 }">
					<tr>   				
   				</c:if>
   				<c:set var="i" value="${i+1 }"/>
   		</c:forEach>
   		</tr>
   		<tr>
   			<td colspan="3">
   				<button onclick="location='${conPath}/taxfree.do?method=insertForm'">면세점상품등록</button>
   				<button onclick="location='main.do'">메인페이지로</button>
   			</td>
   		</tr>
   	</table>
	
	<!-- 페이징 처리 -->   	
   	<div>
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
   	
  </body>
</html>