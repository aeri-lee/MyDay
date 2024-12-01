<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/egovframework/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist+Mono:wght@100..900&family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>로그인-My Day</title>
</head>
<body>

<div class="login">
	<div class="todoTitle" style="font-size:50px !important;"><p>Welcome My Day</p></div>
	<div class="login_box">
		<form action="/login.do" method="post">
			<div class="login_id" style=" background-color: #fff;">	
				<input type="text" class="input_id" id="ID" name="ID" title="아이디" placeholder="아이디"/>
	</div>
			<div class="login_pw" style=" background-color: #fff;">
				<input type="text" class="input_pass" id="PASS" name="PASS" placeholder="비밀번호" />
			</div>
			<div class="goLogin">
				<button id="login" type="submit">로그인</button>
   			</div>
		</form>
		<button class="newUser" onclick="location.href='/newUser.do'" id="newUser" >회원가입</button>
	</div>
</div>
</body>
</html>