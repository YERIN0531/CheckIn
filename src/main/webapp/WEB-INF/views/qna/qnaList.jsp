<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<c:if test="${not empty admin }">
	<c:set var="aid" value="${admin.aid }"/>
	<c:set var="mid" value=""/>
</c:if> 
<c:if test="${not empty member }">
	<c:set var="mid" value="${member.mid }"/>
	<c:set var="aid" value=""/>
</c:if>

<c:if test="${empty member and empty admin }">
   <c:set var="aid" value=""/>
	<c:set var="mid" value=""/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${conPath }/css/style.css" rel="stylesheet">
 <style>
  #content {
  	width : 500px;
  	margin : 0 outo;
  }
  th {border: 1px solid black;}
  td {border: 1px solid black;
  	  text-align: center;}
 </style>
   <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	$(document).ready(function(){ // jquery 
		var aid = '${aid}';
		var mid = '${mid}';
		$('tr').click(function(){
			/* var qsecret =($(this).children().eq(2).html().lastIndexOf('.'));
			var fileLength = qsecret.length;
			var fileExtens - qsecret.substring(qsecret, fileLength);
			return fileExtens; */
			
			//$(this).find('img');
            //$(this).find("img").attr("alt") OR $(this).children("img").attr("alt")
            //  var qsecreat = $(this).find('img');
            // alert(qsecreat); // 없을때  결과보고 그거가 없으면 디테일로
			var qnum = Number($(this).children().eq(0).text());
			if(!isNaN(qnum)){
				if(aid != ''){ // 관리자 로그인
					//alert(qnum);
					alert('관리자');
					location.href = '${conPath }/qna.do?method=detailQna$qnum='+qnum+'$pageNum=${paging.currentPage}';
				}else if(mid != '' ){ //로그인했을때 
					alert(qnum); 
					//alert(mid);
					//alert(qsecreat);
					alert('회원');
					 location.href ='${conPath }/qna.do?method=secreatQna&qnum='+qnum+'&pageNum=${paging.currentPage}';
				}else if(mid == ''){ // 비회원 
					alert('비회원');
				   alert('로그인후 이용하세요');
					 location.href = '${conPath}/member.do?method=loginForm';
				}else if(qsecreat == $('qsecreat').text('object Object')){
					alert(qsecreat);
				}
			}//if
			
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
    	<caption>문의사항 게시판</caption>
    	<tr>
    	  <th>글번호</th>
    	  <th>아이디</th>
    	  <th>제목</th>
    	  <th>작성일</th>
    	  <th>조회수</th>
    	  <th>ip</th>
    	</tr>
    <c:if test="${qnaList.size() == 0 }">
    	<tr><th colspan="7">등록된 글이 없습니다</th></tr>
    </c:if>
    <c:if test="${qnaList.size() != 0 }">
    <c:forEach items="${qnaList }" var="qna" >
      <tr>
         
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
             <c:if test="${qna.qsecret eq 1}">
              <img src ="${conPath }/image/secret.jpg" alt="비밀글여부" width="20">
             </c:if>
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
	</tr>
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