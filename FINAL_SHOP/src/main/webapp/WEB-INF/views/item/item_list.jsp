<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>
<style type="text/css">
.text-truncate:hover {
	overflow: visible;
}
</style>
</head>
<body>
<div class="row row-cols-1 row-cols-md-6 g-4">

	<c:choose>
	<c:when test="${not empty itemList }">
		<c:forEach var="item" items="${itemList }">
		<div class="col">
			<div class="card" style="width: 18rem;">
				<img src="/resources/upload/${item.attachedImgName }" class="card-img-top">
				<div class="card-body">
					<c:if test="${not empty item.contentTitle }">
					<p class="card-text content card-subtitle mb-2 fst-italic text-truncate" style="max-heigt: 150px;">"${item.contentTitle }"</p>
					</c:if>
					<p class="card-text fs-4 mb-0">${item.itemName }</p>
					<p class="card-text mb-0">${item.writer }</p>
					<c:if test="${not empty item.translator }">
					<p class="card-text mb-0"> / ${item.translator }</p>
					</c:if>
					<p class="card-text"><fmt:formatNumber value="${item.itemPrice }" type="currency"/></p>
					
				</div>
			</div>
		</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="col text-center">
					<p>판매중인 상품이 없습니다.</p>
		</div>	
	</c:otherwise>

	</c:choose>
</div>
</body>
</html>