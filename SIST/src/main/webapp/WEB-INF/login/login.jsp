<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

    <link rel="stylesheet" type="text/css" href="../../css/login.css">
    <script type="text/javascript" src="../../js/login.js"></script>
    
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="264714905099-gd1du478oi4gj0vs6u37aslttet7vfm4.apps.googleusercontent.com">
 <!-- 
    <link rel="stylesheet" type="text/css" href="login.css">
    <script type="text/javascript" src="login.js"></script>
 -->
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<div class="cotn_principal">
    <a href="#" onclick="signOut();">Sign out</a>

    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login" id="loginDiv">
                    <div class="cont_ba_opcitiy">
                        <h2>Login</h2>
                        <button class="btn_login" onclick="cambiar_login()">Login</button>
                    </div>
                </div>
                <div class="col_md_sign_up" id="signDiv">
                    <div class="cont_ba_opcitiy">
                        <h2>Sign Up</h2>
                        <div class="g-signin2" data-onsuccess="onSignIn" data-longtitle="true" style="width: 200px; margin-top: 20px;"></div>
                        <button class="btn_sign_up2" onclick="cambiar_sign_up2()">Facebook Sign Up</button>
                    </div>
                </div>
            </div>


            <div class="cont_back_info">
                <div class="cont_img_back_grey">
                    <img src="http://www.internetofmusic.com/wp-content/uploads/2016/04/summer-music-ftr.jpg" width="640" height="500"/>
                </div>
            </div>

            <div class="cont_forms">
                <div class="cont_img_back_">
                    <img src="http://www.internetofmusic.com/wp-content/uploads/2016/04/summer-music-ftr.jpg" width="640" height="500"/>
                </div>
                <div class="cont_form_login" id="loginDiv2">
                    <h2>LOGIN</h2>
                    <input type="text" placeholder="Email" />
                    <input type="password" placeholder="Password" />
                    <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
                </div>

                <div class="cont_form_sign_up">
                    <h2>SIGN UP</h2>
                    <input type="text" placeholder="Email" />
                    <input type="text" placeholder="User" />
                    <input type="password" placeholder="Password" />
                    <input type="password" placeholder="Confirm Password" />
                    <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
                </div>

                <div class="cont_form_sign_up2">
                    <h2>SIGN UP</h2>
                    <input type="text" placeholder="Email" />

                    <input type="text" placeholder="User" />
                    <input type="password" placeholder="Password" />
                    <input type="password" placeholder="Confirm Password" />
                    <button class="btn_sign_up2" onclick="cambiar_sign_up2()">SIGN UP</button>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
</html>
