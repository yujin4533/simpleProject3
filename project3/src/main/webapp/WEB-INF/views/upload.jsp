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
	
	function goShare(){
		frm = document.frm;
		type = frm.fileType.value;
		name = frm.attach.value;
		ext = name.slice(name.indexOf(".")+1).toLowerCase();
		
		if(ext==""){
				alert("파일첨부 해주세요");
				return;
		} else if(type=="image"){
			if(ext != "jpg" && ext != "jpeg" && ext != "png" && ext != "gif" && ext != "bmp"){
				alert("확장자 형식이 틀립니다");
				return;
			}
		} else {
			if(ext != "wma" && ext != "mp3" && ext != "aac" && ext != "flac"){
				alert("확장자 형식이 틀립니다");
				return;
			}
		}
		
		frm.submit();
	};
	
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
					<h2>Upload</h2>
					<p>sharing your gift</p>
				</header>
				
				<form name="frm" method="post" action="sharing.p3" style="margin-left: 430px;" enctype="multipart/form-data">
					<div class="row uniform">
						<div class="field half first">
							<input type="radio" id="image" name="fileType" value="image" checked>
							<label for="image">Image&nbsp;&nbsp;jpg,jpeg,png,gif,bmp</label>
							<br>
							<input type="radio" id="music" name="fileType" value="music">
							<label for="music">Music&nbsp;&nbsp;wma,mp3,aac,flac</label>
							<br>
							<label for="attach">attach</label>
							<input name="attach" id="attach" type="file">
							<br>
							<br>
							<label for="fileInformation">Information</label>
							<textarea name="fileInformation" id="fileInformation" placeholder="information and tag" rows="6"></textarea>
						</div>
					</div>
					<button id="btn" onclick="goShare()" class="button" type="button" style="margin-left: 100px;">Sharing</button>
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