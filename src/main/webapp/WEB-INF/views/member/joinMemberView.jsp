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
  <link href="${conPath }/css/member/join.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!--  다음 주소 api -->
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="${conPath }/js/address.js"></script> 
 <!--  다음 주소 api -->
 <script>
 	$(document).ready(function(){
 		var email_key = '';
 		$('input[name="mid"]').keyup(function(){  // 아이디 중복 검사
			$.ajax({
				url : '${conPath }/member.do',
				datatype : 'html',
				data : "method=idConfirm&mid="+$('input[name=mid]').val(),
				success : function(data, status){
					$('#idConfirmResult').html(data);
				}
			});
		});		
 		
 		$("#emailCheck").click(function(){   // 이메일 메일발송 클릭
 			var email = $('#email').val();			
 			if(!email){
 				alert('이메일을 입력해주세요.');
 			}else{			
	 			$.ajax({
	 					url : '${conPath }/member.do',
	 					data : "method=joinMailSend&email="+email,
	 					success : function(data){
	 						alert('인증번호가 발송되었습니다.');
	 						email_key = data;
	 					},
	 					error : function(data){
	 						alert('메일 발송에 실패했습니다.');
	 					}
	 			});
 			}
 		});
 		
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
 			var idConfirmResult = $('#idConfirmResult').text().trim();
 			var patternCheckResult = $('#patternCheckResult').text().trim();
 			var pwChkResult = $('#pwChkResult').text().trim();
 			var inputEmailKey = $('input[name="emailCheckPW"]').val().trim();
 			if(!isNaN(inputEmailKey)){
 				inputEmailKey = Number(inputEmailKey);
 			}
 			if(idConfirmResult != '사용가능한 ID입니다.'){
 				alert('중복체크 후 사용가능한 id로 가입해주세요.');
 				$('input[name="mid"]').focus();
 				return false;
 			} else if(patternCheckResult != '안전'){
				alert('비밀번호 형식을 지켜주세요');
				return false;
 			} else if(pwChkResult != 'OK'){
 				alert('두 비밀번호가 다릅니다.');
 				$('#pwChkResult').focus();
 				return false;
 			} else if(inputEmailKey != email_key){
 				alert('메일 인증번호가 일치하지 않습니다.');
 				return false;
 			}
 		});
 	});
 </script>  
</head>
  <body>
	<form action="${conPath }/member.do?method=joinMember" method="post">
            <div id="border">
                <table>
                    <caption>
                    <a href="${conPath }/main2.do">Check In</a>
                    </caption>
					
					<tr><td class="join"><div>&nbsp;</div>SIGN UP</td></tr>                   
					<tr><td></td></tr>
                    <tr>
                        <td>아이디<b>*</b></td>
                    </tr>
                    
                    <tr>
                        <td>
                            <input type="text" name="mid" required="required">
                            <div id="idConfirmResult"> &nbsp; </div>
                        </td>
                    </tr>

                    <tr>
                        <td>비밀번호<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="mpw" required="required" placeholder="8~16자 영문자,숫자,특수문자 를 사용하세요">
                            <div id="patternCheckResult"> &nbsp; </div>
                        </td>
                    </tr>

                    <tr>
                        <td>비밀번호확인<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="mpwChk" required="required">
                            <div id="pwChkResult"> &nbsp; </div>
                        </td>
                    </tr>

                    <tr>
                        <td>이름<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mname" required="required">
                        </td>
                    </tr>					
                   	
                   	<tr>
                        <td>영문 이름</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mename" required="required">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>여권 번호</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mpassport" >
                        </td>
                    </tr>
                    
                    <tr>
                        <td>전화번호<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mtel" required="required" placeholder="010-0000-0000">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>우편번호<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="sample4_postcode" name="mpost" class="text_box"  placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							<span id="guide"></span>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>주소<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="sample4_roadAddress" name="maddress"  placeholder="도로명주소">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>상세주소<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mdeaddress" required="required" >
                        </td>
                    </tr>
                    
                    <tr>
                        <td>성별<b>*</b></td>
                    </tr>
                    <tr>
                        <td >
                            <input type="radio" name="mgender" value="M" checked="checked">남
                            <input type="radio" name="mgender" value="F">여
                        </td>
                    </tr>
                    
                     <tr>
                        <td>생년월일<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="date" name="mbirth" id="mbirth">
                        </td>
                    </tr>                   
                    
                    <tr>
                        <td>메일</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="email" id="email" name="memail" required="required" placeholder="you@example.com">
                            <input type="button" id="emailCheck"  class="btn" value="인증번호 받기">
                        </td>
                    </tr>
                    <tr>
                    	<td>
                    		<input type="text" name="emailCheckPW"  required="required" placeholder="인증번호 입력">
                    	</td>
                    </tr>           
                   
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="회원가입" class="btn">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
  </body>
</html>
