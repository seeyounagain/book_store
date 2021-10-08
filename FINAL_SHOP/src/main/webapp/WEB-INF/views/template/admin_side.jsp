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
	<c:choose>
		<c:when test="${sidePage eq 'cateManage' or sidePage eq 'regItem' or sidePage eq 'itemManage' }">
			<div class="list-group" style="padding-right: 5%;">
				<a href="/admin/itemManage" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'itemManage' }">active</c:if>" >상품관리</a>
				<a href="/admin/regItem" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'regItem' }">active</c:if> ">상품등록</a>
				<a href="/admin/categoryManage" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'cateManage' }">active</c:if> ">카테고리관리</a>
			</div>
		</c:when>
		<c:when test="${sidePage eq 'memberList' or sidePage eq 'memberManage' }">
			<div class="list-group" style="padding-right: 5%;">
				<a href="/admin/memberManage" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'memberManage' }">active</c:if>" >회원관리</a>
				<a href="/admin/memberList" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'memberList' }">active</c:if> ">회원조회</a>
			</div>
		</c:when>
	</c:choose>
</body>
</html>