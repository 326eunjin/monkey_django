{% load static %}
<html>
    <head>
        <meta charset="utf-8">
		<title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
  <link rel="stylesheet" href="{% static 'css/signup.css' %}" />
  
    </head>
    <body>
		<header id="header">
			<div class="h_inner">
			  <div class="m_logo">
				<h1 class="tit_h1">
				  <a href="http://127.0.0.1:8000/"></a>
				  <span class="blind">monky</span>
				</h1>
				<h2>Monkey Magic</h2>
				<div class="sub">
				  <ul class="snb">
					<li>
					  <a href="#none">ENG</a>
					</li>
				  </ul>
				  <ul class="login">
					<li>
					  <a href="{% url 'users:login' %}">로그인</a>
					</li>
					<li>
					  <a href="#none">회원가입</a>
					</li>
					<li>
					  <a href="#none" class="imgg"></a>
					  <span class="blind">my</span>
					</li>
				  </ul>
				  <ul class="search">
					<input type="text" placeholder="Search" />
					<button>검색</button>
				  </ul>
				</div>
			  </div>
			  <div class="m_nav">
				<nav>
				  <ul>
					<li>
					  <a href="/ins/">원숭이두창</a>
					</li>
					<li>
					  <a href="#none">검사</a>
					</li>
					<li>
					  <a href="/map/">원숭이두창맵</a>
					</li>
					<li><a href="#none">기타</a>7</li>
				  </ul>
				</nav>
			  </div>
			</div>
		</header>

		<section id="mv">
			<img src="{% static 'css/images/main_image.png' %}" />
        
		<!-- <div class= "container">
            <div class = "row mt-5">
                <div class = "col-12 text-center">
                    <h1>회원가입</h1>
                </div>
            </div>
        </div> -->

    
        
        <!--            폼 안에다가 입력해줘야한다. (안써주면 에러발생)
             csrf_token 폼의 경우에는 , 데이터를 서버에 전달하는 기능.이때 암호화된 키를 숨겨놓아 크로스도메인을 막기 위함. -->
    <!-- bootstrap -component - forms -->
    	<div class= "container">
			<section class="signup-form">
        		<!-- <div class = "row mt-5"> -->
            		{{error}}
				<div class = "col-12 ">
				<!-- <div class = "row mt-5"> -->
				<div class = "col-12 ">
				<!--<form method = "POST" action = ".">-->
		
                	{% csrf_token %} 
					<h2 class="text-center">회원가입</h2>
					<div class="sign">

						<div class="form-group"> 
							<label for="username">이메일</label>
							<div class="d-flex">
								<input 
								type="text" 
								class="form-control" 
								id="username" 
								placeholder="username@email.com"
								name="username">   
								<!-- 이 name 값으로 정보가 전달된다 -->
								<button id="duplicationCheckButton" class="button btn-primary btn">중복확인</button>
							</div>
							<div id="duplicationChecked" class="d-none text-success">중복확인 완료</div>
							<div id="duplicationCheckFailed" class="d-none text-danger">다른 이메일을 입력해주세요</div>
						</div>

						<div class="pass">

							<div class="form-group pass1">
								<label for="password">비밀번호</label>
								<input type="password" 
									class="form-control"
									id="password"
									placeholder="비밀번호"
									name= "password">
									<div class="d-none text-success" id="passwordChecked">비밀번호 확인 완료</div>
									<div class="d-none text-danger" id="passwordCheckFailed">비밀번호가 맞는지 다시 확인해주세요</div>
							</div>
			
							<div class="form-group pass2">
								<label for="re_password">비밀번호 확인</label>
								<input 
									type= "password" 
									class="form-control"
									id="re_password"
									placeholder="비밀번호 확인"
									name = "re_password">
							</div>
						</div>

						<div class="form-group">
							<label for="gender">성별
			
								<ul class="sel">
									<li>
										<input type="radio" name="gender" value=0>
										<p>Male</p>
									</li>
									<li>
										<input type="radio" name="gender" value=1>
										<p>Female</p>
									</li>
								</ul>  
							</label>
						</div>

						<div class="form-group sol">
							<label for="Nationality">Nationality</label>
								<select id="nationality" name="nationality" data-name="nationality" required="" ms-field="nationality" data-parsley-required-message="Please let us know your nationality." class="select-field w-select form-control">
									<option value="">Select one...</option>
									<option value='afghan'>Afghan</option>
									<option value='albanian'>Albanian</option>
									<option value='algerian'>Algerian</option>
									<option value='american'>American</option>
									<option value='andorran'>Andorran</option>
									<option value='angolan'>Angolan</option>
									<option value='anguillan'>Anguillan</option>
									<option value='citizen-of-antigua-and-barbuda'>Citizen of Antigua and Barbuda</option>
									<option value='argentine'>Argentine</option>
									<option value='armenianaustralian'>ArmenianAustralian</option>
									<option value='austrian'>Austrian</option>
									<option value='azerbaijani'>Azerbaijani</option>
									<option value='bahamian'>Bahamian</option>
									<option value='bahraini'>Bahraini</option>
									<option value='bangladeshi'>Bangladeshi</option>
									<option value='barbadian'>Barbadian</option>
									<option value='belarusian'>Belarusian</option>
									<option value='belgian'>Belgian</option>
									<option value='belizean'>Belizean</option>
									<option value='beninese'>Beninese</option>
									<option value='bermudian'>Bermudian</option>
									<option value='bhutanese'>Bhutanese</option>
									<option value='bolivian'>Bolivian</option>
									<option value='citizen-of-bosnia-and-herzegovina'>Citizen of Bosnia and Herzegovina</option>
									<option value='botswanan'>Botswanan</option>
									<option value='brazilian'>Brazilian</option>
									<option value='british'>British</option>
									<option value='british-virgin-islander'>British Virgin Islander</option>
									<option value='bruneian'>Bruneian</option>
									<option value='bulgarian'>Bulgarian</option>
									<option value='burkinan'>Burkinan</option>
									<option value='burmese'>Burmese</option>
									<option value='burundian'>Burundian</option>
									<option value='cambodian'>Cambodian</option>
									<option value='cameroonian'>Cameroonian</option>
									<option value='canadian'>Canadian</option>
									<option value='cape-verdean'>Cape Verdean</option>
									<option value='cayman-islander'>Cayman Islander</option>
									<option value='central-african'>Central African</option>
									<option value='chadian'>Chadian</option>
									<option value='chilean'>Chilean</option>
									<option value='chinese'>Chinese</option>
									<option value='colombian'>Colombian</option>
									<option value='comoran'>Comoran</option>
									<option value='congolese-(congo)'>Congolese (Congo)</option>
									<option value='congolese-(drc)'>Congolese (DRC)</option>
									<option value='cook-islander'>Cook Islander</option>
									<option value='costa-rican'>Costa Rican</option>
									<option value='croatian'>Croatian</option>
									<option value='cuban'>Cuban</option>
									<option value='cymraes'>Cymraes</option>
									<option value='cymro'>Cymro</option>
									<option value='cypriot'>Cypriot</option>
									<option value='czech'>Czech</option>
									<option value='danish'>Danish</option>
									<option value='djiboutian'>Djiboutian</option>
									<option value='dominican'>Dominican</option>
									<option value='citizen-of-the-dominican-republic'>Citizen of the Dominican Republic</option>
									<option value='dutch'>Dutch</option>
									<option value='east-timorese'>East Timorese</option>
									<option value='ecuadorean'>Ecuadorean</option>
									<option value='egyptian'>Egyptian</option>
									<option value='emirati'>Emirati</option>
									<option value='english'>English</option>
									<option value='equatorial-guinean'>Equatorial Guinean</option>
									<option value='eritrean'>Eritrean</option>
									<option value='estonian'>Estonian</option>
									<option value='ethiopian'>Ethiopian</option>
									<option value='faroese'>Faroese</option>
									<option value='fijian'>Fijian</option>
									<option value='filipino'>Filipino</option>
									<option value='finnish'>Finnish</option>
									<option value='french'>French</option>
									<option value='gabonese'>Gabonese</option>
									<option value='gambian'>Gambian</option>
									<option value='georgian'>Georgian</option>
									<option value='german'>German</option>
									<option value='ghanaian'>Ghanaian</option>
									<option value='gibraltarian'>Gibraltarian</option>
									<option value='greek'>Greek</option>
									<option value='greenlandic'>Greenlandic</option>
									<option value='grenadian'>Grenadian</option>
									<option value='guamanian'>Guamanian</option>
									<option value='guatemalan'>Guatemalan</option>
									<option value='citizen-of-guinea-bissau'>Citizen of Guinea-Bissau</option>
									<option value='guinean'>Guinean</option>
									<option value='guyanese'>Guyanese</option>
									<option value='haitian'>Haitian</option>
									<option value='honduran'>Honduran</option>
									<option value='hong-konger'>Hong Konger</option>
									<option value='hungarian'>Hungarian</option>
									<option value='icelandic'>Icelandic</option>
									<option value='indian'>Indian</option>
									<option value='indonesian'>Indonesian</option>
									<option value='iranian'>Iranian</option>
									<option value='iraqi'>Iraqi</option>
									<option value='irish'>Irish</option>
									<option value='israeli'>Israeli</option>
									<option value='italian'>Italian</option>
									<option value='ivorian'>Ivorian</option>
									<option value='jamaican'>Jamaican</option>
									<option value='japanese'>Japanese</option>
									<option value='jordanian'>Jordanian</option>
									<option value='kazakh'>Kazakh</option>
									<option value='kenyan'>Kenyan</option>
									<option value='kittitian'>Kittitian</option>
									<option value='citizen-of-kiribati'>Citizen of Kiribati</option>
									<option value='kosovan'>Kosovan</option>
									<option value='kuwaiti'>Kuwaiti</option>
									<option value='kyrgyz'>Kyrgyz</option>
									<option value='lao'>Lao</option>
									<option value='latvian'>Latvian</option>
									<option value='lebanese'>Lebanese</option>
									<option value='liberian'>Liberian</option>
									<option value='libyan'>Libyan</option>
									<option value='liechtenstein-citizen'>Liechtenstein citizen</option>
									<option value='lithuanian'>Lithuanian</option>
									<option value='luxembourger'>Luxembourger</option>
									<option value='macanese'>Macanese</option>
									<option value='macedonian'>Macedonian</option>
									<option value='malagasy'>Malagasy</option>
									<option value='malawian'>Malawian</option>
									<option value='malaysian'>Malaysian</option>
									<option value='maldivian'>Maldivian</option>
									<option value='malian'>Malian</option>
									<option value='maltese'>Maltese</option>
									<option value='marshallese'>Marshallese</option>
									<option value='martiniquais'>Martiniquais</option>
									<option value='mauritanian'>Mauritanian</option>
									<option value='mauritian'>Mauritian</option>
									<option value='mexican'>Mexican</option>
									<option value='micronesian'>Micronesian</option>
									<option value='moldovan'>Moldovan</option>
									<option value='monegasque'>Monegasque</option>
									<option value='mongolian'>Mongolian</option>
									<option value='montenegrin'>Montenegrin</option>
									<option value='montserratian'>Montserratian</option>
									<option value='moroccan'>Moroccan</option>
									<option value='mosotho'>Mosotho</option>
									<option value='mozambican'>Mozambican</option>
									<option value='namibian'>Namibian</option>
									<option value='nauruan'>Nauruan</option>
									<option value='nepalese'>Nepalese</option>
									<option value='new-zealander'>New Zealander</option>
									<option value='nicaraguan'>Nicaraguan</option>
									<option value='nigerian'>Nigerian</option>
									<option value='nigerien'>Nigerien</option>
									<option value='niuean'>Niuean</option>
									<option value='north-korean'>North Korean</option>
									<option value='northern-irish'>Northern Irish</option>
									<option value='norwegian'>Norwegian</option>
									<option value='omani'>Omani</option>
									<option value='pakistani'>Pakistani</option>
									<option value='palauan'>Palauan</option>
									<option value='palestinian'>Palestinian</option>
									<option value='panamanian'>Panamanian</option>
									<option value='papua-new-guinean'>Papua New Guinean</option>
									<option value='paraguayan'>Paraguayan</option>
									<option value='peruvian'>Peruvian</option>
									<option value='pitcairn-islander'>Pitcairn Islander</option>
									<option value='polish'>Polish</option>
									<option value='portuguese'>Portuguese</option>
									<option value='prydeinig'>Prydeinig</option>
									<option value='puerto-rican'>Puerto Rican</option>
									<option value='qatari'>Qatari</option>
									<option value='romanian'>Romanian</option>
									<option value='russian'>Russian</option>
									<option value='rwandan'>Rwandan</option>
									<option value='salvadorean'>Salvadorean</option>
									<option value='sammarinese'>Sammarinese</option>
									<option value='samoan'>Samoan</option>
									<option value='sao-tomean'>Sao Tomean</option>
									<option value='saudi-arabian'>Saudi Arabian</option>
									<option value='scottish'>Scottish</option>
									<option value='senegalese'>Senegalese</option>
									<option value='serbian'>Serbian</option>
									<option value='citizen-of-seychelles'>Citizen of Seychelles</option>
									<option value='sierra-leonean'>Sierra Leonean</option>
									<option value='singaporean'>Singaporean</option>
									<option value='slovak'>Slovak</option>
									<option value='slovenian'>Slovenian</option>
									<option value='solomon-islander'>Solomon Islander</option>
									<option value='somali'>Somali</option>
									<option value='south-african'>South African</option>
									<option value='south-korean'>South Korean</option>
									<option value='south-sudanese'>South Sudanese</option>
									<option value='spanish'>Spanish</option>
									<option value='sri-lankan'>Sri Lankan</option>
									<option value='st-helenian'>St Helenian</option>
									<option value='st-lucian'>St Lucian</option>
									<option value='stateless'>Stateless</option>
									<option value='sudanese'>Sudanese</option>
									<option value='surinamese'>Surinamese</option>
									<option value='swazi'>Swazi</option>
									<option value='swedish'>Swedish</option>
									<option value='swiss'>Swiss</option>
									<option value='syrian'>Syrian</option>
									<option value='taiwanese'>Taiwanese</option>
									<option value='tajik'>Tajik</option>
									<option value='tanzanian'>Tanzanian</option>
									<option value='thai'>Thai</option>
									<option value='togolese'>Togolese</option>
									<option value='tongan'>Tongan</option>
									<option value='trinidadian'>Trinidadian</option>
									<option value='tristanian'>Tristanian</option>
									<option value='tunisian'>Tunisian</option>
									<option value='turkish'>Turkish</option>
									<option value='turkmen'>Turkmen</option>
									<option value='turks-and-caicos-islander'>Turks and Caicos Islander</option>
									<option value='tuvaluan'>Tuvaluan</option>
									<option value='ugandan'>Ugandan</option>
									<option value='ukrainian'>Ukrainian</option>
									<option value='uruguayan'>Uruguayan</option>
									<option value='uzbek'>Uzbek</option>
									<option value='vatican-citizen'>Vatican citizen</option>
									<option value='citizen-of-vanuatu'>Citizen of Vanuatu</option>
									<option value='venezuelan'>Venezuelan</option>
									<option value='vietnamese'>Vietnamese</option>
									<option value='vincentian'>Vincentian</option>
									<option value='wallisian'>Wallisian</option>
									<option value='welsh'>Welsh</option>
									<option value='yemeni'>Yemeni</option>
									<option value='zambian'>Zambian</option>
									<option value='zimbabwean'>Zimbabwean</option>
								</select>
							</div>
						<button id="submitButton" type="submit" class="btn btn-primary submi">등록</button>
					</div>
			</div>
		</div>
	</section>
    <!--</form>-->

<script>
	$(document).ready(function(){

		var passwordChecker = false;
		var idChecker = false;
		$("#re_password").change(function(){
			let password = $("#password").val();
			let passwordCheck = $("#re_password").val();
			if(password == passwordCheck){
				$("#passwordChecked").removeClass("d-none");
				$("#passwordCheckFailed").addClass("d-none");
				passwordChecker = true; 

			} else{
				$("#passwordCheckFailed").removeClass("d-none");
				$("#passwordChecked").addClass("d-none");
			}
		})
		//중복 id 체크
		$("#duplicationCheckButton").on("click", function(){
			$.ajax({
				tyle : "get"
				, url : "/users/signup/idcheck"
				, data : {"email" : $("#username").val()}
				, success : function(data){
					if(data.result =='CHECK COMPLETED'){
						$("#duplicationChecked").removeClass("d-none");
						$("#duplicationCheckFailed").addClass("d-none");
						idChecker = true;
					} else{
						$("#duplicationCheckFailed").removeClass("d-none");
						$("#duplicationChecked").addClass("d-none");
						idChecker = false;
					}
				}
				, error : function(){
					alert("에러입니다.");
				}
			})
		})
		//입력 버튼 완성되어야 넘기기
		$("#submitButton").on("click", function(){
			let completed = false;
			let username = $("#username").val();
			let password = $("#password").val();
			let passwordCheck = $("#re_password").val();
			let gender = $("input[name=gender]:checked").val();
			let nationality = $("#nationality").val();

			//빈칸 없도록 하기
			let filled = false;

			//빈칸 없으면 true
			if(username != "" && password != "" && passwordCheck !="" && gender != "" && nationality != "" && passwordChecker == true){
				filled = true;
			}

			//db로 넘기는 조건 : 빈칸없음 , id 중복 안됨
			if(filled==true &&idChecker ==true){

				$.ajax({
					type : "post"
					,url : "/users/signup/view/"
					,data : {
						"mail" : username
						,"userPW" : password
						,"gender" : gender
						,"nationality" : nationality
					}
					,success : function(data){
						alert("가입완료");
						location.href= "/users/login/view/";
					}
					,error : function(){
						alert("에러입니다.");
					}
				})
			} //빈칸은 없지만 id중복체크 안함 
			else if(filled==true &&idChecker ==false){
				alert("Email 중복확인을 해주세요.");
			} //빈칸 있음
			else if (filled==false){
				alert("항목을 모두 채워주세요.");
			}
		})
	})

</script>
    
</body>
</html>