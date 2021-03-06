<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL_SHOP</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/member/js/member_join_form.js?ver=28" ></script>
</head>
<body>

<form class="row g-0" action="/member/join" method="post">
	<h1 class="display-6 text-center">회원가입</h1>
	<div class="row g-0 justify-content-center">
		<div class="col-5">
		<hr>
			<div class="col-12 pt-1">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="10자리 내의 한글로 입력" required>
			</div>
			<div class="col-12 pt-1">
				<div class="row">
						<label for="id" class="form-label">아이디</label>
					<div class="col">
						<input type="text" class="form-control" id="id" name="id" placeholder="4자~12자리의 영문자, 숫자 / @,#$등 특수문자는 제외" required>
					</div>
					<div class="col-2 d-grid checkId" style="padding-left: 5px;">
					<button type="button" class="btn btn-primary" onclick="checkId();">중복확인</button>
					</div>
					<div class="col-12" id="idAlert" style="color: red; font-size: 14px;"></div>
				</div>	
			</div>
			<div class="col-12 pt-1">
				<label for="pw" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw" placeholder="영문 대문자, 소문자, 숫자, 특수문자를 3가지 이상 사용하여 8자 이상, 20자 이하로 설정하십시오." required>
			</div>
			<div class="col-12 pt-1">
				<label for="pw" class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" id="checkPw" placeholder="비밀번호를 다시 한번 입력해주세요." required>
			</div>
			<div class="col-12 pt-1">
				<div class="row">
				<label for="tell" class="form-label">연락처</label>
					<div class="col">
					<select class="form-select" name="tells">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="018">018</option>
					</select>
					</div>
					<div class="col">
						<input type="text" class="form-control" name="tells" required>
					</div>
					<div class="col">
						<input type="text" class="form-control" name="tells" required>
					</div>
				</div>
			</div>
			<div class="col-12 pt-1">
				<div class="row">
<!-- 					<label for="addr" class="form-label">주소</label>
					<div class="col-10">
					<input type="text" class="form-control" name="addrs">
					</div>
					<div class="col-2 d-grid" style="padding-left: 5px;">
					<button type="button" class="btn btn-primary">주소찾기</button>
					</div>
					<div class="col-12 pt-1">
					<input type="text" class="form-control" name="addrs" placeholder="상세주소">
					</div>
					 -->
					<label for="addr" class="form-label">주소</label>
					<div class="col-10">
					<input type="text" class="post form-control" name="addrs" id="postcode"  placeholder="우편번호" readonly required>
					</div>
					<div class="col-2 d-grid" style="padding-left: 5px;">
					<input type="button" class="post btn btn-primary" onclick="openPostcode()" value="우편번호 찾기">
					</div>
					<div class="col-12 pt-1">
					<input type="text" class="post form-control" name="addrs" id="address" placeholder="주소" readonly required>
					<input type="text" class="post form-control" name="addrs" id="detailAddress" placeholder="상세주소">
					</div>
					
			

					
					
					
					
				</div>
			</div>
			<div class="col-12 pt-1">
			<label for="gender" class="form-label">성별</label>
				<div class="col-12">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="male" value="남">
						<label class="form-check-label" for="male">남</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="female" value="여">
						<label class="form-check-label" for="female">여</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" id="none" value="" checked>
						<label class="form-check-label" for="none">선택안함</label>
					</div>
				</div>
			</div>
			<div class="d-grid pt-3">
					<button type="submit" id="joinBtn" class="btn btn-primary disabled" onclick="goJoin();">회원가입</button>
			</div>
		</div>
	</div>

</form>

</body>
</html>