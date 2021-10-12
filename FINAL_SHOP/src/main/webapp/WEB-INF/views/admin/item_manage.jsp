<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>
<script type="text/javascript" src="/resources/admin/js/item_manage.js?ver=1" ></script>
</head>
<body>
		
		<div class="row pl-5 justify-content-center">
		<div class="col-10">
			<h1 class="display-6 mb-3 text-center">상품 관리</h1>
			<hr class="mb-3">
		</div>
		<div class="col-10">
			<table class="table table-striped table-hover caption-top">
				
				<caption>${list.size() }개의 상품이 있습니다.</caption>
				
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">카테고리</th>
						<th scope="col">상품코드</th>
						<th scope="col">상품명</th>
						<th scope="col">가격</th>
						<th scope="col">지은이 / 옮긴이</th>
						<th scope="col">출판사</th>
						<th scope="col">수정 / 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td scope="row">${list.size() - status.index }</td>
									<td>${item.cateCode }</td>
									<td>${item.itemCode }</td>
									<td>${item.itemName }</td>
									<td><fmt:formatNumber value="${item.itemPrice }" type="currency"/></td>
									<td>${item.writer }<c:if test="${not empty item.translator}"> / ${item.translator }</c:if></td>
									<td>${item.publisher }</td>
									<td><input class="btn btn-primary mx-1" type="button" value="수정">
									<input class="btn btn-danger mx-1 deleteBtn" type="button" value="삭제" data-code="${item.itemCode }"></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<tr style="text-align: center;">
									<td colspan="8">상품을 추가해주세요.</td>
								</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>