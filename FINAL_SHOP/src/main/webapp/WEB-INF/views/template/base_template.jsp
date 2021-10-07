<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<!-- reset css -->
<link rel="stylesheet" href="/resources/common/css/reset.css?ver=7">
<!-- 제이쿼리 (부트스트랩 js 와 같은 문법을 사용하기 때문에 먼저 실행 되어야함) -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<style type="text/css">
/* 폰트 설정 */
@font-face {
    font-family: 'SLEIGothicTTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SLEIGothicTTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* 폰트 설정 & 드래그 방지 */
body {
	font-family: 'SLEIGothicTTF';
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}
/* 컨테이너 크기 조정 */
.container-fluid {
	width: 90%;
	padding-bottom: 5%;
}
.nav-link {
	color: black;
}
.btn-primary , .btn {
	background-color: steelblue;
	border-color: steelblue;
}
.form-check-input:checked {
	background-color: steelblue;
	border-color: steelblue;
}
.list-group-item.active {
	background-color: steelblue;
	border-color: steelblue;	
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col"><tiles:insertAttribute name="menu"/></div>
		</div>
		<div class="row">
			<div class="col"><tiles:insertAttribute name="body"/></div>
		</div>
	</div>
</body>
</html>


