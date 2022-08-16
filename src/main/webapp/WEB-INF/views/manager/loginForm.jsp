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
   <link href="${conPath }/css/manager/managerlogin.css" rel="stylesheet">
	 <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
 <jsp:include page="../main/header.jsp"/>  
 	<div class="slider">
		<div class="image">
			<input type="radio" name="slide" id="slide1" checked>
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio" name="slide" id="slide3"> <input type="radio" name="slide" id="slide4">
			<ul id="imgholder" class="imgs">
					<li><img src="${conPath }/image/main8.png"></li>
				<li><img src="${conPath }/image/slide3.png"></li>
				<li><img src="${conPath }/image/slide2.png"></li>
				<li><img src="${conPath }/image/slide22.png"></li>
			</ul>
		</div>
		<div class="bullets">
			<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
			<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
		</div>
	</div>
 
 <section>
<div id="main">
             <form action="${conPath }/manager.do?method=login" method="post">
                <div id="border">
                    <table>
                        <caption>CHECK_IN</caption>
                        <tr><td colspan="2"></td></tr>
                        <tr><td colspan="2" class="login">ADMINLOGIN</td></tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>

                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="aid" required="required" placeholder="아이디">
                            </td>
                        </tr>

                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="apw" required="required" placeholder="관리자암호" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="but">
                                <input type="submit" value="로그인" class="btn">
                            </td>
                        </tr>
                        <tr>
                        <td colspan="2" class="ad"><a href="${conPath }/manager.do?method=joinForm">관리자등록하기</a></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>


</section>
  <jsp:include page="../main/footer.jsp"/>  
 
    

</body>
</html>