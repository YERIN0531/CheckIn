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
<style>
 a{
 text-decoration: none;
 color:black;
 }
 .paging{
 margin-top:20px;
 }
</style>
   <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	$(document).ready(function(){ // jquery  // 31 이 잠금 이미지    , 28이 공개글 이미지 
		//<img src ="${conPath }/image/secret.jpg" alt="비밀글여부" width="20">비밀글
		//<img src ="${conPath }/image/qna.png" alt="비밀글여부" width="20">공개글
		var aid = '${aid}';
		var mid = '${mid}';
		$('tr').click(function(){
            var qsecreat = $(this).children().eq(3).html().trim();
            //qsecreat2 = qsecreat.indexOf(".",?)
            qsecreat2 = qsecreat.lastIndexOf(".png");
			var qnum = Number($(this).children().eq(0).text().trim());
			if(!isNaN(qnum)){
				if(aid != '' && mid == '' && qsecreat2 == -1){ // 관리자 , 비밀글  비번 창 없이 바로 상세보기 
					//alert('관리자');
					location.href = '${conPath }/qna.do?method=detailQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}else if(mid != '' && qsecreat2 == -1){  // 회원 , 비밀글 , 비번 view 로 
					//alert(mid);
					// alert('회원');
					 location.href ='${conPath }/qna.do?method=secreatQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}else if(mid == '' && aid == ''){ // 비회원  , 로그인창
				     alert('로그인후 이용하세요');
					 location.href = '${conPath}/member.do?method=loginForm';
				}else if(mid != '' && qsecreat2 == '28'){ // 회원 , 공개글 바로 상세보기
					location.href = '${conPath }/qna.do?method=detailQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}else if(aid != '' && qsecreat2 == '28'){ // 관리자 , 공개글 바로 상세보기
				  location.href = '${conPath }/qna.do?method=detailQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}
			}//if
			
		}); 
	});
	
	</script>
</head>
<body>
<jsp:include page="../board/boardmain.jsp"/>
	
    
 
    
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
					<c:if test="${not empty member and empty manager}">
						<tr><td>
						<a href="${conPath}/qna.do?method=insertQnaForm&pageNum=${paging.currentPage}">글쓰기</a>
						</td></tr>
					</c:if>	
					<c:if test="${empty member and empty manager}">
					<tr><td>
						<a href="${conPath}/member.do?method=loginForm">글쓰기는 사용자 로그인 후에 이용 가능합니다</a>
						</td></tr>
					</c:if>	
			</table>
    	</div>
    <div id="listform">
    <table>
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
              <img src ="${conPath }/image/secret.jpg"  width="20">
        </c:if>
        <c:if test="${qna.qsecret eq 0}">
              <img src ="${conPath }/image/qna.png" width="20">
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
			 <a href="${conPath }/qna.do?method=qnaList&pageNum=${paging.startPage-1}">이전</a> 
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
			 <b> ${i } </b> 
			</c:if>
			<c:if test="${i != paging.currentPage }">
				 <a href="${conPath }/qna.do?method=qnaList&pageNum=${i}">${i }</a> 
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			 <a href="${conPath }/qna.do?method=qnaList&pageNum=${paging.endPage+1}">다음</a> 
		</c:if>
	</div><!-- paging -->
	</div><!--  wrap -->
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>