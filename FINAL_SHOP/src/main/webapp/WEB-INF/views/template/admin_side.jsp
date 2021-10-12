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
	<div class="list-group" style="padding-right: 5%;">
		<c:forEach var="side" items="${sideMenuList }">
			<a href="/admin/${side.sideMenuUri }" class="list-group-item list-group-item-action  <c:if test="${side.sideMenuUri eq sidePage }">active</c:if>  " >${side.sideMenuName }</a>
		</c:forEach>
	</div>
</body>
</html>