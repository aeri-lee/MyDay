<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입-My Day</title>
<link rel="stylesheet" type="text/css" href="/css/egovframework/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist+Mono:wght@100..900&family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
* { 
	margin:0;
	padding:0; 
	background-color:#fff;
	font-family: "Nanum Gothic", sans-serif;
}
.userSave{
	padding: 15px;
    margin-top: 60px;
    width: 400px;
    border-radius: 26px;
    background-color: #003f5c;
    color: #fff;
    border: 1px solid #003f5c;
    font-size: 15px;
    }
</style>
</head>
<body >
	<div class="newUserPage">
		<div class="memberBox">
			<div class="todoTitle" style="font-size:30px !important"><p style="margin: 0px 0px 50px 75px !important;text-align: left">회원가입</p></div>
			<form id="member" class="member" method="POST">
				<div class="newItem"> 
					<input id="id" name="ID" placeholder="아이디"  />
					<input id="name" name="NAME" placeholder="이름"  />
					<input id="email" name="EMAIL" placeholder="이메일"  />
					<p>영문, 숫자, 특수문자를 혼합하여 6~20자를 입력해주세요.</p>
					<input id="pass" name="PASS" placeholder="비밀번호"  />
				</div>
				<button class="userSave" id="saveButton" >가입하기</button>
			</form>
		</div>
	</div>

<script>
	$("#saveButton").click(function () {
		var id = $("#id").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var password = $("#pass").val();
     	var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{6,20}$/;
         if (!passwordPattern.test(password)) {
        	 alert("비밀번호는 6~20자 길이로 영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
         }
         else if(id == '' || name=='' || email==''){
        	 alert("모든 항목을 입력해주세요.");
         }
         else{
			 if (confirm("가입하시겠습니까?")) {
				 event.preventDefault(); 
	     		// 폼 데이터 수집
	     		var formData = $("#member").serialize();
	     	
     			$.ajax({
         		url: "/newMember.do", 
	         	type: "POST",
	         	data: formData,
	         	dataType: "text", 
	         	success: function () {
	        	  alert("가입완료");
	        	  window.location.href = "/main.do";
	         	},
	         	error: function () {
	             alert("중복된 ID입니다.");
	         	}
	     		});
		 	}
         }
 	});
</script>
</body>
</html>