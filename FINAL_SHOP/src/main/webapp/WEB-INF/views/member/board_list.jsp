<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/member_join_form.js?ver=28" ></script>
<style type="text/css">
.nowPage {
	background-color: #6c757d;
	color: white;
}
</style>
</head>
<body>

	<div class="row pl-5 justify-content-center">
		<div class="col-7">
			<h1 class="display-6 mb-3 text-center">게시판</h1>
			<hr class="mb-3">
		</div>
		<div class="col-7">
		<form action="/common/boardList" method="post">
			<div class="row justify-content-center mb-2">
				<div class="col-2">
					<select class="form-select" name="searchKeyword">
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
							<option value="WRITER">작성자</option>
					</select>
				</div>
				<div class="col-4">
					<input type="text" class="form-control" name="searchValue" placeholder="검색어 입력">
				</div>
				<div class="col-1">
					<button type="submit" class="btn btn-secondary" >검색</button>
				</div>
			</div>
		</form>
		</div>
		<div class="col-6">
			<table class="table table-striped table-hover caption-top">
				
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				
				<thead>
					<tr>
						<th scope="col" class="text-center">#</th>
						<th scope="col" class="text-center">제목</th>
						<th scope="col" class="text-center">작성자</th>
						<th scope="col" class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty boardList }">
							<c:forEach var="board" items="${boardList }">
								<tr>
									<td class="text-center">${board.boardNum }</td>
									<td>${board.title }</td>
									<td class="text-center">${board.writer }</td>
									<td class="text-center">${board.createDate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<tr style="text-align: center;">
									<td colspan="4">게시글을 작성해주세요.</td>
								</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="col-7">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
				 <c:if test="${boardVO.prev }">
					<li class="page-item">
					<a class="page-link" href="/common/boardList?nowPage=${boardVO.startPage - 1 }" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					</a>
					</li>
				 </c:if> 
					<c:forEach var="pageNum" begin="${boardVO.startPage }" end="${boardVO.endPage }">
						<li class="page-item <c:if test="${boardVO.nowPage eq pageNum } ">nowPage</c:if> "><a class="page-link" href="/common/boardList?nowPage=${pageNum }">${pageNum }</a></li>
					</c:forEach>
				<c:if test="${boardVO.next }">
					<li class="page-item">
					<a class="page-link" href="/common/boardList?nowPage=${boardVO.endPage + 1 }" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</c:if>
				</ul>
			</nav>
		</div>
	</div>
	
</body>
</html>