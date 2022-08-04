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
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$("input[type='checkbox']").click(function(){
				var checknum = $("input:checkbox[name='seatid']:checked").length;
	 			var totalprice = Number('${airDto.aprice}')*checknum;
	 			$('input[name="totalprice"]').val(totalprice);
			});
 		 			
		});
	</script>
</head>
<body>
	<div class="seat">
        <div class="image">
 		<form action="air.do">
 		<input type="hidden" name="method" value="airReserveInfo">
 		<input type="hidden" name="acode" value="${param.acode }">
 		<input type="hidden" name="mid" value="${member.mid }">
 		<input type="hidden" name="agodate" value="${airDto.agodate }">
 		<input type="hidden" name="acomedate" value="${airDto.acomedate }">
 		<input type="hidden" name="aprice" value="${airDto.aprice }">
 		<input type="text" name="totalprice">
        <table>
        <tr>
	        <td><input type="checkbox" name="seatid" value="a1"></td>
	        <td><input type="checkbox" name="seatid" value="a2"></td>
	        <td><input type="checkbox" name="seatid" value="a3"></td>
	        <td><input type="checkbox" name="seatid" value="a4"></td>
        </tr>
        <tr>
	        <td><input type="checkbox" name="seatid" value="a5"></td>
	        <td><input type="checkbox" name="seatid" value="a6"></td>
	        <td><input type="checkbox" name="seatid" value="a7"></td>
	        <td><input type="checkbox" name="seatid" value="a8"></td>
        </tr>
        <tr>
	        <td><input type="checkbox" name="seatid" value="a9"></td>
	        <td><input type="checkbox" name="seatid" value="a10"></td>
	        <td><input type="checkbox" name="seatid" value="a11"></td>
	        <td><input type="checkbox" name="seatid" value="a12"></td>
        </tr>
		<tr>
	        <td><input type="checkbox" name="seatid" value="a13"></td>
	        <td><input type="checkbox" name="seatid" value="a14"></td>
	        <td><input type="checkbox" name="seatid" value="a15"></td>
	        <td><input type="checkbox" name="seatid" value="a16"></td>
        </tr>
        <tr>
	        <td><input type="checkbox" name="seatid" value="a17"></td>
	        <td><input type="checkbox" name="seatid" value="a18"></td>
	        <td><input type="checkbox" name="seatid" value="a19"></td>
	        <td><input type="checkbox" name="seatid" value="a20"></td>
        </tr>
        </table>    
        <input type="submit" value="예약하기">
        </form>
        </div>
        <div class="bullets">
            <label for="slide1">&nbsp;</label>
            <label for="slide2">&nbsp;</label>
            <label for="slide3">&nbsp;</label>
            <label for="slide4">&nbsp;</label>
        </div>
    </div>
</body>
</html>