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
<body>
 <jsp:include page="../main/header.jsp"/>  
 
    
      <form action="${conPath }/manager.do?method=login" method="post">
        <table>
          <tr>
			 <td>
			   <input type="text" name="aid" placeholder="아이디"/>
			 </td>
	       </tr>
	       <tr>
			 <td>
			   <input type="password" name="apw" placeholder="관리자암호"/>
			 </td>
	       </tr>
	       <tr>
              <td><input type="submit" value="로그인" /></td>
           </tr>          
        </table>
      
      </form>
    

</body>
</html>