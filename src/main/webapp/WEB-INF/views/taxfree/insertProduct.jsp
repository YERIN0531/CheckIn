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
	<link href="conPath/css/style.css" rel="stylesheet">
	<style>
		* {
		border: 1px solid red;
		text-align: center;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	$(document).ready(function(){
		
	});
	</script>
</head>

<body>
	
	<jsp:include page="../main/header.jsp"/>
	
	<section>
		<form action="${conPath }/taxfree.do?method=insert" method="post" enctype="multipart/form-data">
			<!-- <input type="hidden" name="method" value="insert"> -->
			<table>
				<!-- <tr><th>제품번호</th>
					<td><input type="text" name="pnum" required="required"></td>
				</tr> -->
				<tr><th>제품명</th>
					<td><input type="text" name="pname" required="required"></td>
				</tr>
				<tr><th>가격(USD)</th>
					<td><input type="number" name="pprice" required="required"></td>
				</tr>
				<tr><th>대표 이미지</th>
					<td><input type="file" name="temp_pimage1" required="required"></td>
				</tr>
				<tr><th>상세이미지1</th>
					<td><input type="file" name="temp_pimage2"></td>
				</tr>
				<tr><th>상세이미지2</th>
					<td><input type="file" name="temp_pimage3"></td>
				</tr>
				<tr><th>재고수량</th>
					<td><input type="text" name="pstock" required="required" min="0"></td>
				</tr>
				<tr><th>제품위치</th>
					<td><input type="text" name="ploc" required="required"></td>
				</tr>
				<!-- <tr><th>상세설명</th>
					<td><textarea rows="5" cols="10" name="pcontent"></textarea> </td>
				</tr> -->
				<tr><td colspan="2">
					<input type="submit" value="등록하기">
					<input type="reset" value="초기화">
					<button onclick="history.back();">이전으로</button>
					<button onclick="location='main.do'">메인페이지로</button>
				</td></tr>
			</table>
		</form>
	</section>
	
	
</body>
</html>
