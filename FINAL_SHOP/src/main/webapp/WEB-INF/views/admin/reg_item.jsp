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
	
	<form action="/admin/regItem" method="post" enctype="multipart/form-data">
	<div class="row justify-content-center">
		<div class="col-7">
			<h1 class="display-6 mb-3 text-center">상품 등록</h1>
			<hr>
			<div class="col-12 pt-1">
				<label for="form-select" class="form-label">카테고리</label>
				<select class="form-select" name="cateCode">
				<option selected>선택하세요</option>
				<c:forEach var="cate" items="${list }">
					<option value="${cate.cateCode }">${cate.cateName }</option>
				</c:forEach>

				</select>
			</div>
			<div class="col-12 pt-1">
				<label for="itemName" class="form-label">상품명</label>
				<input type="text" class="form-control" name="itemName" required>
			</div>
			<div class="col-12 pt-1">
				<label for="itemPrice" class="form-label">가격</label>
				<input type="text" class="form-control" name="itemPrice" required>
			</div>
			<div class="row">
			<div class="col-6 pt-1">
				<label for="writer" class="form-label">지은이</label>
				<input type="text" class="form-control" name="writer" required>
			</div>
			<div class="col-6 pt-1">
				<label for="writer" class="form-label">옮긴이</label>
				<input type="text" class="form-control" name="translator">
			</div>
			</div>
			<div class="col-12 pt-1">
				<label for="publisher" class="form-label">출판사</label>
				<input type="text" class="form-control" name="publisher" required>
			</div>
			<div class="col-12 pt-1">
				<label for="publisher" class="form-label">출간일</label>
				<input type="date" class="form-control" name="pubDate" required>
			</div>
			<div class="row">
			<div class="col-6 pt-1">
				<label for="writer" class="form-label">쪽수</label>
				<input type="text" class="form-control" name="page">
			</div>
			<div class="col-6 pt-1">
				<label for="writer" class="form-label">ISBN</label>
				<input type="text" class="form-control" name="isbn" required>
			</div>
			</div>
			<div class="col-12 pt-1">
				<label for="main" class="form-label">썸네일</label>
				<input type="file" name="file" class="form-control" id="inputGroupFile01">
			</div>
			<div class="col-12 pt-1">
				<label for="image" class="form-label">이미지</label>
				<input type="file" name="files" class="form-control" id="inputGroupFile01" multiple>
			</div>
			<div class="d-grid pt-3">
				<button type="submit" class="btn btn-primary" >상품등록</button>
			</div>
		</div>
	</div>
	</form>
</body>
</html>