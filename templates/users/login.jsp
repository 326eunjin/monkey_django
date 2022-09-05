{% load static %}
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>로그인</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="{% static 'css/login.css' %}" />

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      src="https://kit.fontawesome.com/7d891d878a.js"
      crossorigin="anonymous"
    ></script>
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
                <a href="/diagnose/input/">검사</a>
              </li>
              <li>
                <a href="/map/">원숭이두창맵</a>
              </li>
              <li>
                <a href="#none">기타</a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    <!-- <span class="anchor"></span> -->
    <section id="mv">
      <img src="{% static 'css/images/main_image.png' %}" />
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
            <input
              id="mail"
              type="text"
              name="mail"
              class="form-control"
              placeholder="user@email.com"
              required="required"
            />
          </div>
          <div class="form-group">
            <input
              id="userpw"
              type="password"
              name="userpw"
              class="form-control"
              placeholder="Password"
              required="required"
            />
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-block" id="loginButton">
              로그인
            </button>
          </div>
          <p class="text-center">
            <a href="/users/signup/view/" id="register">회원 가입</a>
          </p>
        </div>
      </div>
    </section>

    <script>
      function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie !== "") {
          var cookies = document.cookie.split(";");
          for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === name + "=") {
              cookieValue = decodeURIComponent(
                cookie.substring(name.length + 1)
              );
              break;
            }
          }
        }
        return cookieValue;
      }
      var csrftoken = getCookie("csrftoken");

      function csrfSafeMethod(method) {
        // these HTTP methods do not require CSRF protection
        return /^(GET|HEAD|OPTIONS|TRACE)$/.test(method);
      }
      $.ajaxSetup({
        beforeSend: function (xhr, settings) {
          if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
          }
        },
      });
    </script>

    
    <script>
      $(document).ready(function () {
        $("#loginButton").on("click", function () {
          $.ajax({
            type: "POST",
            url: "/users/login/",
            data: {
              mail: $("#mail").val(),
              userpw: $("#userpw").val(),
            },
            success: function (data) {
              if (data.result == "loginSuccess") {
                location.href = "/";
                window.sessionStorage.setItem("loggedin", true);
              } else if (data.result == "loginFailed") {
                alert("비밀번호를 확인해주세요");
              } else if (data.result == "noUser") {
                alert("계정을 확인해주세요");
              }
            },
            error: function () {
              alert("에러");
            },
          });
        });
        $("a[name=examineButton]").on("click", function () {
            if (loginStatus == true) {
              location.href = "/diagnose/input/";
            } else {
              alert("로그인 해주세요.");
              location.href = "/users/login/view/";
            }
          });
      });
    </script>
  </body>
</html>
