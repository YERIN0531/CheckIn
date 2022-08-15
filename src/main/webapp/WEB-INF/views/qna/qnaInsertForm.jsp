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
   <link href="${conPath }/css/board/qnawrite.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR:wght@300;400&family=Libre+Baskerville&family=Nanum+Gothic&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
     <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
   <script>
	$(document).ready(function() {
		$('#cs_channel_etc').click(function() {
			$('#etc_view').css('display', 'block');
		});
		$('#cs_channel').on('click', function() {
			$('#etc_view').css('display', 'none');
		});
	});
</script>
</head>
<body>
<jsp:include page="../board/boardmain.jsp"/>
<div id="content">
		<form action="${conPath }/qna.do?method=insertQna" method="post"enctype="multipart/form-data">

			<%-- <input type="text" name="qid" value= "${qid}"> --%>
			<input type="hidden" name="qid" value="${member.mid }">
			<table>
				<caption>WRITE</caption>
				

				<tr>
					<th class="th-1">글제목</th>
					<td><input type="text" name="qtitle" required="required"
						value="${qnaDto.qtitle }"></td>
				</tr>
				<tr>
					<th class="th-2">글본문</th>
					<td><input type="text" name="qcontent" required="required"></td>
				</tr>
				<tr>
					<th>사진1</th>
					<td><input type="file" name="temprimage1"></td>
				</tr>
				<tr>
					<th>사진2</th>
					<td><input type="file" name="temprimage2"></td>
				</tr>
				<tr>
					<th class="th-3">비밀글여부</th>
					<td><input type="radio" name="qsecret" id="cs_channel_etc" value="1" class="radio" /><span class="ml_10">비밀글</span>&nbsp; 
					<input type="radio" name="qsecret" id="cs_channel" value="0"class="radio" /><span class="ml_10">공개글</span>&nbsp; <br> <br>
						
					<div id="etc_view" style="display: none;">
						<input type="password" id="cs_channel_etc_view" name="qpassword" class="form-control" style="width: 200px"
								placeholder="글 비밀번호를 입력하세요 " />
				   </div>
				<tr>
					<td colspan="2" class="btn"><input type="submit" value="등록"> <input
						type="button" value="목록"
						onclick="location='${conPath }/qna.do?method=qnaList&pageNum=${param.pageNum}'">
					</td>
				</tr>
			</table>
		</form>
	</div>  
	<jsp:include page="../main/footer.jsp"/> 
</body>
</html>