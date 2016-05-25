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
<script type="text/javascript" src="js/video_id.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script>
	//제목-가수 받아오기
	var songlist=[];
	  <c:forEach var="mlist" items="">
	  songlist[mlist.no]="Dream Girls IOI";
    </c:forEach>
	var songlist=[];
	songlist[0]="Dream Girls IOI";
	songlist[1]="Cheer Up 트와이스";
	songlist[2]="Remember 에이핑크";
	songlist[3]="Ring My Bell 걸스데이";
	songlist[4]="Sunday Candy donnie trumpet";
	songlist[5]="Lose My Mind young jeezy";
	songlist[6]="Hotline Bling drake";
// 	songlist[7]="King Kunta kendrick lamar";

	//코드변환(string->datacode)
	var datacode =[];
// 	datacode[0] = "c7rCyll5AeY"; // Cheer Up
// 	datacode[1] = "1BVV9UqELbA"; // Dream Girls
// 	datacode[2] = "bXlrqQKbjSM"; // Remember
// 	datacode[3] = "z4sN05-xIs4"; // Ring My Bell
// 	datacode[4] = "i4ooH8frBWg"; // Sunday Candy
// 	datacode[5] = "Tsmqrk7Wgsk"; // Lose My Mind
// 	datacode[6] = "uxpDa-c-4Mc"; // Hotline Bling
// 	datacode[7] = "hRK7PVJFbS8"; // King Kunta
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
		  <li data-code="c7rCyll5AeY" id="next">NEXT</li>
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