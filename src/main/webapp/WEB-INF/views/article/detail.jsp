<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
	<div class="grid-Wrapper">
		<div class="grid">
			<div class="grid-sizer"></div>
			<div class="gutter-sizer"></div>
			<div class="detail-item detail-width6">
				<h2 class="pad-top10 pad-bottom10">${articleDTO.bnTitle}</h2>
				<table class="detailTbl tbl-lg">
					<tr>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
						<td>좋아요</td>
					</tr>
					<tr> 
						<td>${articleDTO.insertId}</td>
						<td><fmt:formatDate value="${articleDTO.insertDay}" pattern="yyyy.MM.dd"/></td>
						<td>${articleDTO.readcount}</td>
						<td>${articleDTO.heart}</td>
					</tr>
					<tr>
						<td colspan="4" style="min-height: 400px;">${articleDTO.content }</td>
					</tr>
					<tr>
						<td colspan="4" style="height: 100px; border-bottom: 1px solid;">
						<!--login은 실행후 검사 -->
						<div>
							<button class="btn btn-lg btn-blue" onclick="">좋아요</button>
							<a class="btn btn-lg btn-blue" onclick="">신고</a>
							<a class="btn btn-lg btn-yellow" onclick="">댓글등록</a>
						</div>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="height: 50px;">Comment</td>
					</tr>
				</table>
			</div>
			<div class="detail-item detail-width6">
				<div class="text-center pad-top10 pad-bottom20">
					<c:if test="${memId eq 'admin' }">
						<input id="addBtn" type="button" class="btn btn-md btn-blue" value="글이동">
					</c:if>
						<input type="button" class="btn btn-md btn-grey" value="목록으로" onclick="window.location='/article'" />
					<c:if test="${memNickName eq articleDTO.insertId}">
						<input id="addBtn" type="button" class="btn btn-md btn-blue" value="수정">
						<input id="addBtn" type="button" class="btn btn-md btn-blue" value="삭제">
					</c:if>
				</div>
			</div>
			<div class="detail-item detail-width6">
				<table class="detailTbl tbl-lg">
					<tr>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
						<td>좋아요</td>
					</tr>
					<c:forEach var="articleDTO" items="${list}">
						<tr>
							<td>${articleDTO.bnTitle}</td>
							<td>${articleDTO.insertId}</td>
							<td><fmt:formatDate value="${articleDTO.insertDay}" pattern="yyyy.MM.dd"/></td>
							<td>${articleDTO.readcount}</td>
							<td>${articleDTO.heart}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="detail-item detail-width6">
			<input id="addBtn" type="button" class="btn btn-md btn-grey" value="더보기" onclick="more()">
			<input type ="hidden" value="0" id="moreVal">
		</div>
	</div>
</body>

<script>
function more(){
	var moreVal = $('#moreVal').val()+1;
	$('#moreVal').val(morVal);
	alert(moreVal);
	var context = window.location.pathname.substring(0,
			window.location.pathname.indexOf("/", 2));
	$.ajax({
		url : context + '/more',
		type : "post",
		data : moreVal,
		success : function(data) {
			console.log(data);

		}
	});
}
</script>
</html>