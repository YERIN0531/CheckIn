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
</head>
<body>
	<h1>동준이가 구현할 기능들 여기에 버튼 만들고 구현하면 될거같아</h1>
	<h1>${loginResult }</h1>

<a href="${conPath }/review.do?method=reviewList&pageNum=1">리뷰게시판</a>
<a href="${conPath }/notice.do?method=noticeList&pageNum=1">공지사항!</a>
<a href="${conPath }/qna.do?method=qnaList&pageNum=1">문의하기</a>
<!--${conPath }/hotel.do?method=schHotel  -->
<a href="${conPath }/manager.do?method=mLoginForm">관리자모드</a>
<a href="${conPath }/manager.do?method=joinForm">관리자등록</a>
<a href="${conPath }/manager.do?method=managerList">관리자리스트</a>


</body>

</html>