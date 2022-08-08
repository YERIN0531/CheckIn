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
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
  <jsp:include page="../main/header.jsp"/>
   <section>
        <div id="list">
            <div id="lnb">
                <ul>
	                   <li><a href="${conPath }/air.do?method=airMain">항공</a></li>
	                   <li><a href="${conPath }/hotel.do?method=hotelMain">호텔</a></li>
	                   <li><a href="#">면세점</a></li>
	                   <li><a href="${conPath}/notice.do?method=boardmain">게시판</a></li>
	              </ul>
            </div><!-- lnb -->
        </div><!-- list -->
	
        <div id="reserve">
            <div id="word">
                <p>BOARD</p>
            </div><!-- word -->

        </div><!-- reserve -->
        <div id="boardlist">
            <ul>
                <li><a href="${conPath }/notice.do?method=noticeList">NOTICE</a></li>
                <li><a href="${conPath }/review.do?method=reviewList">REVIEW</a></li>
                <li><a href="${conPath }/trip.do?method=tripBoardList">TRIPMATE</a></li>
                <li><a href="${conPath }/qna.do?method=qnaList">QNA</a></li>
            </ul>
        </div><!-- boardlist -->
    </section>
  </body>
</html>
