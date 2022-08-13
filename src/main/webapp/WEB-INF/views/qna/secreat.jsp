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
   <link href="${conPath }/css/board/secret.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="../board/boardmain.jsp"/>
   <div id="content">
      <form action="${conPath }/qna.do?method=secreat" method="post" >
      <input type="hidden" name="qnum" value="${param.qnum }">
      <input type="hidden" name="pageNum" value="${param.pageNum }">
         <table>
            <tr>
               <th>비밀번호</th>
               <td>
                  <input type="password" name="qpassword"><br>
               </td>
            </tr>
            <tr><td colspan="2" class="td-1">(관리자 글비밀번호는 회원이 입력하신  글 비밀 번호 입니다)</td></tr>
            <tr>
               <td colspan="2" class="btn">
                  <input type="submit" value="확인">
                  <input type="button" value="뒤로가기" onclick="'history.back()'" >
               </td>
            </tr>
         </table>
      </form>     
     </div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>