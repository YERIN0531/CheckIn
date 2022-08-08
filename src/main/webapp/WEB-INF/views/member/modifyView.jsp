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
 		$('input[name="mpw"]').keyup(function(){  // 비밀번호 패턴 keyup 
			var patternPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
			var mpw = $('input[name="mpw"]').val().trim();
			if(patternPw.test(mpw)){
				$('#patternCheckResult').html('안전');
				$('#patternCheckResult').css('color','green');
			} else {
				$('#patternCheckResult').html('위험(8~16 영문,숫자,특수문자)');
				$('#patternCheckResult').css('color','red');  
			}			
		}); 
 		$('input[name="mpwChk"]').keyup(function() {   // 비밀번호 확인 key up
			var mpw = $('input[name="mpw"]').val();
			var mpwChk = $('input[name="mpwChk"]').val();
			if (mpw == mpwChk) {
				$('#pwChkResult').html('OK');
				$('#pwChkResult').css('color','green');
			} else {
				$('#pwChkResult').html('No');
				$('#pwChkResult').css('color','red');
			} 
		}); 
 		$('form').submit(function(){
 			var patternCheckResult = $('#patternCheckResult').text().trim();
 			var pwChkResult = $('#pwChkResult').text().trim();
 			
			if(patternCheckResult != '안전'){
				alert('비밀번호 형식을 지켜주세요');
				return false;
 			} else if(pwChkResult != 'OK'){
 				alert('두 비밀번호가 다릅니다.');
 				$('#pwChkResult').focus();
 				return false;
 			} 
 		});
 	});
 </script>  
</head>
  <body>
	<jsp:include page="myPage.jsp" />
	<form action="${conPath }/member.do?method=modifyMember" method="post">
		<table>
		<c:if test="${param.modify eq 'all' }">
			<caption>정보수정</caption>
			<tr>
				<td>
					
				</td>
			</tr>
		</c:if>
		<c:if test="${param.modify eq 'pw' }">
			<caption>비밀번호 변경</caption>
			<tr>
				<td>현재비밀번호</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="oldMpw" required="required">
				</td>
			</tr>
			
			 <tr>
                  <td>새로운 비밀번호<b>*</b></td>
             </tr>
             <tr>
                   <td>
                      <input type="password" name="mpw" required="required" placeholder="8~16자 영문자,숫자,특수문자 를 사용하세요">
                      <div id="patternCheckResult"> &nbsp; </div>
                  </td>
             </tr>

                    <tr>
                        <td>새로운 비밀번호확인<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="mpwChk" required="required">
                            <div id="pwChkResult"> &nbsp; </div>
                        </td>
                    </tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
		</c:if>
		</table>
	</form>
  </body>
</html>
