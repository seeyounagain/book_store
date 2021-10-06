<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>
<script type="text/javascript" src="/resources/template/js/menu.js?ver=7" ></script>
</head>
<body>

	<!-- loginModal -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
	<form action="/member/login" method="post">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">로그인</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" name="id" placeholder="id" required autofocus>
				  <label for="floatingInput">아이디</label>
				</div>
				<div class="form-floating mb-3">
				  <input type="password" class="form-control" name="pw" placeholder="Password" required>
				  <label for="floatingPassword">비밀번호</label>
				</div>
				<div class="form-floating d-grid">
			       <button type="submit" class="btn btn-primary">로그인</button>
				</div>
	      </div>
	    </div>
	  </div>
	</form>
	</div>
	
	
	
	<div class="row mt-3">
		<div class="col">
			<c:choose>
				<c:when test="${not empty sessionScope.loginInfo }">
					<ul class="nav justify-content-end">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="/member/myPage">환영합니다, <span style="text-decoration: underline 1px black;">${loginInfo.name }</span>님 :)</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" href="#" onclick="logout();">로그아웃</a>
					  </li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav justify-content-end">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="/member/joinForm">회원가입</a>
					  </li>
					  <li class="nav-item">
					     <a class="nav-link active" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
					  </li>
					</ul>
				</c:otherwise>
			</c:choose>	
		</div>
	</div>
	<div class="row text-center pb-5">
		<div class="col">
			<div><img width="30px" src="/resources/img/book-shop.png">&nbsp;<div class="display-5">북적북적</div></div>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col">
			<ul class="nav justify-content-center">
			<c:choose>
				<c:when test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="/item/itemList">홈</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/admin/categoryManage">상품관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="#">회원관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="#">매출관리</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="/item/itemList">홈</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="#">소설/에세이</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="#">컴퓨터/IT</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="#">자기계발</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="#">인문학</a>
					</li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	</div>
	
</body>
</html>