<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>

<!-- not empty loginInfo 라고 해주면 세션에 있는 데이터인지, jsp에서 받아 온 데이터인지
구분하기 어렵기 때문에 알기쉽도록 sessionScope 을 붙여 구분해주는 것이 좋다  -->

<c:choose>
	<c:when test="${not empty sessionScope.loginInfo }">
		<script type="text/javascript">
			alert('${loginInfo.name }님 환영합니다.');
			location.href = '/item/itemList';
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('아이디 또는 비밀번호를 확인해주세요.');
			location.href = '/member/loginForm';
		</script>
	</c:otherwise>
</c:choose>
</head>
<body>

</body>
</html>