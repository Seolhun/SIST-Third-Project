/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
 ---------------------------------------
 */

/*구글 로그인*/
function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
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

/*구글 로그아웃*/
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		console.log('User signed out.');
	});
}

/*function cambiar_login() {
 document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
 document.querySelector('.cont_form_login').style.display = "block";
 document.querySelector('.cont_form_sign_up').style.opacity = "0";
 document.querySelector('.cont_form_sign_up2').style.opacity = "0";

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

 function cambiar_sign_up2(at) {
 document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
 document.querySelector('.cont_form_sign_up2').style.display = "block";
 document.querySelector('.cont_form_login').style.opacity = "0";

 setTimeout(function() {
 document.querySelector('.cont_form_sign_up2').style.opacity = "1";
 }, 100);

 setTimeout(function() {
 document.querySelector('.cont_form_login').style.display = "none";
 }, 400);
 */

/!* 마우스 오버!!*!/
if (document.querySelector) {
	var loginDiv = document.querySelector('#loginDiv')
	var signDiv = document.querySelector('#signDiv')

	loginDiv.onmouseover = function() {
		document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
		document.querySelector('.cont_form_login').style.display = "block";
		document.querySelector('.cont_form_sign_up').style.opacity = "0";
		document.querySelector('.cont_form_sign_up2').style.opacity = "0";

		setTimeout(function() {
			document.querySelector('.cont_form_login').style.opacity = "1";
		}, 400);
		setTimeout(
				function() {
					document.querySelector('.cont_form_sign_up').style.display = "none";
				}, 200);
	}

	signDiv.onmouseover = function() {
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

}

function ocultar_login_sign_up() {

	document.querySelector('.cont_forms').className = "cont_forms";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";
	document.querySelector('.cont_form_sign_up2').style.opacity = "0";
	document.querySelector('.cont_form_login').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
		document.querySelector('.cont_form_sign_up2').style.display = "none";
		document.querySelector('.cont_form_login').style.display = "none";
	}, 500);

}