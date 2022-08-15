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
	<link href="${conPath }/css/taxfree/insertproduct.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
	<style>
	  #reserve {
            padding-left: 4px;
            background: url("${conPath}/image/tax1.png") no-repeat;
            background-size:100%;
            width: 100%;
            height: 400px;
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
	
	   		 <div id="list">
            <div id="lnb">
                <ul>
	                   <li><a href="${conPath }/air.do?method=airMain">항공</a></li>
	                   <li><a href="${conPath }/hotel.do?method=hotelMain">호텔</a></li>
	                   <li><a href="${conPath}/taxfree.do?method=category">면세점</a></li>
	                   <li><a href="${conPath}/notice.do?method=boardmain">게시판</a></li>
	              </ul>
            </div><!-- lnb -->
        </div><!-- list -->
	
        <div id="reserve">
            <div id="word">
                <p>DUTY FREE</p>
            </div><!-- word -->

        </div><!-- reserve -->
        <div id="logos">
        <p>PRODUCT REGISTER</p>
    </div>
	
	
	
	<section>
		<form action="${conPath }/taxfree.do?method=insert" method="post" enctype="multipart/form-data">
			<!-- <input type="hidden" name="method" value="insert"> -->
			<table>
				<caption>PRODUCT REGISTER</caption>
				<tr><th>제품명</th>
					<td><input type="text" name="pname" required="required"></td>
				</tr>
				<tr><th>상품분류</th>
					<td>
						<select name="pcategory">
							<option>BEAUTY</option>
							<option>ACCESSORY</option>
							<option>FOOD</option>
						</select>
					</td>
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
				<tr><td colspan="2" class="btn">
					<input type="submit" value="REGISTER">
					<button onclick="history.back();" class="button">BACK</button>
					<button onclick="location='main2.do'" class="button">MAIN</button>
				</td></tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>
