var width=840;
var height=475;
var ambilight; //youtube

var songNo = 0; //순서

var video_small = [];
var video_return = document.querySelectorAll('.video_return')[0];
var videoSize = document.querySelectorAll('#background')[0];
var prev = document.querySelectorAll('#prev')[0];
var next = document.querySelectorAll('#next')[0];
var videoCode = $('#background').attr('data-code');

var video_state=0;

$(document).ready(function() {
	video_state=0;

	prev.setAttribute('data-code', datacode[songNo-1]);
	videoSize.setAttribute('data-code', datacode[songNo]);
	next.setAttribute('data-code', datacode[songNo+1]);
	videoCode = $('#background').attr('data-code');
	
	//prev,next 썸네일
	  $('.video-t li').each(function() {
		  var code = $(this).attr('data-code');
		    $(this).css("background-image", "url(http://img.youtube.com/vi/" + code + "/0.jpg)");
		  });
	  $('#background').css("background-image", "url(http://img.youtube.com/vi/" + datacode[songNo] + "/0.jpg)");
	  $('#background').css("background-size", "cover");	  
	  visible();
	  
	onYouTubeIframeAPIReady();

});

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
}
function onPlayerStateChange(event) {
  if(event.data==0){
	  
	  if($('#next').attr('data-code')=="undefined")
	  {
		  songNo=0;
		  videoChange();
	  }
	  else
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
});

//다음버튼
next.addEventListener('click', function() {
	songNo++;
	videoChange();
});

//처음이면 prev가 안보이고 마지막이면 next가 안보임
function visible(){
	if($('#prev').attr('data-code')=="undefined")
	{
		document.getElementById('prev').style.display='none';
	}
	else
	{
		document.getElementById('prev').style.display='block';
	}
	if($('#next').attr('data-code')=="undefined")
	{
		document.getElementById('next').style.display='none';
	}
	else
	{
		document.getElementById('next').style.display='block';
	}
}

function videoChange(){
	$('div#player').remove();
	$('iframe#player').remove();
	$('#video-reset').append("<div id='player' data-code=''></div>");
	// 순서 변경
	prev.setAttribute('data-code', datacode[songNo-1]);
	videoSize.setAttribute('data-code', datacode[songNo]);
	next.setAttribute('data-code', datacode[songNo+1]);
	$('#background').css("background-image", "url(http://img.youtube.com/vi/" + datacode[songNo] + "/0.jpg)");
	// 다시 띄우기
//	var youtube=document.querySelectorAll('#player')[0];
//	youtube.setAttribute('src',"https://www.youtube.com/embed/"+datacode[songNo]+"?autoplay=1&controls=1&showinfo=0&enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A8080");
	
	$('.video-t li').each(function() {
	    var code = $(this).attr('data-code');
	    $(this).css("background-image", "url(http://img.youtube.com/vi/" + code + "/0.jpg)");
	  });
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
}