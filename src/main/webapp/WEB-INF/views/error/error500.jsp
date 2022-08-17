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
  <link href="${conPath }/css/error/error.css" rel="stylesheet">
 <style>
 
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
	 $(document).ready(function(){
			$.ajax({
				url : '${conPath }/error.do',
				data : "method=error500",
				success : function(data){
					setTimeout(function(){
						location="${conPath }/main2.do";
					},3000);
				}
			});
		});
 </script>  
</head>
  <body>
      <div id="error-page">
                <div class="content">
                    <h2 class="header" data-text="ERROR">
                        ERROR
                    </h2>
                    <h4 data-text="Opps! Page ERROR">
                        "Opps! Page ERROR"
                    </h4>
                    <p>
                        문제가 발생했습니다. 잠시후 이용해 주세요
                        <br />3초후 페이지 이동이 있습니다
                    </p>
                    <div class="btns">
                    </div>
                </div>
            </div>
  </body>
</html>
