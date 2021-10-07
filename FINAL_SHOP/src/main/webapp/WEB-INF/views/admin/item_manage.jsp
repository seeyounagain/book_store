<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>
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
							<c:forEach var="item" items="${list }" varStatus="index">
								<tr>
									<th scope="row">${list.size() - index.count + 1 }</th>
									<td>${item.cateCode }</td>
									<td>${item.itemCode }</td>
									<td>${item.itemName }</td>
									<td>${item.itemPrice }</td>
									<td>${item.writer }<c:if test="${not empty item.translator}"> / ${item.translator }</c:if></td>
									<td>${item.publisher }</td>
									<td><input class="btn btn-primary mx-1" type="button" value="수정">
									<input class="btn btn-primary mx-1" type="button" value="삭제"></td>
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