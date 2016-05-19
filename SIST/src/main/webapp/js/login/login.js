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
	  cookie     : true, 
	  xfbml      : true,  // parse social plugins on this page
	  version    : 'v2.6'
	});
	
	FB.getLoginStatus(function(response) {
	  statusChangeCallback(response);
	});
};

//This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
	console.log('statusChangeCallback');
	console.log(response);
	// for FB.getLoginStatus().
	if (response.status === 'connected') {
		// Logged into your app and Facebook.
		successAPI();
		getUserInfo();
	} else if (response.status === 'not_authorized') {
		// The person is logged into Facebook, but not your app.
		document.getElementById('status').innerHTML = 'Please log into this app.';
	} else {
		// The person is not logged into Facebook, so we're not sure if
		// they are logged into this app or not.
		document.getElementById('status').innerHTML = 'Please log into Facebook.';
	}
}

function fb_login() {
    FB.login( function() {}, { scope: 'email,public_profile,user_friends' } );
}

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function successAPI() {
  console.log('Welcome!  Fetching your information....');
  FB.api('/me', function(response) {
	  console.log('Successful login for: '+JSON.stringify(response));
	  document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';
	});
  /*location.href="loginOK.do";*/
}

function getUserInfo() {
    FB.api('/me', function(response) {
        var str="<b>Name</b> : "+response.name+"<br>";
        str +="<b>Link: </b>"+response.link+"<br>";
        str +="<b>Username:</b> "+response.username+"<br>";
        str +="<b>id: </b>"+response.id+"<br>";
        str +="<b>Email:</b> "+response.email+"<br>";
        str +="<input type='button' value='Get Photo' onclick='getPhoto();'/>";
        str +="<input type='button' value='Logout' onclick='Logout();'/>";
        document.getElementById("status").innerHTML=str;
    });
}

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/