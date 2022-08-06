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
   <link href="${conPath }/css/style.css" rel="stylesheet">
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
  <form action="${conPath }/manager.do?method=join" method="post">
   <table>
     <tr>
       <th>아이디</th>
       <td><input type="text" name="aid" required="required"></td>
      </tr>
      <tr> 
       <th>비밀번호</th>
       <td>
         <input type="password" name="apw" required="required"></td>
       </tr>
       <tr>
       <th>직책</th>
       <td>
         <input type="text" name="aname" required="required">
        </td>
       </tr>
       <tr> 
        <td class="col1">메일</td>
        <td class="col2">
          <input type="email" name="aemail" id="aemail">
          <div id="emailConfirmResult">&nbsp;</div>
        </td>
        </tr> 
        	<tr>
        	<td colspan="2">
			<input type="submit" value="등록">
	<button onclick="location='${conPath}/main.do'">메인</button>
   </table>
  
  </form> 
</body>
</html>