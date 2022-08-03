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
</head>
  <body>
  <div id="content">
   <form action="${conPath }/notice.do?method=insertNotice" method="post" enctype="multipart/form-data">
   		
   		<table>
   				<caption>공지글 등록</caption>
   				<tr>
   					<th>관리자아이디</th>
   					<td><input type="text" name="aid" ></td>
   				</tr>
   				<tr>
   					<th>글제목</th>
   						<td><input type="text" name="ntitle" required="required"></td>
   				</tr>
   				<tr>
   					<th>글본문</th>
   						<td><input type="text" name="ncontent" required="required"></td>
   				</tr>
   				<tr>
   					<th>사진등록</th><td><input type="file" name="tempnimage1" ></td>
   			     </tr>
   			    
   					<tr><td colspan="2">
				<input type="submit" value="등록">
				<button onclick="location='notice.do?method=noticeList&pageNum=${param.pageNum}'">목록</button>	   		</table>
   </form>
   </div>   
  </body>
</html>