<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<c:if test="${not empty manager }">
	<c:set var="aid" value="${manager.aid }"/>
	<c:set var="mid" value=""/>
</c:if> 
<c:if test="${not empty member }">
	<c:set var="mid" value="${member.mid }"/>
	<c:set var="aid" value=""/>
</c:if>

<c:if test="${empty member and empty manager }">
   <c:set var="aid" value=""/>
	<c:set var="mid" value=""/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${conPath }/css/board/notice.css" rel="stylesheet">

   <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	$(document).ready(function(){ // jquery 
		var aid = '${aid}';
		var mid = '${mid}';
		$('tr').click(function(){
            var qsecreat = $(this).children().eq(3).html().trim();
			var qnum = Number($(this).children().eq(0).text().trim());
			if(!isNaN(qnum)){
				if(aid != '' && mid == '' && qsecreat != ''){ // 관리자 로그인
					alert('관리자');
					location.href = '${conPath }/qna.do?method=detailQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}else if(mid != '' && qsecreat != ''){ //mid 가 널이 아니고 qsecreat 가 널일때
					//alert(mid);
					 alert('회원');
					 location.href ='${conPath }/qna.do?method=secreatQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}else if(mid == '' && aid == ''){ // 비회원 
				     alert('로그인후 이용하세요');
					 location.href = '${conPath}/member.do?method=loginForm';
				}else if(mid != '' && qsecreat == ''){
					location.href = '${conPath }/qna.do?method=detailQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}else if(aid != '' && qsecreat == ''){
				  location.href = '${conPath }/qna.do?method=detailQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}
			}//if
			
		}); 
	});
	
	</script>
</head>
<body>
<jsp:include page="../board/boardmain.jsp"/>
	
    
    <c:if test="${not empty manager }">
      관리자
    </c:if>
    
    <c:if test="${not empty qndDelete and  qndDelete eq 1}">
     <script>
   	    	alert(' 글삭제 성공');
   	    </script>
    </c:if>
    
     <c:if test="${not empty modifyQna and  modifyQna eq 1}">
     <script>
   	    	alert(' 글수정 성공');
   	    </script>
    </c:if>
     <c:if test="${not empty insertQna and  insertQna eq 1}">
     <script>
   	    	alert(' 글쓰기 성공');
   	    </script>
    </c:if>
   
    
    <div id="logos">
        <p>QNA_BOARD</p>
    </div>
    <div id="wrap">
    	<div id="writeform">
	    	<table>
				<tr><td>
					<c:if test="${not empty member }">
						<a href="${conPath}/qna.do?method=insertQnaForm&pageNum=${paging.currentPage}">글쓰기</a>
					</c:if>	
					<c:if test="${empty member }">
						<a href="${conPath}/member.do?method=loginForm">글쓰기는 사용자 로그인 후에 이용 가능합니다</a>
					</c:if>	
				</td></tr>
			</table>
    	</div>
    <div id="listform">
    <table>
    	<caption>문의사항 게시판</caption>
    	<tr>
    	  <th class="qth-1">글번호</th>
    	  <th class="qth-2">아이디</th>
    	  <th class="qth-3">제목</th>
    	  <th class="qth-4">-</th>
    	  <th class="qth-5">답변여부</th>
    	  <th class="qth-6">작성일</th>
    	  <th class="qth-7">조회수</th>
    	 
    	</tr>
    <c:if test="${qnaList.size() == 0 }">
    	<tr><th colspan="7">등록된 글이 없습니다</th></tr>
    </c:if>
    <c:if test="${qnaList.size() != 0 }">
    <c:forEach items="${qnaList }" var="qna" >
      <tr>
         
          <td>${qna.qnum }</td>
    	 <td>${qna.qid }</td>
    	 <td class="td-1">
    	    <c:forEach var="i" begin="1" end="${qna.qindent }">
    	      <c:if test="${i == qna.qindent }">
    	      	└ 관리자
    	      </c:if>
    	      <c:if test="${i != qna.qindent }">
	    			&nbsp; &nbsp; &nbsp; 
	    	  </c:if>
            </c:forEach>
         <c:if test="${qna.qsecret eq 0 }">
           ${qna.qtitle }
         </c:if>
         <c:if test="${qna.qsecret eq 1 }">
           비밀글
         </c:if>
         
		</td>
		<td>
		<c:if test="${qna.qsecret eq 1}">
              <img src ="${conPath }/image/secret.jpg" alt="비밀글여부" width="20">
        </c:if>
        
		</td>
		
		<td>
		<c:if test="${qna.replycnt != 0  and qna.qstep eq 0}">
              답변완료
        </c:if>
        <c:if test="${qna.replycnt != 0  and qna.qstep eq 1}">
              관리자글
        </c:if>
        <c:if test="${qna.replycnt eq 0}">
              읽지않음
        </c:if>
		</td>
		<td>
		  ${qna.qrdate }
		</td>
		<td>
			${qna.qhit }
		</td>
		
		
	</tr>
    </c:forEach>
    </c:if>
    </table>
    </div><!-- listform -->
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
	</div><!-- paging -->
	</div><!--  wrap -->
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>