window.fbAsyncInit = function() {
	FB.init({
		appId : '622056984642090',
		channelUrl : 'http://localhost:8080/sist/main.do#/channel.html', // Channel File 
		cookie : true,
		status : true,
		xfbml : true, // parse social plugins on this page
		version : 'v2.6'
	});
};

//Load the SDK asynchronously
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function getUserInfo() {
	FB.api('/me', function(response) {
		var str = "Name : " + response.name;
		str += "Link : " + response.link;
		str += "Username : " + response	.username;
		str += "id : " + response.id;
		str += "Email : " + response.email;
		console.log(str);
	});
}

function getPhoto() {
	FB.api('/me/picture?type=normal', function(response) {
		var str = "<br/><b>Pic</b> : <img src='" + response.data.url + "'/>";
		document.getElementById("status").innerHTML += str;
	});
}

function Logout() {
	FB.logout(function(response) {
		// Person is now logged out
	});
	window.location.href = "login.do";
}