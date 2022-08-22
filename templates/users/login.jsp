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
</head>
<body>
<div class="container">
	<div class="login-form">
	<div class="row">
	<div class="col-12">
	{{ error }}
	</div>
	</div>
	<form method="post" action=".">
	{% csrf_token %}
	<h2 class="text-center">로그인</h2>
	<div class="form-group">
	<input type="text" name="mail" class="form-control" placeholder="mail"
	 required="required">
	</div>
	<div class="form-group">
	<input type="password" name="userpw" class="form-control" placeholder="Password"
	 required="required">
	</div>
	<div class="form-group">
	<button type="submit" class="btn btn-primary btn-block">로그인</button>
	</div>
	</form>
	<p class="text-center"><a href="/users/signup" id="register">회원 가입</a></p>
	</div>
</div>
</body>
</html>