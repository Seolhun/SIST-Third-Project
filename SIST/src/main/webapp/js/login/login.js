/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
 ---------------------------------------
 */

function cambiar_login() {
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
	document.querySelector('.cont_form_login').style.display = "block";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.opacity = "1";
	}, 400);

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
	}, 200);
}

function cambiar_sign_up(at) {
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
	document.querySelector('.cont_form_sign_up').style.display = "block";
	document.querySelector('.cont_form_login').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.opacity = "1";
	}, 100);

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.display = "none";
	}, 400);

}

function ocultar_login_sign_up() {
	document.querySelector('.cont_forms').className = "cont_forms";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";
	document.querySelector('.cont_form_login').style.opacity = "0";
	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
		document.querySelector('.cont_form_login').style.display = "none";
	}, 500);
}

/*--------------------------------------------------------------------------------------------------------------------------------------------------*/
/* 구글 로그인 */
function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use
	// an ID token instead.
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
	console.log('Email: ' + profile.getEmail());
}

function onSuccess(googleUser) {
	console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
}

function onFailure(error) {
	console.log(error);
}

function renderButton() {
	gapi.signin2.render('my-signin2', {
		'scope' : 'profile email',
		'width' : 300,
		'height' : 50,
		'longtitle' : true,
		'theme' : 'dark',
		'onsuccess' : onSuccess,
		'onfailure' : onFailure
	});
}

/* 구글 로그아웃 */
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		console.log('User signed out.');
	});
}
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* 페이스북 로그인 */
// 622056984642090


window.fbAsyncInit = function() {
	FB.init({
		appId      : '622056984642090',
		channelUrl : 'http://localhost:8080/sist/login.do#/channel.html', // Channel File 
		cookie     : true, 
		status     : true,
		xfbml      : true,  // parse social plugins on this page
		version    : 'v2.6'
	});
	FB.getLoginStatus(function(response) {
		  statusChangeCallback(response);
	});
}

function fb_login() {
    FB.login( function() {
    }, { scope: 'email, public_profile, user_friends' } 
    );
}

//This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
	console.log('statusChangeCallback');
	console.log(response);
	// for FB.getLoginStatus().
	if (response.status === 'connected') {
		location.href = "main.do";
	} else if (response.status === 'not_authorized') {
		console.log = 'Please log into this app.';
		console.log = 'Else if';
	} else {
		console.log = 'Please log into Facebook.';
		console.log = 'Else';
	}
}


// Load the SDK asynchronously
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/