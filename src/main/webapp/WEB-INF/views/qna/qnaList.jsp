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
				var qnum = Number($(this).children().eq(0).text());
				if(!isNaN(qnum)){
					 alert(qnum); 
					 location.href = '${conPath }/qna.do?method=secreatQna&qnum='+qnum+'&qsecret=1&pageNum=${paging.currentPage}';
			}
		}); 
	});
	
	</script>
</head>
<body>
	
	<c:if test="${not empty member }">
	   <button onclick="location='${conPath}/review.do?method=insertReviewForm&pageNum=${pageNum }'">글쓰기</button>
	</c:if>
	
	<c:if test="${empty member }">
       <button onclick="location='${conPath}/member.do?method=loginForm'">로그인 후 이용하세요 </button>
    </c:if>
    <div id="content">
    <table>
    	<tr>
    	  <th>글번호</th>
    	  <th>아이디</th>
    	  <th>제목</th>
    	  <th>작성일</th>
    	  <th>조회수</th>
    	  <th>ip</th>
    	  <th>글비번</th>
    	</tr>
    <c:if test="${qnaList.size() == 0 }">
    	<tr><th colspan="7">등록된 글이 없습니다</th></tr>
    </c:if>
    <c:if test="${qnaList.size() != 0 }">
    <c:forEach items="${qnaList }" var="qna" >
      <tr onclick="trclicked(${qna.qnum})">
     
         <td>${qna.qnum }</td>
    	 <td>${qna.qid }</td>
    	 <td class="left">
    	    <c:forEach var="i" begin="1" end="${qna.qindent }">
    	      <c:if test="${i == qna.qindent }">
    	      	└
    	      </c:if>
    	      <c:if test="${i != qna.qindent }">
	    					&nbsp; &nbsp; &nbsp; 
	    	  </c:if>
            </c:forEach>
           ${qna.qtitle }
           <c:forEach var="j" begin="1" end="${qna.qsecret }">
             <c:if test="${j == qna.qsecret }">
              <img src ="${conPath }/image/secret.jpg" width="20">
             </c:if>
           </c:forEach>
		</td>
		
		<td>
		  ${qna.qrdate }
		</td>
		<td>
			${qna.qhit }
		</td>
		<td>
			${qna.qip }
		</td>
		<td>
			${qna.qpassword }
		</td>      
    </c:forEach>
    </c:if>
    </table>
    <div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/qna.do?method=qnaList&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/qna.do?method=qnaList&pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/qna.do?method=qnaList&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	</div>
	<button onclick="location='${conPath}/main.do'">동준</button>
</body>
</html>