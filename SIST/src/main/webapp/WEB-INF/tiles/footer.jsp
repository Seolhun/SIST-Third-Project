<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
<link rel="stylesheet" type="text/css" href="css/youtube.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script>
	//코드변환(string->datacode)
	
	//코드저장
	var datacode =[];
	datacode[0] = "c7rCyll5AeY"; // Cheer Up
	datacode[1] = "1BVV9UqELbA"; // Dream Girls
	datacode[2] = "bXlrqQKbjSM"; // Remember
	datacode[3] = "z4sN05-xIs4"; // Ring My Bell
	datacode[4] = "0VKcLPdY9lI"; // Sunday Candy
	datacode[5] = "oTXCgR93zC8"; // Lose My Mind
	datacode[6] = "q6f-LLM1H6U"; // Hotline Bling
	datacode[7] = "0rtV5esQT6I"; // King Kunta
	datacode[8] = "XGdbaEDVWp0"; // King Kunta
	datacode[9] = "DEd8ED2FdAg"; // King Kunta
</script>
</head>
<body>
	<div id="background" data-code=""></div>
	<div id='video-reset'>
		
		<div id="video-title">${sessionScope.id }'S TRAIN</div>
		
		<div id="video-list">LIST</div>
    	<div id="player" data-code=""></div>
		<ul class="video-t">
		  <li data-code="" id="prev" data-video-pause="playing">PREV</li>
		  <li data-code="" id="next">NEXT</li>
		</ul>
	</div>
	<div id="add_train">ADD TO MY TRAIN</div>
	
	<div id="footer-list">
		<ul>
			<c:forEach var="vo" items="${list }">
            <li>${vo.id}<br>${vo.train_name }</li>
         </c:forEach>
			
		</ul>
	</div>
	
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='http://www.seanmccambridge.com/tubular/js/jquery.tubular.1.0.js'></script>
	<script src="js/youtube.js"></script>
</body>
</html>