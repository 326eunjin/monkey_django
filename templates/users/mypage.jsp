{% load static %}
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <title>마이페이지</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script
      src="https://kit.fontawesome.com/7d891d878a.js"
      crossorigin="anonymous"
    ></script>

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
    <link rel="stylesheet" href="{% static 'css/mypage.css' %}" />
  </head>
  <header id="header">
    <div class="h_inner">
      <div class="m_logo">
        <h1 class="tit_h1">
          <a href="/"></a>
          <span class="blind">monky</span>
        </h1>
        <h2>Monkey Magic</h2>
        <div class="sub">
          <ul class="snb d-flex">
            <li>
              <a href="/users/english/view/">ENG</a>
            </li>
            <li>
              <a href="/">KOR</a>
            </li>
          </ul>
          <ul class="login">
            {% if request.session.loggedin %}
            <script>
              var loginStatus = true;
            </script>
            <li>
              <a id="logoutButton" href="/users/logout/">로그아웃</a>
              <div id="loginStatus" class="d-none">true</div>
            </li>
            <li>
              <a href="/users/mypage/view/" class="text-white">{{user.mail}}</a>
            </li>
            <li>
              <a href="/users/mypage/view/" class="imgg"></a>
              <span class="blind">my</span>
            </li>
            {% else %}
            <script>
              loginStatus = false;
            </script>
            <li><a href="/users/login/view/">로그인</a></li>
            {% endif %}
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
              <a href="/diagnose/input" name="examineButton">검사</a>
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
  <section id="mv">
      <img src="{% static 'css/images/main_image.png' %}" />
      <div class="container">
        <div class="mybox">
          <h2 class="text-center">마이페이지</h2>
          <table class="table">
            <tr>
              <th>Email </th>
              <th>Gender </th>
              <th>Result</th>
            </tr>
            <tr>
              <td>{{user.mail}}</td>
              {%if user.gender == 0%}
              <td>male</td>
              {%else%}
              <td>female</td>
              {%endif%}
              {%if user.result != null%}
              <td>
              <button class="btn btn-sm btn-dark" id="resultButton">검사결과</button>
              {%else%}
              결과없음
              {%endif%}
              </td>
          </table>
          <a href="/">돌아가기</a>
        </div>
      </div>
    </section>
    <footer id="ft">
      <div class="foot_box">
        <address>
          Monkey Magic
          <br />
          BE 소프트웨어학부 장은진 글로벌미디어학부 20182764 황지원 / PM
          글로벌미디어학부 20182728 이동호 / AI 글로벌미디어학부 20192684 방지훈
          / FE 글로벌미디어학부 2021 김혜령
          <br />
          TEL : 010.5112.1400 Copyright (c) 2022 SW. ALL ALL RIGHTS RESERVED
        </address>
      </div>
    </footer>
    <script>
      $(document).ready(function(){
        $("#resultButton").on("click", function(){
          location.href = "/diagnose/result/view"
        })
      })
    </script>
  </body>
</html>
