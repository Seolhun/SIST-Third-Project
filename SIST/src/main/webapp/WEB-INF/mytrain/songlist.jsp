<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="vo" items="${list }">
		
		<li>
		<a class='thumbnail' href='#'> ${vo.song_title}</a><br/>
			<div class='cart-con'>
				<h3>${vo.train_id}</h3>
				<span class='preview' id="mytrainname">${vo.song_artist}</span>
				<input type="hidden" id="mytrainno" value="${vo.train_no }">
			</div>
			
			<input type="submit" value="X" id="btn-del" class="btn-del">
			
		</li>
	
      	</c:forEach>
</body>
</html>