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
 table{
 	margin: 0 auto;
 	border: 1px solid red;
 	text-align: left;
 	padding-left: 10px;
 	box-sizing: border-box;
 	margin-top: 30px;
	margin-bottom : 70px;
 }
 caption {
 	font-size: 2em;
 	font-weight: bold;
 }
 tr, td {
 	border: 1px solid red;
 }
 .btn {
 	text-align: center;
 }
 .image {
 text-align: center;
 }
img {
 	text-align: center;
 	margin: 0 auto;
 	width: 250px;
 	height : 300px;
 
 }
 h3, h4, p {
 	padding-left: 10px;
 	box-sizing: border-box;
 }
 li {
 	list-style: none;
 	padding-left: 10px;
 }
 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
 /* 버튼을 클릭하면 로그인 유무 확인 후 로그인 창으로 이동하도록 하는 로직 추가해야 함*/
    $(document).ready(function(){
       var AddCart = document.querySelector('#btn');
       cart.onclick(){};
    });
 </script>  
</head>
  <body>	
   	<!-- 면세상품 상세보기 페이지 -->
    	<c:if test="${not empty insertCart }"> --%>
    		<script> 
    			var input = confirm('상품이 장바구니에 담겼습니다.\n장바구니로 이동 하시겠습니까?');
    			if(input == true) {
    				location.href = '${conPath}/cart.do?method=list&pageNum=${param.pageNum}';
    			} else {
    				
    				
    			}
    		</script>
    	</c:if> 
   	
   	<jsp:include page="../main/header.jsp"/>
   	<table>
   		<caption>${taxfreeDto.pname }</caption>
   		
   		<tr>
   		<td rowspan="7" class="image">
	   			<c:if test="${taxfreeDto.pimage1 eq null or '' }">
	   			<img src="${conPath }/taxfree/noimg.jpg" alt="noimg.jpg" width="250" height="300">
	   			</c:if>
	   			<c:if test="${taxfreeDto.pimage1 != null or '' }">
	   			<img src="${conPath }/taxfree/${taxfreeDto.pimage1 }" alt="${taxfreeDto.pimage1 }" width="250" height="300">
	   			</c:if>
   		</td></tr>
   		<tr><td>NO.</td><td>${taxfreeDto.pnum }</td></tr>
   		<tr><td>PRICE</td><td>USD ${taxfreeDto.pprice }</td></tr>
   		<tr><td>STOCK</td><td>${taxfreeDto.pstock }</td></tr>
   		<tr><td>LOC</td><td>${taxfreeDto.ploc }</td></tr>
   		<tr><td>QTY</td>
   		<td>
   			<!-- 장바구니에 상품 추가 -->
   			<form action="${conPath }/cart.do">
   			<input type="hidden" name="method" value="insert">
   			<input type="hidden" name="mid" value="${member.mid }">
   			<input type="hidden" name="pnum" value="${taxfreeDto.pnum }">   					
   				
   				<input type="number" name="qty" value="1">
   				<c:if test="${not empty member and empty manager }">
   					<input type="submit" value="ADD">
   				</c:if>
   				<c:if test="${empty member }">
   					로그인 후 장바구니 이용 가능합니다.
   				</c:if>
   			</form>
   		</td></tr>
   		<tr>
   		<c:if test="${not empty member and empty admin }">
   			<td colspan="2" class="btn"> MEMBER
   				<button onclick="location='${conPath}/taxfree.do?method=category&mid=${member.mid }&pageNum=1'">LIST</button>	
   				<button onclick="location='${conPath}/cart.do?method=list&mid=${member.mid }&pageNum=${param.pageNum }'">CART</button>
   			</td>
   		</c:if>
		<c:if test="${not empty manager and empty member }">
   			<td colspan="2" class="btn"> ADMIN
   				<button onclick="location='${conPath}/taxfree.do?method=updateForm&aid=${manager.aid }&pnum=${taxfreeDto.pnum }&pageNum=${param.pageNum }'">MODIFY</button>	
   				<button onclick="location='${conPath}/taxfree.do?method=delete&pnum=${taxfreeDto.pnum }&pageNum=${param.pageNum }'">DELETE</button>	
   				<button onclick="location='${conPath}/taxfree.do?method=category'">LIST</button>	
   			</td>
   		</c:if>
   		<c:if test="${empty manager and empty member }"> 
   			<td colspan="2" class="btn"> GUEST
   				<button onclick="location='${conPath}/taxfree.do?method=category&pageNum=${param.pageNum }'">LIST</button>	
   			</td>
   		</c:if>
   		</tr>
   		<tr>
   			<td colspan="3" class="btn">DETAILS</td>
   		</tr>
   		<tr>
   			<td colspan="3" class="image">
   			<c:if test="${taxfreeDto.pimage2 eq null or '' }">
   			<img src="${conPath }/taxfree/noimg.jpg" width="250" height="300">
   			</c:if>
   			<c:if test="${taxfreeDto.pimage2 != null or '' }">
   			<img src="${conPath }/taxfree/${taxfreeDto.pimage2 }" alt="${pDto.pimage2 }" width="250" height="300">
   			</c:if>
   			</td>
   		</tr>
   		<tr>
   			<td colspan="3" class="image">
   			<c:if test="${taxfreeDto.pimage3 eq null or '' }">
   			<img src="${conPath }/taxfree/noimg.jpg" width="250" height="300" >
   			</c:if>
   			<c:if test="${taxfreeDto.pimage3 != null or '' }">
   			<img src="${conPath }/taxfree/${taxfreeDto.pimage3 }" alt="${pDto.pimage3 }" width="250" height="300">
   			</c:if>
   			</td>
   		</tr>
   		<tr>
   			<td colspan="3">
   				<h3>면세점 이용안내</h3>
   				<h4>면세점 이용</h4>
   				<ol>
					<li>1. 해외로 출국하시는 고객님(내,외국인)은 롯데면세점 이용이 가능합니다. (단 제주도 포함 국내여행시에는 구입 불가합니다.)</li>   					
					<li>2. 면세품 구입 시 반드시 출국자 본인 ID로 로그인하여 구입하셔야합니다.<br>
						회원가입 및 주문 시 입력한 정보(국적, 생년월일, 성별, 여권상 영문이름, 여권번호)가 출국자 본인 여권정보와 불일치 할 경우 상품 인도가 불가합니다.</li>
					<li>3. 구입하신 상품은 반드시 출국일에 지정된 인도장에서 수령하셔야 합니다.</li>   					
   				</ol>
   				<h4>여권정보</h4>
   				<ol>
					<li>1. 반드시 출국자명으로 로그인 하셔야 하며 여권정보는 출국자 본인의 여권정보를 입력해 주셔야 합니다. <br>
						(구여권번호 또는 잘못입력하신 여권번호로 주문 시 상품수령이 불가합니다.)
					</li>   					
					<li>2. 여권 정보수정은 마이페이지 > 회원정보에서 변경가능합니다. <br>
						(연1회는 사이트에서 직접 변경 가능하나, 1회이상은 신규여권이미지를 업로드하여 신청하여 주시기 바랍니다.)<br>
						CHECK IN에서는 1인 1여권번호 정책으로 동일 여권번호를 다른아이디에 중복등록할 수 없습니다.
					</li>
					<li>3. 주문하신 교환권 여권정보 수정은 출국 3일전까지 고객센터로 연락하여 주시기 바랍니다.</li>   					
   				</ol>
   			</td>
   		</tr>
   		<tr>
   			<td colspan="3">
   				<h3>액체류, 젤류(경유/환승) 기내반입 및 구매시 안내</h3>
   				<h4>국제선 항공기 기내반입제한 안내</h4>
   				<p>면세품은 아래사항 준수하시면 안심하고 구매하셔도 됩니다. <br>
				적용시기 : 2007년 3월 1일 06시 이후 출국회원 대상<br>
				액체폭탄으로 인해 국제적인 테러위협이 증대되고 있는 가운데, ICAO의 권고에 따라, <br>
				2007년 3월 1일(목) 06시부터 대한민국 내에 위치한 공항에서 출발하는 모든 국제선 항공편(통화, 환승 포함)에 대하여 <br>
				액체류 및 젤류, 에어로졸의 항공기내 휴대반입 제한 조치를 아래와 같이 실시하오니 상품구매에 참고하시기 바랍니다. <br>
				※ 해당물품 : 액체류 및 젤류(화장품, 향수, 홍삼엑기스, 음료, 치약, 헤어젤, 샴푸, 마스카라, 에어로졸, 수성펜, 만년필 등)</p>
   			</td>
   		</tr>
   		<tr>
   			<td colspan="3">
   				<h3>인도안내</h3>
   				<h4>인도 시 주의사항</h4>
   				<p>
   				반드시 출국자 본인이 인도장에 방문하셔서 인도받으셔야 하며, <br>
   				지정된 보세구역(공항 및 항만 인도장)에서만 상품 수령이 가능합니다. <br>
				출국당일 인도장이 혼잡할 수 있사오니 출국 1시간 전 인도장으로 내방해 주시기 바랍니다. <br>
				※ 고객님의 주소지로 배송되지 않습니다. 면세품은 비행기 또는 배 탑승 전 해당 인도장에서 수령가능하며,
				별도의 보관 장소는 없습니다. (입국 시 수령 불가)
   				</p>
   			</td>
   		</tr>
   	</table>
   		<jsp:include page="../main/footer.jsp"/>
  </body>
</html>