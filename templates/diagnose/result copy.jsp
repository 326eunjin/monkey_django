<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <title>monkey</title>
    <script
      src="https://kit.fontawesome.com/7d891d878a.js"
      crossorigin="anonymous"
    ></script>
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
    {% load static %}
    <link rel="stylesheet" href="{% static 'css/style.css' %}" />
  </head>
  <body>
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
                <a href="/diagnose/input/" name="examineButton">검사</a>
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
      <div class="text-center main_text">
        <div>당신의 일치율은</div>
        <br />
        <h1>{{ user.result }}%</h1>
      </div>
      <div class="d-flex">
        <div>질병관리청 1339</div>
        <div>근처 병원 찾기</div>
      </div>
      <hr />
      <div>
        이 수치는 AI 모델을 활용해 타 피부질환의 발진을 비교하여 나온
        수치입니다. 정확한 의학적 검사가 아니므로, 질병관리청에서의 진단 검사와
        같은 정확한 진단이 필요합니다.
      </div>
    </section>
    <footer>
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
  </body>
</html>
