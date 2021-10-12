<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>
<script type="text/javascript" src="/resources/admin/js/category_manage.js?ver=3" ></script>
</head>
<body>
	<div class="row pl-5 justify-content-center">
		<div class="col-7">
			<h1 class="display-6 mb-3 text-center">카테고리 관리</h1>
			<hr class="mb-3">
		</div>
		<div class="col-6">
			<form action="/admin/regCate" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default">카테고리명</span>
				<input type="text" name="cateName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				<input class="btn btn-primary" id="insertCate" type="submit" value="추가">
			</div>
			</form>
		</div>
		
		<div class="col-7">
			<table class="table table-striped table-hover caption-top">
				
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="40%">
					<col width="10%">
				</colgroup>
				
				<caption>${list.size() }개의 카테고리가 있습니다.</caption>
				
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">카테고리코드</th>
						<th scope="col">카테고리명</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="list" items="${list }" varStatus="index">
								<tr>
									<td scope="row">${index.count }</td>
									<td>${list.cateCode }</td>
									<td>${list.cateName }</td>
									<td><input class="btn btn-danger deleteBtn" type="button" value="삭제" data-code="${list.cateCode }"></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<tr style="text-align: center;">
									<td colspan="4">카테고리를 추가해주세요.</td>
								</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>