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
   <link href="${conPath }/css/board/reviewdetail.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
   <style>
   img {width : 200px;}
   </style>
   <script>
      function deleteCheck(){
  		answer = confirm('하위글까지 모두 삭제됩니다. 정말 삭제하시겠습니까?');
  		if(answer){
			location="${conPath }/review.do?method=deleteReview&rgroup=${reviewDto.rgroup}&rstep=${reviewDto.rstep}&rindent=${reviewDto.rindent}&pageNum=${param.pageNum}";
		}else{
			alert('취소하셨습니다.');
		}
	}
      
   </script>
</head>
<body>
<jsp:include page="../board/boardmain.jsp"/>
   <div id="content">
   	<table>
   	
   		<caption>${reviewDto.rnum }번 글 상세보기</caption>
   		<tr>
   			<th>글제목</th>
   			<td colspan="2">${reviewDto.rtitle }</td>
   		</tr>
   		<tr>
   			<th>아이디</th>
   			<td colspan="2">${reviewDto.mid }</td>
   		</tr>
   		 <tr>
   			<th>작성일</th>
   			<td colspan="2">${reviewDto.rrdate }</td>
   		</tr>  
   			
   		
   		
   		
   		
   		<tr>
   		  <th class="th-1">글본문</th>
   		  <td colspan="2">${reviewDto.rcontent }</td></tr>
   		
   		
   		<tr>
 			<th class="th-2">사진</th>	
   			<c:if test="${ reviewDto.rimage1  eq null or  ''  and reviewDto.rimage2 eq null or  ''  and reviewDto.rimage3 eq null or  ''  and reviewDto.rimage4 eq null or  ''  and reviewDto.rimage5 == null or  ''  }">
	   			<td colspan="2">등록된 사진이 없습니다</td>
   			</c:if>
   			</tr>
   			
   		
   			<c:if test="${reviewDto.rimage1 != null or '' }">
   			<tr>
   			<td colspan="2">
   			<img src="${conPath }/fileUpload/${reviewDto.rimage1}"><br>
   			</td></tr>
   			</c:if>
   			<c:if test="${reviewDto.rimage2 != null or '' }">
   			<tr>
   			<td colspan="2">
   			<img src="${conPath }/fileUpload/${reviewDto.rimage2}"><br>
   			</td></tr>
   			</c:if>
   			
   			<c:if test="${reviewDto.rimage3 != null or '' }">
   			<tr>
   			<td colspan="2">
   			<img src="${conPath }/fileUpload/${reviewDto.rimage3}"><br>
   			</td></tr>
   			</c:if>
   			<c:if test="${reviewDto.rimage4 != null or '' }">
   			<tr>
   			<td colspan="2">
   			<img src="${conPath }/fileUpload/${reviewDto.rimage4}"><br>
   			</td></tr>
   			</c:if>
   			<c:if test="${reviewDto.rimage5 != null or '' }">
   			<tr>
   			<td colspan="2">
   			<img src="${conPath }/fileUpload/${reviewDto.rimage5}">
   			</td></tr>
   			</c:if>
<!--    		</td>	 -->
<!--    	</tr> -->
   		
   		  <tr><td colspan="3" class="btn">
   		  <c:if test="${not empty manager }"> <!-- 관리자 로그인 시  삭제  -->
   		  <button onclick="deleteCheck()"> 삭제</button>
   		   <button onclick="location='${conPath }/review.do?method=replyForm&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">답변</button>	
   		  </c:if>
   		  <c:if test="${member.mid eq reviewDto.mid }"> <!-- 본인 글 수정 삭제  -->
				<button onclick="deleteCheck()"> 삭제</button>
				<button onclick="location='${conPath }/review.do?method=reviewmodifyForm&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">수정</button>
				
		 </c:if>
		 <c:if test="${not empty member }"> <!-- 회원 로그인시 답변 가능 -->
		 	<button onclick="location='${conPath }/review.do?method=replyForm&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">답변</button>
		 </c:if>
		 <!-- 비회원자는 목록만 나오게  -->
		 <button onclick="location='${conPath }/review.do?method=reviewList&pageNum=${param.pageNum}'">목록</button>	
  	</table>
<jsp:include page="../main/footer.jsp"/>
   </div>
</body>
</html>