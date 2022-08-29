<!DOCTYPE html>
<html lang="en">
<head>
	<title>로그인</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
	.login-form {
	width: 340px;
	margin: 50px auto;
	font-size: 15px;
	}
 
	.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
	}
 
	.login-form h2 {
	margin: 0 0 15px;
	}
 
	.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
	}
 
	.btn {
	font-size: 15px;
	font-weight: bold;
	}
	</style>
	<script>
		function getCookie(name) {
			var cookieValue = null;
			if (document.cookie && document.cookie !== '') {
				var cookies = document.cookie.split(';');
				for (var i = 0; i < cookies.length; i++) {
					var cookie = cookies[i].trim();
					// Does this cookie string begin with the name we want?
					if (cookie.substring(0, name.length + 1) === (name + '=')) {
						cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
						break;
					}
				}
			}
			return cookieValue;
		}
		var csrftoken = getCookie('csrftoken');
	  
		function csrfSafeMethod(method) {
			// these HTTP methods do not require CSRF protection
			return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
		}
		$.ajaxSetup({
			beforeSend: function(xhr, settings) {
				if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
					xhr.setRequestHeader("X-CSRFToken", csrftoken);
				}
			}
		});
	  </script>
</head>
<body>
<div class="container">
	<div class="login-form">
	<div class="row">
	<div class="col-12">
	{{ error }}
	</div>
	</div>
	{% csrf_token %}
	<h2 class="text-center">로그인</h2>
	<div class="form-group">
	<input type="text" name="mail" id="mail" class="form-control" placeholder="user@email.com"
	 required="required">
	</div>
	<div class="form-group">
	<input type="password" name="userpw" id="userpw" class="form-control" placeholder="Password"
	 required="required">
	</div>
	<div class="form-group">
	<button id="loginButton" class="btn btn-primary btn-block">로그인</button>
	</div>
	<p class="text-center"><a href="/users/signup/view/" id="register">회원 가입</a></p>
	</div>
</div>
	<script>
		$(document).ready(function(){
			$("#loginButton").on("click", function(){
				$.ajax({
					type : "POST"
					, url : "/users/login/"
					, data : {
						"mail" : $("#mail").val()
						, "userpw" : $("#userpw").val()
					}
					, success : function(data){
						if(data.result == 'loginSuccess')
						{
							location.href = "/"
						} else if (data.result== 'loginFailed'){
							alert('비밀번호를 확인해주세요')
						} else if (data.result == 'noUser'){
							alert('계정을 확인해주세요')
						} else if (data.result == ''){
							alert('안되네')
						}
					}
					, error : function(){
						alert("에러")
					}
				})
			})
		})
	</script>
</body>
</html>