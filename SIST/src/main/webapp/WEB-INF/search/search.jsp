<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

   <link rel='stylesheet prefetch' href='http://fancyapps.com/fancybox/source/jquery.fancybox.css?v=2.1.5'>
   <link rel="stylesheet" href="css/search.css">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <link href="https://fonts.googleapis.com/css?family=Lato:900" rel="stylesheet" type="text/css">
   
<!--      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
   <script src='http://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js'></script>
<style>
.artistbox{
float:left;
width:35%;
}
.musicbox{
float:right;
width:65%;
}
.profilebox1{
float:left;
width:45%;
margin-left:30px;
}
.profilebox2{
float:left;
width:45%;
}
ul{
list-style: none;
padding-left:0px;
}
.list-item{
font-size: 13px;
}
.list-item li{
height : 30;
font-size: 13px;
}
.artist_profile{
margin-top:30px;
margin-right:60px;
width:100%;
}



@import url(https://fonts.googleapis.com/css?family=Roboto:300,400,600);
.snip1336 {
  font-family: 'Roboto', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  margin: 10px 1%;
  min-width: 230px;
  max-width: 315px;
  width: 50%;
  color: #ffffff;
  text-align: left;
  line-height: 1.4em;
  background-color: #141414;
}
.snip1336 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
}
.snip1336 img {
  max-width: 100%;
  vertical-align: top;
  opacity: 0.85;
}
.snip1336 figcaption {
  width: 100%;
  background-color: #141414;
  padding: 25px;
  position: relative;
}
.snip1336 figcaption:before {
  position: absolute;
  content: '';
  bottom: 100%;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 55px 0 0 400px;
  border-color: transparent transparent transparent #141414;
}
.snip1336 figcaption a {
  padding: 5px;
  border: 1px solid #ffffff;
  color: #ffffff;
  font-size: 0.7em;
  text-transform: uppercase;
  margin: 10px 0;
  display: inline-block;
  opacity: 0.65;
  width: 47%;
  text-align: center;
  text-decoration: none;
  font-weight: 600;
  letter-spacing: 1px;
}
.snip1336 figcaption a:hover {
  opacity: 1;
}
.snip1336 .profile {
  border-radius: 50%;
  position: absolute;
  bottom: 100%;
  left: 25px;
  z-index: 1;
  max-width: 90px;
  opacity: 1;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
}
.snip1336 .follow {
  margin-right: 4%;
  border-color: #2980b9;
  color: #2980b9;
}
.snip1336 h2 {
  margin: 0 0 5px;
  font-weight: 300;
}
.snip1336 h2 span {
  display: block;
  font-size: 0.5em;
  color: #2980b9;
}
.snip1336 p {
  margin: 0 0 10px;
  font-size: 0.8em;
  letter-spacing: 1px;
  opacity: 0.8;
}



</style>
<script type="text/javascript">
$(document).ready(function(){
	var id=$('#headerid').text();
	param="id="+id; // id 완성시 바꾼다
	sendMessage("post", "searchtrain.do", param, searchtrain)
	/* setTimeout("reload()",800); */
	$('#music_search').focus();
	$("#music_tab").on("click",function(){
		  $("#music_search").keypress(function (e) {
			  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
					$('.mlist').html("");
					var music_Name = $('#music_search').val();
					 $.ajax({
			             url:'search_music.do',
			             type:'post',
			             contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			             dataType:"json",
			             data:{"music_Name" : music_Name.trim()},
			             success:function(data){
			            	 for (var i = 0;i<30;i++) {
			            		
			            		if(data[i]!=null){
			            			var sdata = data[i].split("|");
			            		 $('ul#music_left').append("<li class='list-item' data-search-on-list='list-item'>"+sdata[1]+"</li>");
			            		 $('ul#music_right').append("<li class='list-item' data-search-on-list='list-item'>"+sdata[0]+"</li>");
			            		 
			            		}
			            	 }
			      /*        var ajaxName = decodeURIComponent(data.title+".."+data.poster+".."+data.artist);
			             $('#search_Panel').append("<div id='music_pan'><b>제목:"+data.title[0]+"</br>가수:"+data.artist+"</b></br></div>"); */
			             },
			     	    error:function(request,status,error){
			    	        alert(error);
			    	    }
					 });
			  } else {
			      return true;
			  }
	      });
	});
	$("#artist_tab").on("click",function(){
		if($("#artist_panel").html()==""){
		$("#artist_panel").html("<input type='text' class='input-query' id='artist_search'  data-search-on-list='search' placeholder='Search In Artist'/>"+
					  " <span class='counter' data-search-on-list='counter'></span>"+
					  " <div class='list-wrap'>"+
					  "<ul class='alist artistbox' id='artist_left' data-search-on-list='list'>가수</ul>"+
					  "<ul class='alist musicbox' id='artist_right' data-search-on-list='list'>노래명</ul></div>");
		}
		  $("#artist_search").keypress(function (e) {
			  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
					$('.alist').html("");
					var artist_Name = $('#artist_search').val();
					 $.ajax({
			             url:'search_artist.do',
			             type:'post',
			             contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			             dataType:"json",
			             data:{"artist_Name" : artist_Name.trim()},
			             success:function(data){
			            	 for (var i = 0;i<30;i++) {
			            		
			            		if(data[i]!=null){
			            			var sdata = data[i].split("|");

			            		 $('ul#artist_left').append("<li class='list-item' data-search-on-list='list-item'><input class='artistadd' alt='"+sdata[1]+"' type='button' value='My Artist' style='float:left'><b id='artistListText'>"+sdata[1]+"</b></li>");
			            		 $('ul#artist_right').append("<li class='list-item' data-search-on-list='list-item'><b>"+sdata[0]+"</b><input class='songlistadd' alt='"+sdata[1]+"' type='button' value='ADD' style='float:right'></li>");			            		 
			            		}
			            	 }
			      /*        var ajaxName = decodeURIComponent(data.title+".."+data.poster+".."+data.artist);
			             $('#search_Panel').append("<div id='music_pan'><b>제목:"+data.title[0]+"</br>가수:"+data.artist+"</b></br></div>"); */
			            	 songListaddBtn();
			             	 artistAddBtn();
			             
			            		
			             },
			     	    error:function(request,status,error){
			    	        alert(error);
			    	    }
					 });
			  } else {
			      return true;
			  }
	      });
	
	});
	$("#profile_tab").on("click",function(){
		if($("#profile_panel").html()==""){ 
			$("#profile_panel").html("<input type='text' class='input-query' id='profile_search'  data-search-on-list='search' placeholder='Search In Profile'/>"+
						  " <span class='counter' data-search-on-list='counter'></span>"+
						  " <div class='list-wrap'>"+
						  " <ul class='plist profilebox1' id='profile_box' data-search-on-list='list'></ul>"+
						  " <ul class='plist profilebox2' id='profile_box' data-search-on-list='list'></ul></div>");
			 } 
		$('#profile_search').focus();
		  $("#profile_search").keypress(function (e) {
			  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
					$('.plist').html("");
					var profile_Name = $('#profile_search').val();
					 $.ajax({
			             url:'search_profile.do',
			             type:'post',
			             contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			             dataType:"json",
			             data:{"profile_Name" : profile_Name.trim()},
			             success:function(data){
			            	 for (var i = 0;i<30;i++) {
			            		if(data[i]!=null){
			            			if(i%2==0){
			            			var pdata = data[i].split("|");
			            		 $('ul.profilebox1').append("<li class='list-item artist_profile' data-search-on-list='list-item'><figure class='snip1336'>"+
										  "<img src='"+pdata[0]+"' alt='sample87' />"+
											  "<figcaption>"+
											  "  <h2>"+pdata[1]+"</h2>"+
											  "  <p>I'm looking for something that can deliver a 50-pound payload of snow on a small feminine target. Can you suggest something? Hello...? </p>"+
											  "  <a href='#' class='follow'>Follow</a>"+
											  "  <a href='#' class='info'>More Info</a>"+
											  "</figcaption>"+
											"</figure>"+
										  "</li>");
			            			}else{
				            			var pdata = data[i].split("|");
					            		 $('ul.profilebox2').append("<li class='list-item artist_profile' data-search-on-list='list-item'><figure class='snip1336'>"+
												  "<img src='"+pdata[0]+"' alt='sample87' />"+
													  "<figcaption>"+
													  "  <h2>"+pdata[1]+"</h2>"+
													  "  <p>I'm looking for something that can deliver a 50-pound payload of snow on a small feminine target. Can you suggest something? Hello...? </p>"+
													  "  <a href='#' class='follow'>Follow</a>"+
													  "  <a href='#' class='info'>More Info</a>"+
													  "</figcaption>"+
													"</figure>"+
												  "</li>");
			            			}
			            		}
			            	 }
			             },
			     	    error:function(request,status,error){
			    	        alert(error);
			    	    }
					 });
			  } else {
			      return true;
			  }
	      });
		 		  
	});
	
	 $("#music_search").keypress(function (e) {
		  if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
				var music_Name = $('#music_search').val();
				 $.ajax({
		             url:'search_music.do',
		             type:'post',
		             contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		             dataType:"json",
		             data:{"music_Name" : music_Name.trim()},
		             success:function(data){
		               	 $('.mlist').html("");
		            	 for (var i = 0;i<30;i++) {
		            		
		            		if(data[i]!=null){
		            			var sdata = data[i].split("|");

		            		 $('ul#music_left').append("<li class='list-item' data-search-on-list='list-item'><input class='artistadd' alt='"+sdata[1]+"' type='button' value='My Artist' style='float:left'><b id='artistListText'>"+sdata[1]+"</b></li>");
		            		 $('ul#music_right').append("<li class='list-item' data-search-on-list='list-item'><input class='songlistadd' alt='"+sdata[1]+"' type='button' value='ADD' style='float:right'><b id='songListText'>"+sdata[0]+"</b></li>");

		            																										 
		            		}
		            	 }
		            	 songListaddBtn();
		             	 artistAddBtn();
		             	 
		             },
		     	    error:function(request,status,error){
		    	        alert(error);
		    	    }
				 });
		  } else {
		      return true;
		  }
     });
});	 

function songlistadd(){
	
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#drivelist').html(httpRequest.responseText);
		}
	}
	
}
function searchtrain(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			
			$('#searchtrain').html(httpRequest.responseText);
		}
	}
}

function songListaddBtn(){

	$(".songlistadd").on("click",function(){
		var train_id=$('#train_id').text();
		 var train_no=$('#songlist_trainno').val();
		// <span class='preview' id="mytrainno">${vo.train_no }</span>
		 var song_title=$(this).parents('.list-item').text();
		 var song_artist=$(this).attr("alt");
		 param="id="+train_id+"&no="+train_no+"&song_title="+song_title+"&song_artist="+song_artist;
		 if(train_no!=null){
		 	sendMessage("post", "songlistadd.do", param, songlistadd)
		 }else{
			 alert("train을 고르세요");
		 }
	});
}

function artistAddBtn(){
	$(".artistadd").on("click",function(){
	      
	      var id=$('#headerid').text();
	      var song_artist=$(this).attr("alt");
	       param="id="+id+"&song_artist="+song_artist;
	       sendMessage("post", "myartistadd.do", param, songlistadd);
	   });
}

</script>
</head>
<body>

<div class="searchtrain" id="searchtrain">
	
</div>
<div id="drivelist"></div>

 <div class="container">
			 <ul class="nav nav-tabs">
			    <li><a id="music_tab" data-toggle="tab" href="#music_panel">노래명</a></li>
			    <li><a id="artist_tab" data-toggle="tab" href="#artist_panel">가수명</a></li>
			    <li><a id="profile_tab" data-toggle="tab" href="#profile_panel">프로필</a></li>
			  </ul>
			  
	<div class="tab-content">			  
      <div id="music_panel" class="tab-pane fade in active">
					  <input type="text" class="input-query" id="music_search"  data-search-on-list="search" placeholder="Search In Music"/>
					  <span class="counter" data-search-on-list="counter"></span>
					  <div class="list-wrap">
					  <ul class="mlist artistbox" id="music_left" data-search-on-list="list">가수</ul>
					  <ul class="mlist musicbox" id="music_right" data-search-on-list="list">노래명</ul>
					  </div>
      </div>
      <div id="artist_panel" class="tab-pane fade"></div>
      <div id="profile_panel" class="tab-pane fade"></div>
    </div>
 </div>




</body>
</html>