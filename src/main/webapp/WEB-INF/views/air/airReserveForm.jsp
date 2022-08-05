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
	<style>
	.seat{
	 overflow:hidden;
	}
	.seat1{
	float:left;
	}
	.seat2{
	float:left;
	}
	</style>
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

        <table class="seat1">
        <tr>
	        <td><input type="checkbox" name="seatid" value="A1"></td>
	        <td><input type="checkbox" name="seatid" value="A2"></td>
	    </tr>
	    <tr>
	        <td><input type="checkbox" name="seatid" value="A3"></td>
	        <td><input type="checkbox" name="seatid" value="A4"></td>
        </tr>
        <tr>
	        <td><input type="checkbox" name="seatid" value="A5"></td>
	        <td><input type="checkbox" name="seatid" value="A6"></td>
	    </tr>
	    <tr>
	        <td><input type="checkbox" name="seatid" value="A7"></td>
	        <td><input type="checkbox" name="seatid" value="A8"></td>
        </tr>
        <tr>
	        <td><input type="checkbox" name="seatid" value="A9"></td>
	        <td><input type="checkbox" name="seatid" value="A10"></td>
	    </tr>
	    </table>
		<table class="seat1">
	    <tr>
	        <td><input type="checkbox" name="seatid" value="A11"></td>
	        <td><input type="checkbox" name="seatid" value="A12"></td>
        </tr>
		
		<tr>
	        <td><input type="checkbox" name="seatid" value="A13"></td>
	        <td><input type="checkbox" name="seatid" value="A14"></td>
	    </tr>
	    <tr>
	        <td><input type="checkbox" name="seatid" value="A15"></td>
	        <td><input type="checkbox" name="seatid" value="A16"></td>
        </tr>
        <tr>
	        <td><input type="checkbox" name="seatid" value="A17"></td>
	        <td><input type="checkbox" name="seatid" value="A18"></td>
	    </tr>
	    <tr>
	        <td><input type="checkbox" name="seatid" value="A19"></td>
	        <td><input type="checkbox" name="seatid" value="A20"></td>
        </tr>
        </table>    
        <input type="submit" value="예약하기">
        </form>
        </div> <!-- image -->
    </div> <!-- seat -->
</body>
</html>