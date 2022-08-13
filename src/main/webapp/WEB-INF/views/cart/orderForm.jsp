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
  <link href="${conPath }/css/taxfree/orderform.css" rel="stylesheet">
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
        	<p>ORDER DETAILS</p>
    	</div> <!-- logos -->
   	
   	<!-- 주문 디테일  -->
	<div id="orderdetail">
		<div class="taxfreemain">
	   		<button onclick="location='${conPath}/taxfree.do?method=category&pageNum=1'" class="mainbutton">Click to the Duty Free Shop</button>
	   	</div>	<!-- taxfreemain -->
	   	<div class="noorder">
	   		<c:if test="${orderDetailList.size() == 0 }">
	   			<p>WE'RE WATING FOR YOUR ORDER</p>
	   		</c:if>
	   	</div><!-- noorder -->
	   	<div class="orders">	
			<c:set var="or_num_temp" value="0"/>
			<c:forEach items="${orderDetailList }" var="order">
				<table>
					<c:if test="${or_num_temp != order.or_num}">
				   	
				   		<tr>
				   			<td colspan="7" class="td-1">ORDER NUM ${order.or_num }</td>
				   		</tr>
				   		<c:set var="or_num_temp" value="${order.or_num }"/>
				   	</c:if>
			   		<tr>
			   			 <th class="th-1"><img src="${conPath }/taxfree/${order.pimage1 }" alt="${order.pimage1 }" width="150" height="150"></th>
			   			 <th class="th-2">${order.pname }</th>
			   			 <th class="th-3">${order.qty }</th>
			   			 <th class="th-4">＄${order.pprice }</th>
			   			 <th class="th-5">＄${order.cost }</th>
			   		</tr>
		 		</table>
	 		</c:forEach>
	 	</div>	<!-- order -->
	</div><!-- orderdetail -->
   	<jsp:include page="../main/footer.jsp"/>
  </body>
</html>