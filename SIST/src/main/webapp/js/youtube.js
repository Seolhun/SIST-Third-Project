/*
 * songlist를 보낼때 1을 보낸다고 치면 datacode도 1을 받기때문에 datacode[2]는 존재하지않음.
 * 
 */


var width=840;
var height=475;
var ambilight; //youtube

var songNo = 0; //순서
var nextsongNo = 0;

var video_small = [];
var video_return = document.querySelectorAll('.video_return')[0];
var videoSize = document.querySelectorAll('#background')[0];
var prev = document.querySelectorAll('#prev')[0];
var next = document.querySelectorAll('#next')[0];

var video_state=0; //0이면 DRIVE
$(document).ready(function() {
	setTimeout("youtube_load();", 200);
});

function next_Songimg(nSong_num){
	nextsongNo=nSong_num;
	var nSong="";
	var ajax = new XMLHttpRequest();
	var string;
	ajax.open('GET', api + '?part=snippet,id&q=' + songlist[nextsongNo] + '&type=video&key=' + key);
	ajax.onload = function () {
	    var json = JSON.parse(this.responseText);
	    string=json.items[0].snippet.thumbnails.high.url;
	    nSong =string.substr(23,11);
	    next.setAttribute('data-code', nSong);
	    $('.video-t #next').css("background-image", "url(http://img.youtube.com/vi/" + nSong + "/0.jpg)");
	    
	}
	 ajax.send();
	 
	 return nSong;
	
}
function youtube_load(){

	video_state=0;
	songNo=0;
	visible();
	next_Songimg(songNo+1);
	var ajax = new XMLHttpRequest();
	var string;
	ajax.open('GET', api + '?part=snippet,id&q=' + songlist[songNo] + '&type=video&key=' + key);
	ajax.onload = function () {
	    var json = JSON.parse(this.responseText);
	    string=json.items[0].snippet.thumbnails.high.url;
	    datacode[songNo]=string.substr(23,11);
		  $('.video-t li').each(function() {
			  var code = $(this).attr('data-code');
			    $(this).css("background-image", "url(http://img.youtube.com/vi/" + code + "/0.jpg)");
			  });
		  

			videoSize.setAttribute('data-code', datacode[songNo]);
			$('iframe#player').attr("src","https://www.youtube.com/embed/"+datacode[songNo]+"?autoplay=1&controls=1&showinfo=0&enablejsapi=1"+
			"&origin=http%3A%2F%2Flocalhost%3A8080&widgetid=1");
			$('#background').css("background-image", "url(http://img.youtube.com/vi/" + datacode[songNo] + "/0.jpg)");
			
	};
    ajax.send();

	//prev,next 썸네일

	  
	  player = new YT.Player('player', {
		    height: height,
		    width: width,
		    videoId: datacode[songNo],
		    playerVars: {
		        autoplay: 1,
		        controls: 1,
		        showinfo: 0
		    },
		    events: {
		      'onStateChange': onPlayerStateChange,
		    }
		  });
			$('#background').css("background-image", "url(http://img.youtube.com/vi/" + datacode[songNo] + "/0.jpg)");
			$('#background').css("background-size", "cover");
//	onYouTubeIframeAPIReady();
	
}

var player;
function onYouTubeIframeAPIReady() {
	
	player = new YT.Player('player', {
    height: height,
    width: width,
    videoId: datacode[songNo],
    playerVars: {
        autoplay: 1,
        controls: 1,
        showinfo: 0
    },
    events: {
      'onStateChange': onPlayerStateChange,
    }
  });
	$('#background').css("background-image", "url(http://img.youtube.com/vi/" + datacode[songNo] + "/0.jpg)");
	$('#background').css("background-size", "cover");
}
function onPlayerStateChange(event) {
	  if(event.data==0){
	     if(songNo==songlist.length-1)
	     {
	        songNo=-1;
	        videoChange();
	     }
	     if(songNo!=songlist.length-1)
	     {
	        songNo++;
	        videoChange();
	     }
	  }
	}

//이전add_train.classList.ad버튼
prev.addEventListener('click', function() {
	songNo--;
	videoChange();
	next_Songimg(songNo+1);
});

//다음버튼
next.addEventListener('click', function() {
	songNo++;
	videoChange();
	next_Songimg(songNo+1);
});

//처음이면 prev가 안보이고 마지막이면 next가 안보임
function visible(){
	   if(songNo==0)
	   {
	      document.getElementById('prev').style.display='none';
	   }
	   else
	   {
	      document.getElementById('prev').style.display='block';
	   }
	   if(songNo==songlist.length-1)
	   {
	      document.getElementById('next').style.display='none';
	   }
	   else
	   {
	      document.getElementById('next').style.display='block';
	   }
	}

function videoChange(){
	var ajax = new XMLHttpRequest();
	var string;
	ajax.open('GET', api + '?part=snippet,id&q=' + songlist[songNo] + '&type=video&key=' + key);
	
	ajax.onload = function () {
	    var json = JSON.parse(this.responseText);
	    string=json.items[0].snippet.thumbnails.high.url;
	    datacode[songNo]=string.substr(23,11);

	    //시작
		$('div#player').remove();
		$('iframe#player').remove();
		$('#video-reset').append("<div id='player' data-code=''></div>");
		// 순서 변경
		prev.setAttribute('data-code', datacode[songNo-1]);
		videoSize.setAttribute('data-code', datacode[songNo]);
		/*next.setAttribute('data-code', datacode[songNo+1]);*/

		$('#background').css("background-image", "url(http://img.youtube.com/vi/" + datacode[songNo] + "/0.jpg)");
		// 다시 띄우기
//		var youtube=document.querySelectorAll('#player')[0];
//		youtube.setAttribute('src',"https://www.youtube.com/embed/"+datacode[songNo]+"?autoplay=1&controls=1&showinfo=0&enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A8080");
		
/*		$('.video-t li').each(function() {
		    var code = $(this).attr('data-code');
		    $(this).css("background-image", "url(http://img.youtube.com/vi/" + code + "/0.jpg)");

		});*/
		$('.video-t #prev').css("background-image", "url(http://img.youtube.com/vi/" + datacode[songNo-1] + "/0.jpg)");
	    visible();
	    
	    onYouTubeIframeAPIReady();
	    if(video_state==0)
	    {
	    	document.getElementById('player').style.width='840px';
	    	document.getElementById('player').style.height='475px';
	    	document.getElementById('player').style.top='-150px';
	    	document.getElementById('player').style.left='0';
	    	prev.classList.remove("hidden");
	    	next.classList.remove("hidden");
	    	document.getElementById('video-title').style.display='block';
	    	document.getElementById('video-list').style.display='block';
	    	document.getElementById('add_train').style.display='block';
	    	document.getElementById('footer-list').style.left='300px';
	    }
	    else
		{
	    	document.getElementById('player').style.width='400px';
			document.getElementById('player').style.height='250px';
			document.getElementById('player').style.top='745px';
			document.getElementById('player').style.left='-1400px';
			prev.classList.add("hidden");
			next.classList.add("hidden");
			document.getElementById('video-title').style.display='none';
			document.getElementById('video-list').style.display='none';
			document.getElementById('add_train').style.display='none';
			document.getElementById('footer-list').style.left='500px';
		}
	    //
	    
	};
   
    ajax.send();

}

listclick.addEventListener('click', function(){
	document.getElementById('footer-songlist').style.height='215px';
	document.getElementById('footer-songlist').style.display='block';
});