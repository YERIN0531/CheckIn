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
 	table, tr, td {
 		border: 1px solid red;
 		margin: 0 auto;
 		text-align: left;
 		padding-left: 10px;
 		box-sizing: border-box;
 	}
 	table {
 		margin-top: 30px;
		margin-bottom : 70px;
		width: 550px;
		height: 600px;
 	}
 	caption {
 		font-size: 2em;
 	}
 	th{
 		width: 150px;
 	}
 	.btn {
 		text-align: center;
 	}
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   
   <!-- 상품수정로직 : 관리자 로그인만 가능 -->
   
   <jsp:include page="../main/header.jsp"/>
	
	<section>
		<form action="${conPath }/taxfree.do?method=update" method="post" enctype="multipart/form-data">
			<!-- <input type="hidden" name="method" value="insert"> -->
			<table>
			<caption>${taxfreeDto.pnum }번 상품 수정</caption>
				<tr><th>제품번호</th>
					<td><input type="text" name="pnum" readonly="readonly" value="${taxfreeDto.pnum }"></td>
				</tr>
				<tr><th>제품명</th>
					<td><input type="text" name="pname" required="required" value="${taxfreeDto.pname }"></td>
				</tr>
				<tr><th>가격(USD)</th>
					<td><input type="number" name="pprice" required="required" min="0" value="${taxfreeDto.pprice }"></td>
				</tr>
				<tr><th>대표 이미지</th>
					<td><input type="file" name="temp_pimage1">${taxfreeDto.pimage1 }</td>
				</tr>
				<tr><th>상세이미지1</th>
					<td><input type="file" name="temp_pimage2">${taxfreeDto.pimage2 }</td>
				</tr>
				<tr><th>상세이미지2</th>
					<td><input type="file" name="temp_pimage3">${taxfreeDto.pimage3 }</td>
				</tr>
				<tr><th>재고수량</th>
					<td><input type="text" name="pstock" required="required" min="0" value="${taxfreeDto.pstock }"></td>
				</tr>
				<tr><th>제품위치</th>
					<td><input type="text" name="ploc" required="required" value="${taxfreeDto.ploc }"></td>
				</tr>
				<tr><td colspan="2" class="btn">
					<input type="submit" value="수정하기">
					<button onclick="location='${conPath}/taxfree.do?method=list'">목록으로</button>
					<button onclick="history.back();">이전으로</button>
					<button onclick="location='main.do'">메인페이지로</button>
				</td></tr>
			</table>
		</form>
	</section>
   
   <jsp:include page="../main/footer.jsp"/>
   
  </body>
</html>