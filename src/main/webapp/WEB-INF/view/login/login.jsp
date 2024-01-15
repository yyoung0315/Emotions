<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emotions Project</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="../css/bootstrap.min1.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
	.loginDiv{
		width: 20%;
		margin-left: 40%;
		margin-right: 40%;
		margin-top: 10%;
	}
    </style>
</head>
<body>
	<main class="form-signin">
		<div class="loginDiv">
		    <h1 class="h3 mb-5">Please sign in</h1>
		    <div class="form-floating mb-4">
		    <label for="floatingInput">Email address</label>
		      <input type="email" class="form-control" id="user_id" placeholder="name@example.com">
		    </div>
		    <div class="form-floating mb-4">
		    <label for="floatingPassword">Password</label>
		      <input type="password" class="form-control" id="pwd" placeholder="Password" onkeydown="if(event.keyCode == 13)$('#login').focus()">
		    </div>
		    <div class="row">
		    	<div class="col-md-6 mb-3">
			    	<input type="button" value="Sign up" class="btn btn-primary w-100 py-2" onclick="location.href='form.do'">
			    </div>
			    <div class="col-md-6 mb-3">
			    	<button class="btn btn-primary w-100 py-2" id="login">Sign in</button>
			    </div>
		    </div>
		    
		    <p class="mt-5 mb-3 text-body-secondary">&copy;2023</p>
		</div>
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="./js/jquery-3.7.1.js" ></script><!-- jQuery 선언 -->
<script type="text/javascript">
jQuery.ajaxSetup({cache:false});

//path 경로 설정 
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};  
		
// 로그인 성공여부 확인 AJAX 처리 
$('#login').click(function() {
	if ("" == $('#user_id').val() && ""== $('#pwd').val()) {
		alert("아이디 또는 비밀번호를 입력하여 주십시오."); 
		$('#user_id').focus();
		return false;
	}
	
	var path = getContextPath(); 
	var loginData={
		user_id : $('#user_id').val(),
		pwd : $('#pwd').val()
	};
	$.ajax({
		type : "post"
		, url : path + "/loginOk.do"
		, contentType: "application/json"
		, data : JSON.stringify(loginData)
		, success : function(data) {
			if(data == "OK"){
				location.replace("index.do"); 
			}else if(data == "NO"){
				alert("아이디 또는 비밀번호를 확인하여 주십시오. ");
				$('#pwd').val("");
				$('#user_id').focus();
			}
		}
	});

});
</script>
</html>