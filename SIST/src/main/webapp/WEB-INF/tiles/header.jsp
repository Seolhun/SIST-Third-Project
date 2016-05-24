<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
    <script type="text/javascript" src="js/menu.js"></script>
    <script type="text/javascript" src="js/login/login.js"></script>
</head>
<body>
<!--	
	<div>
		<div
		  class="fb-like"
		  data-share="true"
		  data-width="450"
		  data-show-faces="true">
		</div> 
	</div>
-->

	<img src="img/logo.png" class="menu_logo">
<!-- 	<div id="logInfo" style='font-size:14px; width: 20%; left:35%; padding: 4px 4px' >
	</div> -->
	<nav>
		<ul>
			<li class="video_return" onclick="drive()">DRIVE</li>
			<li class="video_small" id="mytrain_do" onclick="myfunction()">MY TRAIN</li>  <!-- 로그인 완성되면 admin 자리에 로그인 id로 대체 -->
			<li class="video_small" onclick="drugflow_do()">DRUG FLOW</li>
			<li class="video_small">FAVOR</li>
			<li class="video_small">COMMUNITY</li>
			<li class="video_small" id="search_do" onclick="search_do()">SEARCH</li>
			<li class="video_small" id="logInfo" style="width:480px;"></li>
		</ul>
	</nav>
	<script src="js/youtube.js"></script>
</body>
</html>