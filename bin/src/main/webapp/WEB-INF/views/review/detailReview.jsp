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
   <style>
   img {width : 200px;}
   </style>
</head>
<body>
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
   			<th>사진</th>
   			<td><img src="${conPath }/fileUpload/${reviewDto.rimage1 }"><br>
   			<img src="${conPath }/fileUpload/${reviewDto.rimage2 }"><br>
   			<img src="${conPath }/fileUpload/${reviewDto.rimage3 }"><br>
   			<img src="${conPath }/fileUpload/${reviewDto.rimage4 }"><br>
   			<img src="${conPath }/fileUpload/${reviewDto.rimage5 }"></td>
   		</tr>
   		<tr>
   		  <th>글본문</th>
   		  <td colspan="2">${reviewDto.rcontent }</td></tr>
   		  <tr><td colspan="3">
   		  <c:if test="${not empty admin }"> <!-- 관리자 로그인 시  삭제  -->
   		  	<button onclick="location='review.do?method=deleteRevie&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">삭제</button>
   			
   		  </c:if>
   		  <c:if test="${member.mid eq reviewDto.mid }"> <!-- 본인 글 수정 삭제  -->
				<button onclick="location='review.do?method=reviewmodifyForm&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">수정</button>
				
				<button onclick="location='review.do?method=deleteReview&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">삭제</button>
		 </c:if>
		 <c:if test="${not empty member }"> <!-- 회원 로그인시 답변 가능 -->
		 	<button onclick="location='review.do?method=replyForm&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">답변</button>
		 </c:if>
		 <!-- 비회원자는 목록만 나오게  -->
		 <button onclick="location='review.do?method=reviewmodifyForm&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">수정</button>
		 <button onclick="location='review.do?method=reviewList&pageNum=${param.pageNum}'">목록</button>	
		 <button onclick="location='review.do?method=deleteReview&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">삭제</button>
		 	<button onclick="location='review.do?method=replyForm&rnum=${reviewDto.rnum}&pageNum=${param.pageNum}'">답변</button>
  	</table>
   </div>
</body>
</html>