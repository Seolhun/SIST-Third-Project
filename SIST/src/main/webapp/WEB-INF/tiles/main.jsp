<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,900' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/menu.js"></script>


<script type="text/javascript">

/* $(function(){
		$('#mytrain_do').click(function(){
		alert("설레");
		param="id=admin";  // 로그인 되면 admin은 사용자 id로
		sendMessage("POST", "mytrain.do", param, mytraindo);	
	});
}); */

function myfunction(){
	var id=$('#headerid').text();
	param="id="+id;  
	sendMessage("POST", "mytrain.do", param, mytraindo);
}
function drive(){
	   sendMessage("POST", "drive.do", null, mytraindo);
}
function drugflow_do(){
	   sendMessage("POST", "emotion_main.do", null, mytraindo);
}
function search_do(){
	sendMessage("POST", "search.do", null, mytraindo);
}

//게시판 리스트 가기 
function list_do(){
	sendMessage("POST", "list.do", null, mytraindo);
}

function insert_do(){
	sendMessage("POST", "insert.do", null, mytraindo)
}

function insert_do(){
	sendMessage("POST", "insert.do", null, mytraindo)
}

function insert_do(){
	sendMessage("POST", "insert.do", null, mytraindo)
}
function favor_do(){
	
	sendMessage("POST", "recommand.do", null, mytraindo);

}
function mytraindo(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('.main_body').html(httpRequest.responseText);
		}
	}
}
</script>

<title>SIST | Drive Your Train</title>
</head>
	<body>
	    <div class="main_header" id="main_header"><tiles:insertAttribute name="header"/></div>
		<div class="main_body" id="main_body"><tiles:insertAttribute name="body"/></div>
	    <div class="main_footer" id="main_footer"><tiles:insertAttribute name="footer"/></div>
	    
	</body>
</html>