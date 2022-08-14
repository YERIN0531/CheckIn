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
  <link href="${conPath }/css/board/notice.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 $(document).ready(function(){ // jquery 
		$('tr').click(function(){
			var nnum = Number($(this).children().eq(0).text());
			if(!isNaN(nnum)){
				 //alert(nnum); 
				 location.href = '${conPath }/notice.do?method=detailNotice&nnum='+nnum+'&pageNum=${paging.currentPage}';
		}
	});
});
 </script>  
</head>
  <body>
  
  <jsp:include page="../board/boardmain.jsp"/>
  <c:set var="SUCESS" value="1"></c:set>
   <c:if test="${not empty deleteResult  and deleteResult eq 1 }">
   	    <script>
   	    	alert('글삭제 성공');
   	    </script>
   	  </c:if>
  
   <div id="logos">
        <p>NOTICE_BOARD</p>
    </div>
    
    
    
    <div id="wrap">
     <c:if test="${not empty manager }">
            <div id="register">
                <p><a href="${conPath}/notice.do?method=insertNoticeForm&pageNum=${paging.currentPage }">공지글등록</a></p>
             </div>
       </c:if> 
        <div id="listform">

                <table>
                    <tr>
                        <th class="th-1">글번호</th>
                        <th class="th-2">관리자아이디</th>
                        <th class="th-3">제목</th>
                        <th class="th-4">조회수</th>
                        <th class="th-5">작성일</th>
                    </tr>
                    <c:if test="${noticeList.size() == 0 }">
                        <tr><th colspan="5">등록된 공지사항이 없습니다</th></tr>
                    </c:if>
                    <c:if test="${noticeList.size() != 0 }">
                        <c:forEach items="${noticeList }" var="notice">
                            <tr>
                                <td>
                                    ${notice.nnum }
                                </td>
                                <td> ${notice.aid }</td>
                                <td class="td-1"> ${notice.ntitle }</td>
                                <td> ${notice.nhit }</td>
                                <td> ${notice.nrdate }</td>
                        </c:forEach>
                    </c:if>
                </table>
            </div> <!--writeform-->
    
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
	</div><!--wrap-->
    <jsp:include page="../main/footer.jsp"/>
<!--   <button>공지글등록</button> -->
  
<!--    <div id = "content"> -->
 
<!--    <table> -->
<%--       <caption>공지사항</caption> --%>
<!--     <tr> -->
<!--       <th>글번호</th> -->
<!--    	  <th>관리자아이디</th> -->
<!--    	  <th>제목</th> -->
<!--    	  <th>조회수</th> -->
<!--    	  <th>작성일</th> -->
<!--    	  </tr> -->
<%-- 	      <c:if test="${noticeList.size() == 0 }"> --%>
<!-- 	   	    <tr><th colspan="5">등록된 공지사항이 없습니다</th></tr> -->
<%-- 	   	  </c:if> --%>
<%--    	 <c:if test="${noticeList.size() != 0 }"> --%>
<%--    	   <c:forEach items="${noticeList }" var = "notice"> --%>
<!--    	     <tr> -->
<!--    	      	 <td> -->
<%--    	      	 ${notice.nnum } --%>
<!-- 			 </td> -->
<%-- 			 <td> ${notice.aid }</td> --%>
<%-- 			 <td> ${notice.ntitle }</td> --%>
<%-- 			 <td> ${notice.nhit }</td> --%>
<%-- 			 <td> ${notice.nrdate }</td> --%>
<%--    	   </c:forEach> --%>
<%--    	 </c:if> --%>
<!--    </table> -->
   	
  </body>
</html>