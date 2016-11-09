<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//0525LEE modify
	$('.songlist_btn-del').click(function(){
		var id=$('#myid').text();
		var train_no=$('#songlist_trainno').val();
		var song_no=$(this).attr("alt");
		param="id="+id+"&train_no="+train_no+"&song_no="+song_no;
// 		alert(param);
		sendMessage("POST", "songdelete.do", param, deletesong);	
	});

});

function deletesong(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#songListUl').html(httpRequest.responseText);
		}
	}
}
</script>
</head>
<body>
	<!-- 0525LEE modify! -->
	<ul id="songListUl">
	<c:forEach var="vo" items="${list }">
	
		<li id="songList">
			<div class='cart-con2'>
<%-- 				<h3>${vo.train_id}</h3> --%>
				<h3 class='thumbnail' id="songlist_title"> ${vo.song_no-1 }. ${vo.song_title}</h3>
				<span class='preview' id="songlist_artist">${vo.song_artist}</span>
				<input type="hidden" id="songlist_trainno" value="${vo.train_no }">
				<input type="hidden" id="songlistno" value="${vo.song_no }">
			</div>
			<input type="button" value="X" id="songlist_btn-del" alt="${vo.song_no }" class="songlist_btn-del">			
		</li>
      	</c:forEach>
   	</ul>
</body>
</html>