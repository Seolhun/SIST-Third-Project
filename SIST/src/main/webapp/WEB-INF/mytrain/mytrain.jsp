<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	param="id=admin";  // 로그인 되면 admin은 사용자 id로
	sendMessage("POST", "mytrainlist.do", param, callback);
	
	$('#MakeTrainBtn').click(function(){
		var name=$('#maketrainname').val();
		param="id=admin&name="+name;
		sendMessage("POST", "maketrain.do", param, maketrain);
	});
	$('#genreBtn').click(function(){
		alert("클릭");
        var param = "id=admin&my_genre=";
        $("input:checkbox[name=cartcheck]:checked").each(function(){
           var cartcheck=$(this).val();
           param+=cartcheck+",";
        });
        sendMessage("POST", "genreadd.do", param, genreadd);
     });
});

function callback(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#makelist').html(httpRequest.responseText);
		}
	}
}
function footeraddtrain(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#footer-list').html(httpRequest.responseText);
		}
	}
}
function maketrain(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#makelist').html(httpRequest.responseText);
			var name=$('#maketrainname').val();
			$('#maketrainname').val("");
			param="id=admin&name="+name;
			sendMessage("POST", "addtrain.do", param, footeraddtrain);
		}
	}
}
function genreadd(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			
			$('#mygenreadd').html(httpRequest.responseText);
			
		}
	}
}
</script>
</head>
<body>
	<div class="mypage" id="mypagecontainer">
		<div class="mypage" id="mypageleft">
			<div class="mypageleftside" id="trainname">trainname</div>
			<input id="nickChange"><button id="nickChangeBtn">닉네임 변경</button>
			<div class="mypageleftside" id="myartist">my artist</div>
			<div class="mypageleftside" id="mygenre">
				  댄스
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value="Dance" size="60"> &nbsp;
				  발라드
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value=Ballad> &nbsp;
				 랩 / 힙합
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value="Rap / Hip-hop"> &nbsp;<br>
				  알앤비 / 소울
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value="RnB / Soul"> &nbsp;
				  락
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value=Rock> &nbsp;
				 일렉트릭
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value=Electronica> &nbsp; <br>
				  포크
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value=Folk> &nbsp;
				 팝
				  <input type="checkbox" name='cartcheck' class='control--checkbox' id='cartcheck' value=Pop> &nbsp; <br>
				  <input type="button" id="genreBtn" value="저장" size=20>
				<div class="mypageleftside" id="mygenreadd"> 
					<c:forEach var="vo" items="${genrelist }">
						${vo.my_genre }
					</c:forEach>
				</div> 
			</div>
		</div>
		
		<div class="mypage" id="mypagecenter">
			<div class="mypageceterside" id="maketrain">
				<input type="text" placeholder="Make Your Train!" id="maketrainname">
				<input type="button" value="Make Train" id="MakeTrainBtn" >
			</div>
			<div class="mypagecenterside" id="makelist">
				 
			</div>
		</div>
		
		<div class="mypage" id="mypageright">
<!-- 			<div class="mypagerightside" id="drivetrain">drive train</div> -->
			<div class="mypagerightside" id="drivelist"></div>
			
		</div>
		
	</div>
</body>
</html>