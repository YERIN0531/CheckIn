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
	<link href="${conPath }/css/air/airmain.css" rel="stylesheet">
	 
  <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
	<style>
	img{
	width:90px;
	height:30px;
	}
	.ko{
	width:80px;
		height:20px;}
	.as{
		width:90px;
		height:25px;
	}
	.je{
		width:80px;
		height:20px;
	}
	       
            #reserve {
                padding-left: 4px;
                background: url("${conPath}/image/air6.png") no-repeat;
                background-size:100%;
                width: 100%;
                height: 400px;
            }
	</style>
</head>
<body>

<jsp:include page="../main/header.jsp"/>
	<section>
        <div id="list">
            <div id="lnb">
                <ul>
                    <li><a href="${conPath }/air.do?method=airMain">항공</a></li>
                    <li><a href="${conPath }/hotel.do?method=hotelMain">호텔</a></li>
                    <li><a href="${conPath}/taxfree.do?method=category">면세점</a></li>
                    <li><a href="${conPath}/notice.do?method=boardmain">게시판</a></li>
                </ul>
            </div>
        </div>

        <div id="reserve">
            <div id="word">
                <p>AIR RESERVATION</p>
            </div>
            <div id="rsform">
                <form action="${conPath }/air.do">
                    <input type="hidden" name="method" value="airList">
                    <input type="hidden" name="mid" value="${member.mid }">
                    <table>
                        <tr>
                            <td>
                                <p class="w1">출발지</p>
                                <input type="text" name="adepartloc" value="" placeholder="국가(도시)">
                            </td>
                            <td>
                                <p class="w1">도착지</p>
                                <input type="text" name="aariveloc" value="" placeholder="국가(도시)">
                            </td>
                            <td>
                                <p class="w1">가는날</p>
                                <input type="text" name="agodate" id="datepicker">
                            </td>
                            <td>
                                <p class="w1">오는날</p>
                                <input type="text" name="acomedate" id="datepicker2">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <input type="submit" value="항공권검색">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

		

        <h2>AIR LIST</h2>

        <c:if test="${empty airList}">
        <div id="noneairlist">
					<table>
					<tr><td>항공 스케쥴을 검색해 주세요</td></tr>
					</table>
        </div>

		</c:if>
        
        <div id="airlist">

            <c:forEach var="air" items="${airList }">
                <div class="airticket">
                    <table>
                    
                        <tr>
                        <td rowspan="2" >${air.acode }</td>
                            <td>
                            	<c:if test="${air.acode.substring(0,2)  eq 'KO' }" >
                               		<img src="${conPath }/image/korea.png" alt="사진2" class="ko">
                               		
                               </c:if>
                               <c:if test="${air.acode.substring(0,2) eq 'JE' }">
                               		<img src="${conPath }/image/jeju.png" alt="사진1" class="je">
                               </c:if>
                                <c:if test="${air.acode.substring(0,2) eq 'AS' }">
                               		<img src="${conPath }/image/as.png" alt="사진1" class="as">
                               </c:if>
                            </td>
                            <td>
                                ${air.agotime}
                            </td>
                            <td>--------------------</td>
                            <td>
                                ${air.ago_arrivetime }
                            </td>
                            <td rowspan="2" colspan="2" class="w3">
                            ${air.aprice}<br />
                                <button onclick="location='${conPath }/air.do?method=reservation&acode=${air.acode }&agodate=${param.agodate }&acomedate=${param.acomedate }&aprice=${air.aprice }&mid=${member.mid }'">선택</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               	<c:if test="${air.acode.substring(0,2)  eq 'KO' }" >
                               		<img src="${conPath }/image/korea.png" alt="사진2" class="ko">
                               		
                               </c:if>
                               <c:if test="${air.acode.substring(0,2) eq 'JE' }">
                               		<img src="${conPath }/image/jeju.png" alt="사진1" class="je">
                               </c:if>
                                <c:if test="${air.acode.substring(0,2) eq 'AS' }">
                               		<img src="${conPath }/image/as.png" alt="사진1" class="as">
                               </c:if>
                            </td>
                            <td>
                                ${air.acome_departtime }
                            </td>
                            <td>--------------------</td>

                            <td>
                                ${air.acome_arrivetime }
                            </td>
                        </tr>
                    </table>
                </div>
            </c:forEach>
        </div>
    </section>
    <jsp:include page="../main/footer.jsp"/>
<%-- 	<jsp:include page="../main/footer.jsp"/> --%>

</body>
</html>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
   $(function() {
	   
	   $("#datepicker,#datepicker2").datepicker(
	            {            
	               dateFormat : 'yy-mm-dd',
	               changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
	               changeYear:true,
	               monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	                                 '7월', '8월', '9월', '10월', '11월', '12월' ],
	               showMonthAfterYear : true,
	               yearSuffix : '년', // "2020년 3월"
	               showOtherMonths : true,
	               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	               changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
	               minDate : 0, // 현재 날짜로부터 100년 이전까지 표시
	               maxDate : '10y', // 현재 날짜이전까지만 표시
	               yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
	            });

       $('#datepicker').datepicker("option", "maxDate", $("#datepicker2").val());
       $('#datepicker').datepicker("option", "onClose", function (selectedDate){
           $("#datepicker2").datepicker( "option", "minDate", selectedDate );
           });
       
       $('#datepicker2').datepicker();
       $('#datepicker2').datepicker("option", "minDate", $("#datepicker").val());
       $('#datepicker2').datepicker("option", "onClose", function (selectedDate){
           $("#datepicker").datepicker( "option", "maxDate", selectedDate );
          });
   });  
</script>