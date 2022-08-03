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
   <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	$(document).ready(function(){ // jquery 
			$('tr').click(function(){
				var rnum = Number($(this).children().eq(0).text());
				if(!isNaN(rnum)){
					 alert(rnum); 
					 location.href = '${conPath }/review.do?method=detailReview&rnum='+rnum+'&pageNum=${paging.currentPage}';
			}
		});
	});
	</script>
</head>
<body>
	<c:if test="${not empty reviewDelete  and reviewDelete eq 1 }">
   	    <script>
   	    	alert(' 글삭제 성공');
   	    </script>
   	  </c:if>
   	<c:if test="${not empty modifyReview and modifyReview eq 1 }">
   		<script>
   			alert('후기글 수정 성공');
   		</script>
   	</c:if>
   	
   	<c:if test="${not empty replyReview and replyReview eq 1 }">
   		<script>
   			alert('답변 성공');
   		</script>
   	</c:if>
   	
   	   		 
	<c:if test="${not empty member }">
			<button onclick="location='${conPath}/review.do?method=insertReviewForm&pageNum=${pageNum }'">글쓰기</button>
	</c:if>
	<c:if test="${empty member }">
		  <button onclick="location='${conPath}/member.do?method=loginForm'">로그인</button>
	</c:if>
	<div id="content">
	<table>
			<tr>
			<th>글번호</th>
			<th>아이디</th>
			<th>글제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>ip</th>
			</tr>
			<c:if test="${reviewList.size() == 0 }">
				<tr><th colspan="7">등록된 글이 없습니다</th></tr>
			</c:if>
	   <c:if test="${reviewList.size() != 0 }">
	   <c:forEach items="${reviewList }" var ="review" >
	     <tr>
	    	 <td>${review.rnum } </td>
	    	<td> ${review.mid }</td>
	    	<td class="left">
	    		<c:forEach var="i" begin="1" end="${review.rindent }">
	    			<c:if test="${i == review.rindent }">
	    					└
	    			</c:if>
	    			<c:if test="${i != review.rindent }">
	    					&nbsp; &nbsp; &nbsp; 
	    			</c:if>
	    		</c:forEach>
	    			 ${review.rtitle }
	    	</td>
	    	<td> 
	    		${review.rrdate }
	    	</td>
	    	<td>
	    	    ${review.rhit }
	    	</td>
	    	 <td>${review.rip }</td>
	    </tr>
	    </c:forEach>
	    </c:if>
	</table>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/review.do?method=reviewList&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/review.do?method=reviewList&pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/review.do?method=reviewList&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	</div>
	<button onclick="location='${conPath}/main.do'">동준</button>
</body>
</html>