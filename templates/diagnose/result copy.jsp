{% load static %}
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
    <link rel="stylesheet" href="{% static 'css/result.css' %}" />
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
                <a id="logoutButton" href="/users/logout/">๋ก๊ทธ์์</a>
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
              <li><a href="/users/login/view/">๋ก๊ทธ์ธ</a></li>
              {% endif %}
            </ul>
            <ul class="search">
              <input type="text" placeholder="Search" />
              <button>๊ฒ์</button>
            </ul>
          </div>
        </div>
        <div class="m_nav">
          <nav>
            <ul>
              <li>
                <a href="/ins/">์์ญ์ด๋์ฐฝ</a>
              </li>
              <li>
                <a href="#" name="examineButton">๊ฒ์ฌ</a>
              </li>
              <li>
                <a href="/map/">์์ญ์ด๋์ฐฝ๋งต</a>
              </li>
              <li>
                <a href="#none">๊ธฐํ</a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    <section id="mv">
      <img src="{% static 'css/images/main_image.png' %}" />
      <div class="text-center container">
        <div class="text-box">
          <div class="inner">
            <h4 class="text-center">๋น์?์ ์ผ์น์จ์</h4>
            <h2 class="text-center">{{ user.result }}%</h2>
          </div>
          <div class="one339">
            <a class="mb-1"href="https://www.kdca.go.kr/contents.es?mid=a20701000000"
              >์ง๋ณ๊ด๋ฆฌ์ฒญ 1339 ๋ฐ๋ก๊ฐ๊ธฐ</a
            >
            <a  href="https://www.g-health.kr/portal/health/pubHealthSearch/list.do?bbsId=U00198&menuNo=200452"
            >๊ทผ์ฒ ๋ณด๊ฑด๊ธฐ๊ด ์ฐพ๊ธฐ</a
          >            
          </div>
          <hr />
          <p class="mt-2">
            ์ด ์์น๋ AI ๋ชจ๋ธ์ ํ์ฉํด ํ ํผ๋ถ์งํ์ ๋ฐ์ง์ ๋น๊ตํ์ฌ ๋์จ
            ์์น์๋๋ค. <br />
            ์?ํํ ์ํ์? ๊ฒ์ฌ๊ฐ ์๋๋ฏ๋ก, ์ง๋ณ๊ด๋ฆฌ์ฒญ์์์ ์ง๋จ ๊ฒ์ฌ์ ๊ฐ์
            ์?ํํ ์ง๋จ์ด ํ์ํฉ๋๋ค.
          </p>
        </div>
      </div>
    </section>
    <footer id="ft">
      <div class="foot_box">
        <address>
          Monkey Magic
          <br />
          BE ์ํํธ์จ์ดํ๋ถ ์ฅ์์ง ๊ธ๋ก๋ฒ๋ฏธ๋์ดํ๋ถ 20182764 ํฉ์ง์ / PM
          ๊ธ๋ก๋ฒ๋ฏธ๋์ดํ๋ถ 20182728 ์ด๋ํธ / AI ๊ธ๋ก๋ฒ๋ฏธ๋์ดํ๋ถ 20192684 ๋ฐฉ์งํ
          / FE ๊ธ๋ก๋ฒ๋ฏธ๋์ดํ๋ถ 2021 ๊นํ๋?น
          <br />
          TEL : 010.5112.1400 Copyright (c) 2022 SW. ALL ALL RIGHTS RESERVED
        </address>
      </div>
    </footer>
  </body>
</html>
