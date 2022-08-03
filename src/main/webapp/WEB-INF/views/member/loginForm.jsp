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
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	 <section>
        <div id="main">
            <form action="member.do?method=login" method="post">
                <div id="border">
                    <table>
                        <tr>
                            <td rowspan="7" class="firsttd"></td>
                            <td colspan="2">아이디</td>
                        </tr>
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
                            <td>5행2열</td>
                        </tr>
                        <tr>
                            <td>6행2열</td>
                        </tr>
                        <tr>
                            <td>7행2열</td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>

    </section>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>