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
</head>
<body>
   <div id="content">
      <form action="${conPath }/qna.do?method=secreat" method="post" >
      <input type="hidden" name="qnum" value="${param.qnum }">
      <input type="hidden" name="pageNum" value="${param.pageNum }">
         <table>
            <caption>비밀글${c }</caption>
            
            <tr>
               <th>비밀번호</th>
               <td>
                  <input type="password" name="qpassword"><br>
                  (관리자 글비밀번호는 회원이 입력하신  글 비밀 번호 입니다)
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="submit" value="확인">
                  <input type="button" value="뒤로가기" onclick="'history.back()'" >
               </td>
            </tr>
         </table>
      </form>     
     </div>
</body>
</html>