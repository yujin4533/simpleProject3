<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<script src="/project3/resources/js/jquery.min.js"></script>
<script src="/project3/resources/js/skel.min.js"></script>
<script src="/project3/resources/js/util.js"></script>
<script src="/project3/resources/js/main.js"></script>
<script src="/project3/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {

		$("#userName").focus();

		$("#userID").click(function (key) {
			document.registerFrm.idCK.value="";
		});
		
		$("#idCK").click(function (key) {
			userID = {userID:$("#userID").val().trim()};
			$("id_error").show();
			if($("#userID").val().trim().length>3){
				$.ajax({
					url:"idCheck.p3",
					type:"POST",
					dataType:"JSON",
					data:userID,
					success:function(json){
						var html = "";
						if(json.msg=="OK")
							document.registerFrm.idCK.value=json.msg;
						else{
							document.registerFrm.idCK.value=json.msg;
							html += json.msg;
						}

						$("#id_error").html(html);
					},error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
			}
			
		});

		$("#pwdCK").blur(function () {
			var passwd = $("#pwd").val().trim();
			var pwdCK = $("#pwdCK").val().trim();
			
			if(pwdCK == passwd)
				$("#pwdCK_error").hide();
			else 
				$("#pwdCK_error").show();
				
		});
		
		
	});

	function register(){
		frm = document.registerFrm;
		if(frm.userName.value.trim()==""){
			alert("성함을 입력해주세요");
			$("#userName").focus();
			return;
		}
		if(frm.userID.value.trim()==""){
			alert("아이디을 입력해주세요");
			$("#userID").focus();
			return;
		}
		if(frm.idCK.value.trim()!="OK"){
			alert("아이디 중복확인을 해주세요");
			$("#userID").focus();
			return;
		}
		if(frm.pwd.value.trim()==""){
			alert("암호을 입력해주세요");
			$("#pwd").focus();
			return;
		} else {
			var passwd = $("#pwd").val().trim();
			var regex = new RegExp(/^[A-Za-z0-9+]{6,15}$/);
			var bool = regex.test(passwd);
			
			if(!bool){
				$("#pwd_error").show();
				alert("암호형식이 틀립니다");
				return;				
			}
			else 
				$("#pwd_error").hide();
		}
		if(frm.pwd.value.trim()!=frm.pwdCK.value.trim()){
			alert("암호가 틀립니다");
			$("#pwdCK").focus();
			return;
		}
		
		frm.submit();
			
	}
</script>

<head>
	<title>Project3</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/project3/resources/css/main.css" />
</head>
<body>

	<!-- Header -->
		<header id="header">
			<div class="inner">
				<a href="index.p3" class="logo"><strong>Project3</strong> by yujin An</a>
				<nav id="nav">
					<a href="index.p3">Home</a>
					<a href="image.p3">image</a>
					<a href="music.p3">Music</a>
					<a href="upload.p3">Upload</a>
					<c:if test="${sessionScope.loginuser!=null}">
						<a href="logout.p3">Logout</a>
					</c:if>
					<c:if test="${sessionScope.loginuser==null}">
						<a href="login.p3">Login</a>
					</c:if>
				</nav>
				<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
			</div>
		</header>

	<!-- Banner -->
		<section id="banner" style="padding: 3em 0em 4em 0em;">
		</section>

	<!-- Main -->
		<section id="main" class="wrapper">
			<div class="inner">
				<header class="align-center">
					<h2 style="margin-bottom: -60px; margin-top: -30px;">Join</h2>
				</header>
				
				<form name="registerFrm" method="post" action="" style="margin-left: 430px;">
					<div class="row uniform">
						<div class="field half first">
							<label for="userName">Name&nbsp;</label>
							<input name="userName" id="userName" type="text" placeholder="name">
							<br>
							<label for="userID">Id&nbsp;<span id="idCK" style="cursor: pointer;">중복확인</span><span id="id_error" style="color: red;"></span></label>
							<input name="userID" id="userID" type="text" placeholder="id">
							<input name="idCK" id="idCK" type="hidden" placeholder="id">
							<br>
							<label for="pwd">Password&nbsp;<span id="pwd_error" style="color: red;">영문,숫자를 포함해 6글자 이상 15이하</span></label>
							<input name="pwd" id="pwd" type="password" placeholder="password">
							<br>
							<label for="pwdCK">Password Check&nbsp;<span id="pwdCK_error" style="color: red;">비밀번호가 틀립니다.</span></label>
							<input name="pwdCK" id="pwdCK" type="password" placeholder="password">
						</div>
					</div>
					<input value="Register" onclick="register()"  class="button" type="button" style="margin-left: 100px;">
				</form>					
			</div>
		</section>

	<!-- Footer -->
		<footer id="footer" style="padding: 0;">
			<div class="copyright" style="padding: 2em; margin: 0;">
				&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
			</div>
		</footer>

</body>
</html>