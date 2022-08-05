<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
$(document).ready(function(){
	var searchif = '${param.searchif }';
	if(searchif == 'tripStyle' ){
		$('.schItem').css("display","none");
		$('.tripStyle').css("display","block");
	} else if(searchif == 'gender'){
		$('.schItem').css("display","none");
		$('.gender').css("display","block");
	} else if(searchif == 'tboard'){
		$('.schItem').css("display","none");
		$('.tboard').css("display","block");
	} else if(searchif == ''){
		$('.schItem').css("display","none");
	}
	
	$('#bList tr').click(function(){
		var tnum = $(this).children().eq(0).text();
			if(!isNaN(tnum)){
				location.href='${conPath }/trip.do?method=tripBoardDetail&tnum='+tnum+'&pageNum=${paging.currentPage }';
			}
	});
	$('#searchOption').change(function(){
		var searchOption = $('#searchOption').val();
		$('.schItem').css("display","none");
		$('input[name="tgender"]').prop("checked",false);
		$('input[name="tstyle"]').prop("checked",false);
		$('input[name="thotelstyle"]').prop("checked",false);
		$('input[name="tplaystyle"]').prop("checked",false);
		$('input[name="tboard"]').val('');
		if(searchOption  == 'tripStyle'){
			$('.tripStyle').css("display","block");
		} else if(searchOption == 'gender'){
			$('.gender').css("display","block");
		} else if(searchOption == 'tboard'){
			$('.tboard').css("display","block");
		} else if(searchOption == ''){
			$('.schItem').css("display","none");
		}
	});
	
});
</script>
</head>
<body>
	
	<c:if test="${param.writeBoardResult eq 2}">
		<script>
			alert('여행 구인글 등록에 성공했습니다.');
		</script>	
	</c:if>
	<c:if test="${not empty param.writeBoardResult and param.writeBoardResult != 2 }">
		<script>
			alert('여행 구인글 등록에 실패했습니다.');
			history.back();
		</script>
	</c:if>
	<c:if test="${applyResult eq 1}">
		<script>
			alert('신청에 성공했습니다. 여행팀장이 확인할때까지 기다려주세요');
		</script>
	</c:if>
	<c:if test="${param.modifyResult eq 1 }">
		<script>
			alert('여행 구인글 수정에 성공했습니다.');
		</script>	
	</c:if>
	<c:if test="${not empty param.modifyResult and param.modifyResult != 1 }">
		<script>
			alert('여행 구인글 수정에 실패했습니다.');
			history.back();
		</script>
	</c:if>
	<div>
		<a href="${conPath }/trip.do?method=tripWriteBoardView">여행 구인글 쓰기</a>
	</div>
	<div>
		<form action="${conPath }/trip.do?method=tripBoardList" method="post" >
				<input type="hidden" name="pageNum" value="1">
				<span>
						검색조건 : <select name="searchif" id="searchOption">
									<option value=""></option>
									<option value="tripStyle" <c:if test="${param.searchif eq 'tripStyle' }">
																			selected="selected"
																</c:if> >여행 스타일
									</option>
									<option value="gender" <c:if test="${param.searchif eq 'gender' }">
																			selected="selected"
																</c:if>>모집 성별
									</option>
									<option value="tboard" <c:if test="${param.searchif eq 'tboard' }">
																			selected="selected"
																</c:if>>글 제목 + 작성자
									</option>
								</select>
				</span>
				<span style="display:none;" class="gender schItem">				
						모집 성별 :   <input type="radio" name="tgender" value="MG" <c:if test="${param.tgender eq 'MG' }">
																					checked="checked"
																				  </c:if>>혼성
									<input type="radio" name="tgender" value="M" <c:if test="${param.tgender eq 'M' }">
																					checked="checked"
																				  </c:if>>남성
									<input type="radio" name="tgender" value="F" <c:if test="${param.tgender eq 'F' }">
																					checked="checked"
																				  </c:if>>여성
				</span>
				<span style="display:none;" class="tripStyle schItem">								
						여행 스타일 : <input type="radio" name="tstyle" value="TRIPBUSY" <c:if test="${param.tstyle eq 'TRIPBUSY' }">
																							checked="checked"
																						</c:if>>바쁜 일정
									<input type="radio" name="tstyle" value="TRIPSTAY" <c:if test="${param.tstyle eq 'TRIPSTAY' }">
																							checked="checked"
																						</c:if>>호캉스 
									||
						숙소 스타일 : <input type="radio" name="thotelstyle" value="CHEAP" <c:if test="${param.thotelstyle eq 'CHEAP' }">
																							checked="checked"
																						</c:if>>가성비
									<input type="radio" name="thotelstyle" value="EXPENSIVE" <c:if test="${param.thotelstyle eq 'EXPENSIVE' }">
																							checked="checked"
																						</c:if>>호화로운
									||
						노는 스타일 : <input type="radio" name="tplaystyle" value="QUIET" <c:if test="${param.tplaystyle eq 'QUIET' }">
																							checked="checked"
																						</c:if>>휴양
									<input type="radio" name="tplaystyle" value="ACTIVITY" <c:if test="${param.tplaystyle eq 'ACTIVITY' }">
																							checked="checked"
																						   </c:if>>액티비티
				</span>	
				<span style="display:none;" class="tboard schItem">
					   <input type="text" name="tboard" value="${param.tboard }">
				</span>
						<input type="submit" value="검색">
		</form>
	</div>
	<div>
		<table id="bList">
			<caption>Trip Mate 게시판</caption>			
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>모집성별</th>
				<th>현재인원</th>
				<th>모집인원<th>
				<th>조회수</th>
			</tr>
			<c:if test="${tripList.size() eq 0 }">
				<tr>
					<td colspan="6">검색조건에 해당하는 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${tripList.size() != 0 }">
			<c:forEach var="trip" items="${tripList }">
				<tr>
					<td>${trip.tnum }</td>
					<td>${trip.ttitle }</td>
					<td>
						<c:if test="${trip.tgender eq 'M' or trip.tgender eq 'F' }">
							동성
						</c:if>
						<c:if test="${trip.tgender eq 'MG' }">
							혼성
						</c:if>
					</td>
					<td>${trip.tnowmembercount }</td>
					<td>${trip.tmaxmembercount }</td>
					<td>${trip.thit }</td>
				</tr>
			</c:forEach>
			</c:if>
		</table>
		<button onclick="location='${conPath }/main.do'">메인으로</button>
	</div>	
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/trip.do?method=tripBoardList&pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/trip.do?method=tripBoardList&pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/trip.do?method=tripBoardList&pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	
</body>
</html>
