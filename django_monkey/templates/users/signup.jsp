 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
    <div id="wrap" class="container">
         <header class="bg-warning">
            <div class="display-2 text-center bg-primary">MEMO</div>
        </header>
        <div>
            <br>
            <!--이메일-->
            <div>user name : </div>
            <div class="d-flex">
                <input type="text" name="userName" id="userName" class="form-control input-text">
                <div><button id="duplicateCheckButton" class="button btn btn-primary">중복체크</button></div>
            </div>
			<div id="duplicateChecked" class="d-none"><small class="text-success">아이디 중복체크 완료!</small></div>
			<div id="duplicateNotChecked" class="d-none"><small class="text-danger">이미 있는 id입니다. 다른 id를 입력해주세요.</small></div>
            
            <br>
            <!--비밀번호 & 확인-->
            <div>
                password : <input type="password" name="password" id="password" class="form-control input-text" >
            <br>
                confirm password : <input type="password" id="passwordCheck" class="form-control input text">
                <div id="confirmFailedPW" class="d-none"><small class="text-danger">비밀번호가 다릅니다.</small></div>
                <div id="confirmedPW" class="d-none"><small class="text-success">비밀번호가 같습니다.</small></div>
            </div>
            <br>
            <br>
            <div><button id="joinButton" class="button btn btn-primary" type="submit">Join</button></div>
        </div>

        <footer>
        <div class="small text-secondary text-center">2022 All Rights Reserved, Note me</div>
        </footer>
    </div>
        <script>
        	$(document).ready(function(){
        		var confirmed = false;
        		var duplicate_confirmed = false;
        		
        		$("#passwordCheck").on("propertychange change paste input", function(){
        			let passwordcheck = $("#passwordCheck").val();
        			let password = $("#password").val();
        			
        			if(passwordcheck==password && password != ""){
        				$("#confirmedPW").removeClass("d-none");
        				$("#confirmFailedPW").addClass("d-none");
        				confirmed = true;

        			}else{
        				if(password != ""){
        				$("#confirmedPW").addClass("d-none");
        				$("#confirmFailedPW").removeClass("d-none");
        				confirmed = false;
        				}
        			}
        		})
        		
        		//아이디 중복여부 체크
        		$("#duplicateCheckButton").on("click", function(){
        			if($("#userName").val() == ""){
        				alert("User name needed");
        			} else{
        			$.ajax({
        				type : "get"
        				,url : "/user/duplicate_id"
        				,data : {
        					"userId" : $("#userName").val()
        				}
        				, success : function(data){
        					if(data.result == false){ //중복 아님
        						duplicate_confirmed = true;
                				$("#duplicateChecked").removeClass("d-none");
                				$("#duplicateNotChecked").addClass("d-none");
        					} else{ //중복임
                				$("#duplicateNotChecked").removeClass("d-none");
                				$("#duplicateChecked").addClass("d-none");
        						duplicate_confirmed = false;
        					}
        				}
        				, error : function(){
        					alert("에러");
        				}			
        			})
        			}
        		})
        		//쪼인
        		$("#joinButton").on("click", function(){
        			let userName = $("#userName").val();
        			let password = $("#password").val();
        			let alertUser = "";
        			
        			if(userName == ""){
        				alertUser += "User name";
        			}
        			if(password == ""){
        				alertUser += " Password";
        			}        			
        			if(confirmed == false){
        				alertUser += " Confirmation";
        			}
        			if(duplicate_confirmed == false){
        				alertUser += " Id Confirmation";
        			}
        			if(userName != "" && password != "" && confirmed==true && duplicate_confirmed == true){
        				$.ajax({
        					type : "post"
        					, url : "/user/signup"
        					, data : {
        						"userId" : userName,
        						"password" : password
        					}
        					, success : function(data){
        						if(data.result == "success"){
        							location.href = "/user/login/view";
        						} else{
        							alert("실패");
        						}
        					}
        					, error : function(){
        						alert("에러임니당");
        						alert("code : " + request.status + "\n" + "message: " + request.responseText + "\n" + "errer : " + error);
        					}
        				})
        			} else{
        				alert(alertUser + " needed");
        			}
        		})
        })
        		
        	
        </script>
</body>
</html>