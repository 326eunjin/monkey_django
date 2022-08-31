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
  </head>
  <body>
    <header id="header">
      <div class="h_inner">
        <div class="m_logo">
          <h1 class="tit_h1">
            <a href="#header"></a>
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
                <a href="#none">원숭이두창</a>
              </li>
              <li>
                <a href="#none">검사</a>
              </li>
              <li>
                <a href="#none">원숭이두창맵</a>
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
          <form method="post" action=".">
            {% csrf_token %}
            <h2 class="text-center">로그인</h2>
            <div class="form-group">
              <input
                type="text"
                name="mail"
                class="form-control"
                placeholder="mail"
                required="required"
              />
            </div>
            <div class="form-group">
              <input
                type="password"
                name="userpw"
                class="form-control"
                placeholder="Password"
                required="required"
              />
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-block">
                로그인
              </button>
            </div>
          </form>
          <p class="text-center">
            <a href="/users/signup/view/" id="register">회원 가입</a>
          </p>
        </div>
      </div>
    </section>
  </body>
</html>
