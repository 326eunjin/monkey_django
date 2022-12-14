{% load static %}
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Django File Upload</title>
    <script
      src="https://kit.fontawesome.com/7d891d878a.js"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link rel="stylesheet" href="{% static 'css/upload_file.css' %}" />
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
      <div class="container">
        <div class="box">
          <h2 class="text-center">์์ญ์ด๋์ฐฝ ๊ฒ์ฌ</h2>
          <div class="content">
          <form method="POST" enctype="multipart/form-data">
            {% csrf_token %}
            {{ form.as_p }}
            <input type="submit" value="Submit" id="submitbutton" />
            <!--
            <div class="d-flex">
              <div>๋ฐ์ง
                <select name="rash">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                </select>
              </div>
              <div>๋ฐ์ด
                <select name="rash">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                </select>
              </div>
              <div>๋ํต
                <select name="rash">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                </select>
              </div>
              <div>ํ๋ฆฌํต์ฆ
                <select name="rash">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                </select>
              </div>
              <div>๊ทผ์กํต
                  <select name="rash">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                  </select>
                </div>
                <div>๋ฆผํ๋ถ์ข
                    <select name="rash">
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                    </select>
                </div>
                <div>๋ฌด๊ธฐ๋?ฅ์ฆ
                      <select name="rash">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                </div>
              </div>
            </div>             
          </div>-->

          </form>
          <div>
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
<!-- =======
<html>
<<<<<<< HEAD
    <head>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data">
            {% csrf_token %}
            <input type="file" name="uploaded_file">
            <button type="submit">Upload</button>
          </form>

          {% if filename %}
            <p>File uploaded: <a href="{{ filename }}">{{ filename }}</a></p>
          {% endif %}
    </body>
</html> 
>>>>>>> 696c02252ea014ecbe25f503a45f0618f76e7e73
=======
    <form method="POST" enctype="multipart/form-data">
        {% csrf_token %}
        {{ form.as_p }}
        <input type="submit" value="Submit">
    </form>
</html> 
>>>>>>> 222d630db186e76da92b228c1d00f48d567d52b0 -->
