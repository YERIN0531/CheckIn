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
  <link href="${conPath }/css/board/noticedetail.css" rel="stylesheet">
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
  <jsp:include page="../board/boardmain.jsp"/>
    <div id="content">
    <table class="noticetable">
    	<caption>${noticeDto.nnum }번 글 상세보기 </caption>
    	<tr>
    	  <th class="thtitle" >제목</th>
    	  <td class="ntitle">${noticeDto.ntitle }</td>
    	</tr>
    	<tr>
    	  <th class="thcontent">본문</th>
    	  <td>
    	  <c:if test="${not empty noticeDto.nimage }" >
    	  	<img src="${conPath }/fileUpload/${noticeDto.nimage}" width="300" height="300"> <br><br>
    	  </c:if>
    
    	 <pre>${noticeDto.ncontent }</pre>
    	  </td>
    	</tr>
    	<tr>
    	 <td colspan="3" class="btn">
    	 <c:if test="${not empty manager }">
    	 <button onclick="location='notice.do?method=noticeModifyForm&nnum=${noticeDto.nnum}&pageNum=${param.pageNum}'">수정</button>
		 <button onclick="deleteCheck()">삭제</button>
    	 </c:if>
		 <button onclick="location='notice.do?method=noticeList&pageNum=${param.pageNum}'">목록</button>	
		 </td>
    	
    </table>
    
  
    
    </div>
      <jsp:include page="../main/footer.jsp"/> 
  </body>
</html>