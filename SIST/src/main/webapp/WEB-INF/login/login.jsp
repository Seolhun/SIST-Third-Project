<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="google-signin-client_id"
	content="264714905099-gd1du478oi4gj0vs6u37aslttet7vfm4.apps.googleusercontent.com">
<link rel="stylesheet" type="text/css" href="css/login/login.css">
<script type="text/javascript" src="js/login/login.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta charset="UTF-8">
<title>SIST | GET ON OUR TRAIN!!!</title>
</head>
<body>

	<div class="cotn_principal">
		<div class="cont_centrar">
			<div id="logintitle">
				<h1>S&nbsp;&nbsp;I&nbsp;&nbsp;S&nbsp;&nbsp;T</h1>
				<h3>SOUNDS IN SOUL TRAIN</h3>
				<h4>GET ON OUR TRAIN!!</h4>
			</div>
			<div class="cont_login">
				<div class="cont_info_log_sign_up">
					<div class="col_md_login" id="loginDiv">
						<div class="cont_ba_opcitiy">
							<h2>Facebook</h2>
							<button class="btn_login" onclick="cambiar_login()">SIGN UP</button>
						</div>
					</div>
					<div class="col_md_sign_up">
						<div class="cont_ba_opcitiy">
							<h2>Google</h2>
							<button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
						</div>
					</div>
				</div>
				<div class="cont_back_info">
					<div class="cont_img_back_grey">
						<img src="http://www.internetofmusic.com/wp-content/uploads/2016/04/summer-music-ftr.jpg" width="640" height="500" />
					</div>

				</div>
				<div class="cont_forms">
					<div class="cont_img_back_">
						<img
							src="http://www.internetofmusic.com/wp-content/uploads/2016/04/summer-music-ftr.jpg"
							width="640" height="500" />
					</div>

					<div class="cont_form_login">
						<a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
						<h2>Facebook SIGN UP</h2>
						<div class="faceSign">			
							<a href="#" onclick="Login()">
							<img src="img/login/facesign.png" border="0" alt="" id="faceSignBtn"></a>
						</div>
					</div>
					<div class="cont_form_sign_up">
						<a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
						<h2>Google SIGN UP</h2>
						<div class="googleSign">
							<button class="g-signin2" data-onsuccess="onSignIn" data-longtitle="true" style="width: 200px; margin-top: 20px;"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>