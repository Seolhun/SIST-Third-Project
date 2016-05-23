<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/rank.css">
<script type="text/javascript" src="user/js/ajax.js"></script>
</head>
<body>
	<div class="container">
		<span class="counter"></span>
		<div class="list-wrap">
			<ul class="list">
				<c:forEach var="vo" items="${list }">
					<li class="list-item">${vo.rank }.
						<a href="" class="list-item-link">${vo.titles }
						 <span class="item-list-subtext">${vo.artists }</span>
					</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>