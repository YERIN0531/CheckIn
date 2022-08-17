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
  <link href="${conPath }/css/member/myPage.css" rel="stylesheet">
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
       $("#emailCheck").click(function(){   // 이메일 메일발송 클릭
			var email = $('#email').val();			
			if(!email){
				alert('이메일을 입력해주세요.');
			}else{			
	 			$.ajax({
	 					url : '${conPath }/member.do',
	 					data : "method=modifyMailSend&email="+email,
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
       $('.modifyAll').submit(function(){
			var inputEmailKey = $('input[name="emailCheckPW"]').val().trim();
			if(!isNaN(inputEmailKey)){
				inputEmailKey = Number(inputEmailKey);
			}
			if(inputEmailKey != email_key){
				alert('메일 인증번호가 일치하지 않습니다.');
				return false;
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
		
		
 	 	
		
		$('.modifyPw').submit(function(){
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
 <c:if test="${memberDto.mpw != member.mpw}">
   <script>
     alert('비밀번호가 틀렸다 서팀장');
     history.back();
   </script>
 </c:if>
 <c:if test="${param.modify eq 'mileage' }">
 	<script>
 		location="${conPath }/member.do?method=selectMileage&mmileage=${memberDto.mmileage }&mtotal=${memberDto.mtotal }&mid=${member.mid }";
 	</script>
 </c:if>
	 <jsp:include page="../main/header.jsp" />
	 
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

	<div id="logos">
        <p>MYPAGE</p>
    </div>
	 
	<section>
	<div id="navigation">
      <ul class="menu">
         <li>
            <a href="#">마이 페이지</a>
            <ul class="submenu">
               <li><a href="${conPath }/member.do?method=modifyPWCheck&modify=all">개인정보 변경</a></li>  
               <li><a href="${conPath }/member.do?method=modifyPWCheck&modify=pw">비밀번호 변경</a></li>
               <li><a href="${conPath }/member.do?method=modifyPWCheck&modify=mileage">마일리지 조회</a></li>
            </ul>
         </li>
         <li>
            <a href="#">조회</a>
            <ul class="submenu">
               <li><a href="${conPath }/air.do?method=myAirReserveList&mid=${member.mid }">항공권 조회</a></li>
               <li><a href="${conPath }/hotel.do?method=myHotelReservationList&mid=${member.mid }">호텔예약 조회</a></li>
               <li><a href="${conPath }/cart.do?method=orderDetailList">주문 조회</a></li>
               <li><a href="${conPath }/trip.do?method=myTeamList">내 여행팀 조회</a></li>
            </ul>
         </li>
         <li>
            <a href="#">기타</a>
            <ul class="submenu">
               
               <li><a href="#">예약 조회</a></li>
               <li><a href="#">배송 조회</a></li>
            </ul>
         </li>
         <li>
            <a href="#">회원탈퇴</a>
            <ul class="submenu">
               <li><a href="#">회원 탈퇴</a></li>
            </ul>
         </li>
      </ul>
   </div>



<div id="content">
	<div id="changeinfo">
	 <c:if test="${param.modify eq 'all' }">
   <form action="${conPath }/member.do?method=modifyMember" method="post" class="modifyAll">
     <input type="hidden" name="modify" value="${param.modify }">
     <input type="hidden" name="mid" value="${memberDto.mid }">
      <table>
     
         <caption>회원 정보 수정</caption>
					<tr><td></td></tr>
                   

                   <tr>
                        <th>이름<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mname" value="${memberDto.mname }" required="required">
                        </td>
                    </tr>					
                   	
                   	<tr>
                        <th>영문 이름</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mename" value="${memberDto.mename }" required="required">
                        </td>
                    </tr>
                    
                    <tr>
                        <th>여권 번호</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mpassport" value="${memberDto.mpassport }">
                        </td>
                    </tr>
                    
                    <tr>
                        <th>전화번호<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mtel" value="${memberDto.mtel }" required="required" placeholder="010-0000-0000">
                        </td>
                    </tr>
                    
                    <tr>
                        <th>우편번호<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="sample4_postcode" name="mpost" value="${memberDto.mpost }" class="text_box"  placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							<span id="guide"></span>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>주소<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="sample4_roadAddress" name="maddress" value="${memberDto.maddress }"  placeholder="도로명주소">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
                        </td>
                    </tr>
                    
                    <tr>
                        <th>상세주소<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mdeaddress" value="${memberDto.mdeaddress }" required="required" >
                        </td>
                    </tr>
                    
                    <tr>
                        <th>성별<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="mgender" value="M" checked="checked">남
                            <input type="radio" name="mgender" value="F">여
                        </td>
                    </tr>
                    
                     <tr>
                        <th>생년월일<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="date" name="mbirth" value="${memberDto.mbirth }" id="mbirth">
                        </td>
                    </tr>                   
                    
                    <tr>
                        <th>메일</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="email" id="email" name="memail" value="${memberDto.memail }"  placeholder="you@example.com">
                            <input type="button" id="emailCheck"  class="btn" value="인증번호 받기">
                        </td>
                    </tr>
                    <tr>
                    	<td>
                    		<input type="text" name="emailCheckPW" required="required"  placeholder="인증번호 입력">
                    	</td>
                    </tr>           
                   
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="정보수정" class="btn">
                        </td>
                    </tr> 
           	</table>
	</form>
      </c:if>
      <c:if test="${param.modify eq 'pw' }">
         <form action="${conPath }/member.do?method=modifyMember" method="post" class="modifyPw">
          <input type="hidden" name="modify" value="${param.modify }">
    	 <input type="hidden" name="mid" value="${memberDto.mid }">
    	  <input type="hidden" name="memail" value="${memberDto.memail }">
         <table>
        
         <caption>비밀번호 변경</caption>
          <tr>
                  <th>새로운 비밀번호<b>*</b></th>
             </tr>
             <tr>
                   <td>
                      <input type="password" name="mpw"  required="required" placeholder="8~16자 영문자,숫자,특수문자 를 사용하세요">
                      <div id="patternCheckResult"></div>
                  </td>
             </tr>

                    <tr>
                        <th>새로운 비밀번호확인<b>*</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="mpwChk" required="required">
                            <div id="pwChkResult"></div>
                        </td>
                    </tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
			 </table>
         </form>
		</c:if>
	
	</div>
	</div>
	</section>
	<jsp:include page="../main/footer.jsp" />
	  </body>
</html>