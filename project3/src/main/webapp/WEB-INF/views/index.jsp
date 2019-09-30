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
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Welcome</h1>
					</header>

					<div class="flex ">

						<div onclick="location.href='image.p3'" style="cursor: pointer;">
							<span class="icon fa-camera"></span>
							<h3>Image</h3>
							<p>download or browsing Image</p>
						</div>

						<div onclick="location.href='music.p3'" style="cursor: pointer;">
							<span class="icon fa-music"></span>
							<h3>Music</h3>
							<p>download or browsing Music</p>
						</div>

						<div onclick="location.href='upload.p3'" style="cursor: pointer;">
							<span class="icon fa-upload"></span>
							<h3>Upload</h3>
							<p>sharing your gift</p>
						</div>

					</div>

				</div>
			</section>

		<!-- Footer -->
			<footer id="footer" style="padding: 0;">
				<div class="copyright" style="padding: 2em; margin: 0;">
					&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="/project3/resources/js/jquery.min.js"></script>
			<script src="/project3/resources/js/skel.min.js"></script>
			<script src="/project3/resources/js/util.js"></script>
			<script src="/project3/resources/js/main.js"></script>

	</body>
</html>