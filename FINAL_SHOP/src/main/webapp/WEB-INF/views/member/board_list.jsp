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
</head>
<body>

		<div class="row pl-5 justify-content-center">
		<div class="col-7">
			<h1 class="display-6 mb-3 text-center">게시판</h1>
			<hr class="mb-3">
		</div>
		<div class="col-6">
			<table class="table table-striped table-hover caption-top">
				
				<caption>${boardList.size() }개의 게시글이 있습니다.</caption>
				
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
	</div>

</body>
</html>