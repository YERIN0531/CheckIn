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
 <button onclick="location='${conPath}/notice.do?method=insertNoticeForm&pageNum=${pageNum }'">공지글등록</button>
   <div id = "content">
   <table>
   	<tr>
   	  <th>글번호</th>
   	  <th>관리자아이디</th>
   	  <th>제목</th>
   	  <th>조회수</th>
   	  <th>작성일</th>
   	  </tr>
   	  <c:if test="${totCnt eq 0 }">
   	    <tr><th colspan="6">등록된 공지사항이 없습니다</th></tr>
   	  </c:if>
   	 <c:if test="${totCnt != 0 }">
   	   <c:forEach items="${noticeList }" var = "notice">
   	     <tr>
   	      	 <td>
   	      	 <a href="${conPath }/notice.do?method=detailNotice&nnum=${notice.nnum }&pageNum=${paging.currentPage}">${notice.nnum }</a>
			 </td>
			 <td> ${notice.aid }</td>
			 <td> ${notice.ntitle }</td>
			 <td> ${notice.nhit }</td>
			 <td> ${notice.nrdate }</td>
   	   </c:forEach>
   	 </c:if>
   </table>
   	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/notice.do?method=noticeList&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/notice.do?method=noticeList&pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/notice.do?method=noticeList&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	</div>
	<button onclick="location='${conPath}/main.do'">동준</button>
  </body>
</html>