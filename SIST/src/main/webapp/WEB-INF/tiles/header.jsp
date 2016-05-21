<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
    <script type="text/javascript" src="js/menu.js"></script>
</head>
<body>
	<img src="img/logo.png" class="menu_logo">
	<nav>
		<ul>
			<li class="video_return" onclick="drive()">DRIVE</li>
			<li class="video_small" id="mytrain_do" onclick="myfunction()">MY TRAIN</li>  <!-- 로그인 완성되면 admin 자리에 로그인 id로 대체 -->
			<li class="video_small" onclick="drugflow_do()">DRUG FLOW</li>
			<li class="video_small">FAVOR</li>
			<li class="video_small">COMMUNITY</li>
			<li class="video_small" id="search_do" onclick="search_do()">SEARCH</li>
		</ul>
		<div>
<!-- 		<div
			  class="fb-like"
			  data-share="true"
			  data-width="450"
			  data-show-faces="true">
			</div> 
-->
		   	<div id="status">
		   		
		  	</div>
		</div>
	</nav>
	
	<script src="js/youtube.js"></script>
</body>
</html>