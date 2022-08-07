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
  <link href="${conPath }/css/board/noticeboard.css" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   <section>
        <div id="list">
            <div id="lnb">
                <ul>
                    <li><a href="${conPath}/air.do?method=airMain">항공</a></li>
                    <li><a href="#">호텔</a></li>
                    <li><a href="#">면세점</a></li>
                    <li><a href="#">게시판</a></li>
                </ul>
            </div>
        </div>

        <div id="reserve">
            <div id="word">
                <p>BOARD</p>
            </div>

        </div>
        <div id="boardlist">
            <ul>
                <li><a href="#">NOTICE</a></li>
                <li><a href="#">REVIEW</a></li>
                <li><a href="#">TRIPMATE</a></li>
                <li><a href="#">QNA</a></li>
            </ul>
        </div>
    </section>
  </body>
</html>
