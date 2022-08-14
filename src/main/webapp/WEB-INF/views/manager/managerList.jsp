<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/> 
<c:set var="king" value="admin"></c:set>  
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link href="${conPath }/css/manager/managerlist.css" rel="stylesheet">
     <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
   
</head>
<body>
	<jsp:include page="../main/header.jsp" />
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

	<div id="logos">
        <p>MANAGER LIST</p>
    </div>
	
	
	
<section>	

            <div id="register">
                <p><a href="${conPath }/manager.do?method=joinForm">관리자등록</a></p>
             </div>
             
	<div id="adminlist">
		   <table>
		      <tr>
		         <th>아이디</th>
		         <th>직책</th>
		         <th>이메일</th>
		         <th>직급</th>
		      </tr>
		      
		   <c:if test="${managerList.size() != 0 }">
		   <c:forEach items="${managerList }" var="man">
		     <tr>
		   <td>
		     ${man.aid }
		   </td>
		       <td>${man.aname }</td>
		       <td>${man.aemail }</td>
		       <td>
		       <c:if test="${man.aid == 'admin' }">
		        총관리자
		       </c:if>
		       <c:if test="${man.aid == 'subadmin' }">
		          비행기 관리자 
		       </c:if>
		       <c:if test="${man.aid == 'kok3536' }">
		          숙소 관리자
		        </c:if>
		   </c:forEach>
		   </c:if>
		   </table>
	</div>	   
  </section> 
   <jsp:include page="../main/footer.jsp" />
</body>
</html>