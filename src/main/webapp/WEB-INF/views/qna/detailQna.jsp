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
</head>
<style>
</style>
<body>
	<c:if test="${empty qnaDto }">
	  <script>
	    alert('글 비밀 번호가 틀렸습니다 ');
	    history.back();
	  </script>
	</c:if>
<div id="content">
<table>

	<caption>${qnaDto.qnum }번 글 상세보기</caption>
	<tr>
	   <th>제목</th>
	   <td>${qnaDto.qtitle }</td>
	</tr>
	<tr>
	   <th>본문</th>
	   <td>${qnaDto.qcontent }</td>
	</tr>
	<tr>
	   <th>사진</th>
	   <c:if test="${qnaDto.qfile1 eq null or '' and qnaDto.qfile2 eq null or '' }">
	     <td colspan="2">등록된 사진이 없습니다</td>
	   </c:if>
	   <td colspan="2">
	     <c:if test="${qnaDto.qfile1 != null or '' }">
	       <img src="${conPath }/fileUpload/${qnaDto.qfile1 }" width='200'><br>
	     </c:if>
	     <c:if test="${qnaDto.qfile2 != null or '' }">
	       <img src="${conPath }/fileUpload/${qnaDto.qfile2 }" width='200'>
	    </c:if>
	   
	</tr>
	<tr>
	  <td colspan="3">
    	 <button onclick="location='qna.do?method=qnaModifyForm&qnum=${qnaDto.qnum}&pageNum=${param.pageNum}'">수정</button>
		 <button onclick="location='qna.do?method=qnaList&pageNum=${param.pageNum}'">목록</button>	
		 <button onclick="location='qna.do?method=deleteQna&qgroup=${qnaDto.qgroup}&qstep=${qnaDto.qstep }&qindent=${qnaDto.qindent }&pageNum=${param.pageNum}'">삭제</button>
	  	
	  	<c:if test="${qnaDto.qindent != 1 }">
	  	<button onclick="location='qna.do?method=qnareplyForm&qnum=${qnaDto.qnum}&pageNum=${param.pageNum}'">답변</button>
	  	</c:if>
	  </td>
	  
	  <c:if test="${not empty admin }">
	  	<button onclick="location='qna.do?method=qnareplyForm&qnum=${qnaDto.rnum}&pageNum=${param.pageNum}'">답변</button>
	  </c:if>
	</tr>
</table>
</div>



  
</body>
</html>