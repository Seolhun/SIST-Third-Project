<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,900' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/login/login.js"></script>

<title>SIST | Drive Your Train</title>
</head>
	<body>
	    <div class="main_header" id="main_header"><tiles:insertAttribute name="header"/></div>
		<div class="main_body" id="main_body"><tiles:insertAttribute name="body"/></div>
	</body>
</html>