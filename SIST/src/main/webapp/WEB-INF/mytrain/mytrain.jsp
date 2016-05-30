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
	var id=$('#headerid').text();
	param="id="+id;  // 로그인 되면 admin은 사용자 id로
	sendMessage("POST", "mytrainlist.do", param, callback);
	
	$('#MakeTrainBtn').click(function(){
		var name=$('#maketrainname').val();
		var nick=$('#mynick').text();
		onYouTubeIframeAPIReady();
			videoChange();
		
		param="id="+id+"&name="+name+"&nick="+nick;
		sendMessage("POST", "maketrain.do", param, maketrain);
		
		$(".songlist_li").on("click",function(){
			var t_num=$(this).find('.footertrain_no').attr("value");
			$.ajax({
	             url:'songlist_load.do',
	             type:'post',
	             contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	             dataType:"json",
	             data:{"songlist":songlist_li},
	             success:function(data){
	            	 
	             },
	     	    error:function(request,status,error){
	    	        alert(error);
	    	    }
			 });
		});
	});
	$('#genreBtn').click(function(){
        var param = "id="+id+"&my_genre=";
        $("input:checkbox[name=cartcheck]:checked").each(function(){
           var cartcheck=$(this).val();
           param+=cartcheck+",";
        });
        sendMessage("POST", "genreadd.do", param, genreadd);
     });
	$('#nickChangeBtn').click(function(){
		var nick=$('#nickChange').val();
		param="id="+id+"&nick="+nick;
		sendMessage("post", "nickchange.do", param, maketrain);
	});
	
});
/* function nickchange(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var nick=$('#nickChange').val("");
			alert("닉네임이 바뀌었습니다.!");
		}
	}
} */
function callback(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#makelist').html(httpRequest.responseText);
			sendMessage("POST", "addtrain.do", param, footeraddtrain);
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
			var id=$('#headerid').text();
			$('#maketrainname').val("");
			param="id="+id+"&name="+name;
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

<!-- 			<div class="mypageleftside" id="trainname">trainname -->
<!-- 			</div> -->
			<div id="nickdiv">
				<input id="nickChange" placeholder="${nick }"><button id="nickChangeBtn">닉네임 변경</button>
			</div>
			
			<div class="mypageleftside" id="myartist">my artist<br>
			   <c:forEach var="avo" items="${alist }">
			      ${avo.my_artist } <input type="button" class="artist_del_btn" value="X" alt="${avo.my_artist }"><br> 
			   </c:forEach>
			</div>
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
						<%-- <input type="hidden" value="${vo.nick }" id="mynick"> --%>
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