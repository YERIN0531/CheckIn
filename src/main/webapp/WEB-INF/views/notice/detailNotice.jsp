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
    function deleteCheck(){
    	answer = confirm('정말 삭제하시겠습니까?');
    	if(answer){
    		location="${conPath }/notice.do?method=deleteNotice&nnum=${noticeDto.nnum}&pageNum=${param.pageNum}";
    	}else{
    		alert('취소하셨습니다.')
    	}
    }
 </script>  

</head>
  <body>
    <div id="content">
    <table>
    	<caption>${noticeDto.nnum }번 글 상세보기 </caption>
    	<tr>
    	  <th>제목</th>
    	  <td class="ntitle">${noticeDto.ntitle }</td>
    	</tr>
    	<tr>
    	  <th>본문</th>
    	  <td>
    	  <c:if test="${not empty noticeDto.nimage }">
    	  	<img src="${conPath }/fileUpload/${noticeDto.nimage}"> <br><br>
    	  </c:if>
    	  ${noticeDto.ncontent }
    	  </td>
    	</tr>
    	<tr>
    	 <td colspan="3" class="btn">
    	 <c:if test="${not empty manager }">
    	 <button onclick="location='notice.do?method=noticeModifyForm&nnum=${noticeDto.nnum}&pageNum=${param.pageNum}'">수정</button>
		 <button onclick="deleteCheck()">삭제할텨?</button>
		 <button onclick="location='${conPath }/notice.do?method=deleteNotice&nnum=${noticeDto.nnum}&pageNum=${param.pageNum}'">삭제</button>
    	 </c:if>
		 <button onclick="location='notice.do?method=noticeList&pageNum=${param.pageNum}'">목록</button>	
		 </td>
    	
    </table>
    
    
    
    </div>
  </body>
</html>