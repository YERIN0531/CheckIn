<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/> 
<c:set var="king" value="admin"></c:set>  
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link href="${conPath }/css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
   
</head>
<body>

   <table>
      <caption>${aid }</caption>
      <tr>
         <th>아이디</th>
         <th>직책</th>
         <th>이메일</th>
         <th>직급</th>
      </tr>
      
   <c:if test="${managerList.size() != 0 }">
   <c:forEach items="${managerList }" var="man">
     <tr>
   <td>
     <a href="${conPath }/manager.do?method=detailManger&aid=${man.aid }">${man.aid }</a>
   </td>
       <td>${man.aname }</td>
       <td>${man.aemail }</td>
       <td>
       <c:if test="${man.aid == 'admin' }">
        총관리자
       </c:if>
       <c:if test="${man.aid == 'subadmin' }">
          딲리
       </c:if>
       <c:if test="${man.aid == 'test' }">
          따까리  
        </c:if>
   </c:forEach>
   </c:if>
   </table>
</body>
</html>