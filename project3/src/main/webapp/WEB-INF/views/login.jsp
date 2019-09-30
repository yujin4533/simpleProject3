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
					<h2 style="margin-bottom: -60px; margin-top: -30px;">Login</h2>
				</header>
				
				<form method="post" action="login.p3" style="margin-left: 430px;">
					<div class="row uniform">
						<div class="field half first">
							<label for="userID">Id</label>
							<input name="userID" id="userID" type="text" placeholder="id">
							<br>
							<label for="pwd">Password</label>
							<input name="pwd" id="pwd" type="password" placeholder="password">
						</div>
					</div>
					<button class="button" style="width: 155px; margin-right: 20px;">Login</button>
					<input value="Join" class="button" type="button" style="width: 155px; margin-left: 20px;" onclick="location.href='join.p3'">
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