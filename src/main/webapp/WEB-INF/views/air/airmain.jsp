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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<section>
        <div id="list">
            <div id="lnb">
                <ul>
                    <li><a href="#">항공</a></li>
                    <li><a href="#">호텔</a></li>
                    <li><a href="#">면세점</a></li>
                    <li><a href="#">게시판</a></li>
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
                                <input type="date" name="agodate" value="">
                            </td>
                            <td>
                                <p class="w1">오는날</p>
                                <input type="date" name="acomedate" value="">
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
        <div id="airlist">

            <c:forEach var="air" items="${airList }">
                <div class="airticket">
                    <table>
                        <tr>
                            <td>
                                ${air.acode }
                            </td>
                            <td>
                                ${air.agotime}
                            </td>
                            <td>------------------------</td>
                            <td>
                                ${air.ago_arrivetime }
                            </td>
                            <td rowspan="2" colspan="2" class="w3">
                            ${air.aprice}<br />
                                <button onclick="location='${conPath }/air.do?method=airReserveForm&acode=${air.acode }&agodate=${param.agodate }&acomedate=${param.acomedate }&aprice=${air.aprice }'">선택</button>
                            </td>
                        </tr>
                        <tr>
                            <td> ${air.acode}</td>
                            <td>
                                ${air.acome_departtime }
                            </td>
                            <td>------------------------</td>

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