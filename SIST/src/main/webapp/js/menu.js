//다른 메뉴 클릭 시 화면 줄이기
for(var i=0; i<5; i++)
{
	video_small[i] = document.querySelectorAll('.video_small')[i];

	video_small[i].addEventListener('click', function() {
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
		video_state=1;
		document.getElementById('main_footer').style.zIndex='0';
		document.getElementById('main_body').style.zIndex='100';
	});
}

//DRIVE메뉴 클릭 시 화면 원래대로
video_return.addEventListener('click', function() {
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
	video_state=0;
	document.getElementById('main_footer').style.zIndex='100';
	document.getElementById('main_body').style.zIndex='0';
});