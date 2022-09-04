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
            <ul class="login">
              <li>
                <a href="/users/login/view">로그인</a>
              </li>
              <li>
                <a href="/users/signup/view">회원가입</a>
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
    <body>
      <img src = "{% static 'css/images/newplot.png' %}">
  </body>
</html>
