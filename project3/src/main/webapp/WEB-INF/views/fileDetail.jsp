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
	
	$(document).ready(function(){
		if('${msg}'!=null&&'${msg}'!="")
			alert('${msg}');
	})
	
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
					<h2>Detail</h2>
				</header>
				
				<div class="row 200%">
					<c:if test="${fileVO!=null }">
						<div class="6u 12u$(medium)">
						<c:if test="${fileVO.fileType=='image'}">
							<img src="/project3/resources/image/${fileVO.fileNewName}" alt="${fileVO.fileOrgName}" style="width:500px;height:500px; cursor: pointer;">
						</c:if>
						<c:if test="${fileVO.fileType!='image'}">
							<audio  controls  style="width:500px;height:250px;">
							    <source src="/project3/resources/music/${fileVO.fileNewName}" type="audio/mp3">
							</audio>
						</c:if>
						</div>
						<div class="row uniform 6u$ 12u$(medium)">
							<form method="post" action="#">
								<div class="row uniform">
									<div class="4u 12u$(xsmall)">
										<label>작성자</label>
										<input type="text" name="demo-email" id="demo-email" value="${fileVO.userID }">
									</div>
									<div class="4u 12u$(xsmall)">
										<label>파일사이즈</label>
										<input type="text" name="demo-email" id="demo-email" value="${fileVO.fileSize } byte">
									</div>
									<div class="4u 12u$(xsmall)">
										<label>게시일</label>
										<input type="text" name="demo-email" id="demo-email" value="${fileVO.uploadDate.substring(0,16) }">
									</div>
									<div class="12u$">
										<textarea name="demo-message" id="demo-message" placeholder="File information" rows="6">${fileVO.fileInformation}</textarea>
									</div>
									<div class="12u$">
										<input type="text" name="demo-email" id="demo-email" value="${fileVO.fileTag }">
									</div>
									<!-- Break -->
									<c:if test="${fileVO.fileType=='image'}">
										<div class="12u$" style="text-align: center;">
											<input type="hidden" name="fileSeq" value="${fileVO.fileSeq}">
											<button class="button">Download</button>&nbsp;&nbsp;&nbsp;
	<!-- 										<button class="button" type="button">Save</button> -->
										</div>
									</c:if>	
								</div>
							</form>
						</div>
					</c:if>
				</div>
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