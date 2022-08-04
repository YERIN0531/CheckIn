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
	<link href="${conPath }/css/member/login.css" rel="stylesheet">
	 <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
  <section>
        <div id="main">
            <form action="${conPath }/member.do?method=login" method="post">
                <div id="border">
                    <table>

                        <tr>
                            <td rowspan="8" class="firsttd"></td>
                        </tr>
                        <tr><td colspan="2" class="secondtd">LOGIN</td></tr>
                        <tr>
                            <td><input type="text" name="mid" placeholder="아이디" /></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="mpw" placeholder="사용자암호" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="로그인" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="thirdtd">
                                <a href="#">아이디/비번찾기</a> | <a href="#">회원가입</a>
                            </td>
                        </tr>

                        <tr><td></td></tr>
                        <tr><td></td></tr>
                    </table>
                </div>
            </form>
        </div>

    </section>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>