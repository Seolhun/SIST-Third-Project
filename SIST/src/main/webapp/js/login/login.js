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
//http://localhost:8080/sist/login.do#/channel.html
//API를 ID에 맞게 불러와 실행한다.
window.fbAsyncInit = function() {
    FB.init({
      appId      : '622056984642090',
      channelUrl : 'http://localhost:8080/sist/login.do#/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true,
      version    : 'v2.6'
    });
    
	FB.Event.subscribe('auth.authResponseChange', function(response) {
		if (response.status === 'connected') {
	    	getUserInfo();
	    	getLikeMusician();
		} else if(response.status != 'connected'){
			Login();
		} else if (response.status === 'not_authorized') {
			Login();
		} else {
			Login();
		}
	});
};

function Login(){
	FB.login(function(response) {
		if(response.name !="undefined" && response.status === "connected"){
			location.href="main.do";
		} else {
			console.log('User cancelled login or did not fully authorize.');
		}
	},{ scope: 'public_profile,email,user_friends,user_likes,user_actions.music', auth_type: 'reauthenticate'
		
	});
}

/*function Login2(){
	FB.login(function(response) {
	    if (response.authResponse) {
	    	location.href="main.do";
	    } else {
	     console.log('User cancelled login or did not fully authorize.');
	    }
	},{scope: 'public_profile,email,user_friends,user_likes,user_actions.music',
		return_scopes: true
	},{ scope: 'public_profile,email,user_friends,user_likes,user_actions.music', auth_type: 'reauthenticate', auth_nonce: '{random-nonce}' 
		
	});
}*/
// FB.api(path, method, params, callback)

function getLikeMusician(){
    FB.api('/me/music?target_id=me', function(response) {
		if (response && !response.error) {
			var str=response.likse;
			str=response.music;
			document.getElementById("likeMusician").innerHTML+=str;  	  	    
		}
	});
}

function getUserInfo() {
    FB.api('/me',{fields: 'email'}, function(response) {

    	getPhoto();

        var str="<div style='width:100%; height:100%; font-size:20px'>"+response.email;
        //str +="<h4 style='width:60%; float:right'>"+response.email+"</h4>";
        str +="<h4 id='headerid' style='width:60%; float:right; display:none'>"+response.id+"</h4>"; 
        str +="<input type='button' value='Logout' onclick='Logout();' style='font-size:15px; float:right; color:black'/></div>";
        document.getElementById("logInfo").innerHTML+=str; 

    	var id=response.id;
    	var email=response.email;
        	$.ajax({
                url : 'insertMember.do',
                type : 'post',
                dataType:'json',
                data : {
                    "id" : id ,
                    "email" : email,
                },
                success : function(data) {
                	alert("석세스가 된다");
                }
            });
    	}
    );
}

function getPhoto(){
	FB.api('/me/picture?type=normal', function(response) {
		var str="<div id='imgInfo'><img src='"+response.data.url+"' style='height:60px; width:60px; right: 150px; top: -7px; position: relative;' /></div>";
		document.getElementById("logInfo").innerHTML+=str;  	  	    
  	});
}

function Logout() {
    FB.getLoginStatus(function(response) {
        if (response && response.status === 'connected') {
            	FB.logout(function(response) {
                //document.location.reload();
            	location.href = "login.do";
            });
        }
    });
}

//Load the SDK asynchronously
(function(d) {
	var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement('script');
	js.id = id;
	js.async = true;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	ref.parentNode.insertBefore(js, ref);
}(document));

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/

