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
 <style>
  img{width: 100px;}
 </style>
</head>
  <body>
    <div id="content">
    <table>
    	
    	<caption>${noticeDto.nnum }번 글 상세보기 </caption>
    	
    	<tr>
    	  <th>제목</th>
    	  <td>${noticeDto.ntitle }</td>
    	</tr>
    	<tr>
    	  <th>본문</th>
    	  <td>${noticeDto.ncontent }</td>
    	</tr>
    	<tr>
    	  <th>사진</th>
    	  
    	<td>  <img src="${conPath }/fileUpload/${noticeDto.nimage}"></td>
    	
    	</tr> 
    	<tr>
    	 <td colspan="3">
    	 <button onclick="location='notice.do?method=noticeModifyForm&nnum=${noticeDto.nnum}&pageNum=${param.pageNum}'">수정</button>
		 <button onclick="location='notice.do?method=noticeList&pageNum=${param.pageNum}'">목록</button>	
		 <button onclick="location='notice.do?method=deleteNotice&nnum=${noticeDto.nnum}&pageNum=${param.pageNum}'">삭제</button>
		 </td>
    	
    </table>
    
    
    
    </div>
  </body>
</html>