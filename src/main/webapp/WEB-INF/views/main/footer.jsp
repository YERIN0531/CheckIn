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
  <link href="${conPath }/css/main/footer.css" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
    <footer>
 	<c:if test="${empty member and empty manager }">
 	 	<div class="office_address">
                    <ul>
                        <li>info@checkin.com|<a href="${conPath }/manager.do?method=mLoginForm">관리자모드</a></li>
                        <li>(주)체크인|대표그룹 OCSY|사업자번호 010-6666-0012|서울특별시 구로구 오류동</li>
                        <li>
                            ⓒCHECKINFROMOXCY 2022 ALL RIGHTS RESERVED
                        </li>
                    </ul>
     	 </div>
   	</c:if>
   	
   	
   	<c:if test="${not empty member and empty manager }"> <!-- 멤버 로그인 후  -->
 	 	<div class="office_address">
                    <ul>
                        <li>info@checkin.com|  ${member.mname }님 어서오세요</li>
                        <li>(주)체크인|대표그룹 OCSY|사업자번호 010-6666-0012|서울특별시 구로구 오류동</li>
                        <li>
                            ⓒCHECKINFROMOXCY 2022 ALL RIGHTS RESERVED
                        </li>
                    </ul>
     	 </div>
   	</c:if>
    
     
      <c:if test="${empty member and not empty manager}"> <!--관리자로그인 후 -->
        <div class="office_address">
            <ul>
                <li>info@checkin.com | 관리자님 어서오세요</li>
                 <li>(주)체크인|대표그룹 OCSY|사업자번호 010-6666-0012|서울특별시 구로구 오류동</li>
                 <li>
                            ⓒCHECKINFROMOXCY 2022 ALL RIGHTS RESERVED
                 </li>
            </ul>
        </div>
     </c:if>
 
 </footer>
 
   
  </body>
</html>
