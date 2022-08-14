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
   <link href="${conPath }/css/manager/managerjoin.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script>
   $(document).ready(function(){
	   $('input[name="aemail"]').keyup(function(){
		   var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
		   var aemail = $('input[name="aemail"]').val();
		   if(patternMail.test(aemail)){
			   $.ajax({
					 url :'${conPath}/manager.do',
					 datatype : 'html',
					 data : "method=emailConfirm&aemail="+$('#aemail').val(),
					 success : function(data, status){
						 $('#emailConfirmResult').html(data);
					 }
				  });//ajax   
		   }else if(!aemail){
			   $('#emailConfirmResult').html(' &nbsp; ');
		   }else{
			  $('#emailConfirmResult').html('메일 형식을 지켜주세요');
		   }//if
	   });
	   $('form').submit(function(){
		   var emailConfirmResult = $('#emailConfirmResult').text().trim();
		   if(emailConfirmResult != '' && emailConfirmResult != '사용 가능한 메일입니다'){
			   alert('이메일을 확인하세요');
			   $('input[name="aemail"]').focus();
			   return false;
		   }
	   });
   });
   </script>
</head>
<body>

  <jsp:include page="../main/header.jsp"/>
  	<div class="slider">
		<div class="image">
			<input type="radio" name="slide" id="slide1" checked>
			<input type="radio" name="slide" id="slide2"> 
			<input type="radio" name="slide" id="slide3"> <input type="radio" name="slide" id="slide4">
			<ul id="imgholder" class="imgs">
				<li><img src="${conPath }/image/slide1.png"></li>
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

  <form action="${conPath }/manager.do?method=join" method="post">
  <div id="joinform">
   <table>
   <caption>REGISTER</caption>
     <tr>
       <th>아이디</th>
       <td><input type="text" name="aid" required="required" placeholder="아이디"></td>
      </tr>
      <tr> 
       <th>비밀번호</th>
       <td>
         <input type="password" name="apw" required="required" placeholder="관리자비밀번호"></td>
       </tr>
       <tr>
       <th>직책</th>
       <td>
         <input type="text" name="aname" required="required" placeholder="직책">
        </td>
       </tr>
       <tr> 
        <th class="col1">메일</th>
        <td class="col2">
          <input type="email" name="aemail" id="aemail" placeholder="메일">
          <div id="emailConfirmResult">&nbsp;</div>
        </td>
        </tr> 
        	<tr>
        	<td colspan="2">
			<input type="submit" value="등록">
   </table>
   </div>
  </form>
  </section>
    <jsp:include page="../main/footer.jsp"/> 
</body>
</html>