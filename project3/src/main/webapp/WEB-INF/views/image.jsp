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
<style>
button#btn_heart {
	padding: 8px;
	margin: -8px;
	border: none;
	background-color: transparent;
	/* border: 1px solid red; */
	position: absolute;
	right: 18px;
	top: 10px;
	color: #af3d3d;
	font-size: 22px;
}

.heartAreaIn {
	background: url(<%=request.getContextPath()%>/resources/heart_bgb.png);
	background-size: 22px 22px;
	display: inline-flex;
	width: 22px;
	height: 22px;
}

.heartAreaOut {
	background: url(<%=request.getContextPath()%>/resources/heart_bg.png);
	background-size: 22px 22px;
	display: inline-flex;
	width: 22px;
	height: 22px;
}

</style>
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
					<h2>Image</h2>
					<p>download or browsing Image</p>
				</header>
				
				<div class="row" style="margin: 0 auto; padding-left: 95px;">
					<c:if test="${imageList!=null}">
						<c:forEach var="list" items="${imageList}">
							<div class="col-lg-4 col-md-6 mb-3 mb-lg-0 col-lg-2">
						      <img src="/project3/resources/image/${list.fileNewName}" alt="${list.fileOrgName}" style="width:300px;height:300px; cursor: pointer;" onclick="location.href='fileDetail.p3?fileSeq=${list.fileSeq}'">
						      <p>
<!-- 									<span class="heartAreaOut" style="cursor: pointer;" -->
<%-- 									onclick="location.href='saveFile.p4?fileSeq=${list.fileSeq}'" --%>
<%-- 									class="heart" id="btn_heart${stauts}" aria-busy="false" --%>
<!-- 									style="padding: 8px; margin: -8px; border: none; background-color: transparent;"	>  -->
<%-- 										<c:if test="${list.status==1}">  --%>
<!-- 											<span class="heartAreaIn" style="width: 22px;"> -->
<!-- 												<span class="blind">heart</span> -->
<!-- 											</span> -->
<%-- 										</c:if>  --%>
<!-- 									</span> -->
									${list.userID}
								</p>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<c:if test="${pagebar!=null}">
				${pagebar}
				</c:if>
				
				<div style="text-align: center;">
					<a href="image.p3" class="button special" style="margin-bottom: 5px; font-size: 10px">ALL</a>
					<c:if test="${tagList!=null}">
						<c:forEach items="${tagList}" var="list">
							<a href="?fileTag=${list.fileTag.substring(1)}" class="button special" style="margin-bottom: 5px; font-size: 10px">${list.fileTag}</a>
						</c:forEach>
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