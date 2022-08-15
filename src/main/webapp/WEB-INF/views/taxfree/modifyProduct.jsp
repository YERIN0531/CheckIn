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
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
    $(document).ready(function(){
       
    });
 </script>  
</head>
  <body>
   
   <!-- 상품수정로직 : 관리자 로그인만 가능 -->
   
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
        <p>PRODUCT MODIFY</p>
    </div>
	
	<section>
		<form action="${conPath }/taxfree.do?method=update" method="post" enctype="multipart/form-data">
			<!-- <input type="hidden" name="method" value="insert"> -->
			<input type="hidden" name="aid" value="${manager.aid }">
			<table>
			<caption>${taxfreeDto.pnum }번 상품 수정</caption>
				<tr><th>제품번호</th>
					<td>${taxfreeDto.pnum }</td>
				</tr>
				<tr><th>제품명</th>
					<td><input type="text" name="pname" required="required" value="${taxfreeDto.pname }"></td>
				</tr>
				<tr><th>상품분류</th>
					<td>
					<select name="pcategory">
   							<option <c:if test="${taxfreeDto.pcategory eq 'BEAUTY' }"> selected="selected"</c:if>>BEAUTY</option>
   							<option <c:if test="${taxfreeDto.pcategory eq 'ACCESSORY' }"> selected="selected"</c:if>>ACCESSORY</option>
		   					<option <c:if test="${taxfreeDto.pcategory eq 'FOOD' }"> selected="selected"</c:if>>FOOD</option>
   					</select>
   					</td>
				</tr>
				<tr><th>가격(USD)</th>
					<td><input type="number" name="pprice" required="required" min="0" value="${taxfreeDto.pprice }"></td>
				</tr>
				<tr><th>대표 이미지</th>
					<td><img src="${conPath}/taxfree/${taxfreeDto.pimage1 }" width="200" height="200"><br>
					<input type="file" name="temp_pimage1">
					</td>
				</tr>
				<tr><th>상세이미지1</th>
					<td><img src="${conPath}/taxfree/${taxfreeDto.pimage2 }" width="200" height="200"><br>
					<input type="file" name="temp_pimage2">
					</td>
				</tr>
				<tr><th>상세이미지2</th>
					<td><img src="${conPath}/taxfree/${taxfreeDto.pimage3 }" width="200" height="200"><br>
					<input type="file" name="temp_pimage3">
					</td>
				</tr>
				<tr><th>재고수량</th>
					<td><input type="text" name="pstock" required="required" min="0" value="${taxfreeDto.pstock }"></td>
				</tr>
				<tr><th>제품위치</th>
					<td><input type="text" name="ploc" required="required" value="${taxfreeDto.ploc }"></td>
				</tr>
				<tr><td colspan="2" class="btn">
					<input type="submit" value="MODIFY">
					<input type="button" onclick="location='${conPath}/taxfree.do?method=category?aid=${manager.aid }&pageNum=${params.currnetPage }'" value="LIST">
					<input type="button" onclick="location='${conPath}/main2.do'" value="MAIN">
				</td></tr>
			</table>
		</form>
	</section>
   
   <jsp:include page="../main/footer.jsp"/>
   
  </body>
</html>