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
	<div class="row justify-content-center">
		<div class="col-10">
			<table class="table table-striped table-hover">
					<tr>
						<th scope="col">카테고리명</th>
						<th scope="col"><input type="text"></th>
						<th scope="col">분류번호</th>
						<th scope="col"><input type="text"></th>
						<th scope="col"><input type="button" class="btn btn-primary" value="추가"></th>
					</tr>
			</table>
		</div>
		<div class="col-10">
			<table class="table table-striped table-hover caption-top">
				
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="40%">
					<col width="10%">
				</colgroup>
				
				<caption>${list.size() }건의 카테고리가 있습니다.</caption>
				
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">분류번호</th>
						<th scope="col">카테고리명</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list }" varStatus="index">
						<tr>
							<th scope="row">${index.count }</th>
							<td>${list.cateCode }</td>
							<td>${list.cateName }</td>
							<td><input class="btn btn-primary" type="button" value="삭제"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>