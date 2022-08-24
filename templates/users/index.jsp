<!DOCTYPE html>
{% load static %}
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <title>monkey</title>
    <script
      src="https://kit.fontawesome.com/7d891d878a.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="{% static 'css/style.css' %}" />
  </head>
  <body>
    <header id="header">
      <div class="h_inner">
        <div class="m_logo">
          <h1 class="tit_h1">
            <a href="#header"></a>
          </h1>
          <h2>Monkey Magic</h2>
          <ul class="snb">
            <li>
              <a href="#none">ENG</a>
            </li>
            <li>
              <a href="#none">KOR</a>
            </li>
          </ul>
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

    <section id="mv">
      <img src="/Users/jiwon/monkey_django/images/main_image.png" />

      <div class="main_text">
        <div class="text_box">
          <h3>원숭이두창</h3>
          <p>
            AI 모델을 활용해, 당신의 두드러기가 원숭이 두창에 의해 발생한
            두드러기인지, 아닌지를 판단해드립니다.
            <br />
            <br />
            (본 검사는 정확한 의학적 근거 기반의 검사가 아닙니다.)
          </p>
        </div>
      </div>

      <!--<video muted autoplay loop>
        <source src="images/posco.mp4" />
      </video>-->
    </section>

    <section id="content01">
      <h2>Challenge Together, Change Tomorrow</h2>
      <article class="item_box">
        <a href="#none">
          <img src="/images/products1_m.png" alt="제품별이미지" />
          <h3>제품별<span>Product</span></h3>
          <p>
            포스코는 포항과 광양에 6개의 열연 공장과 1개의 하이밀 공장을 갖추고
            연간 980만 톤의 열연 완제품을 생산하며 세계적 경쟁력을 확보하고
            있으며 우수합니다.
          </p>
        </a>
      </article>
      <article class="item_box">
        <a href="#none">
          <img src="/images/products1_m.png" alt="제품별이미지" />
          <h3>제품별<span>Product</span></h3>
          <p>
            포스코는 포항과 광양에 6개의 열연 공장과 1개의 하이밀 공장을 갖추고
            연간 980만 톤의 열연 완제품을 생산하며 세계적 경쟁력을 확보하고
            있으며 우수합니다.
          </p>
        </a>
      </article>
      <article class="item_box">
        <a href="#none">
          <img src="/images/products1_m.png" alt="제품별이미지" />
          <h3>제품별<span>Product</span></h3>
          <p>
            포스코는 포항과 광양에 6개의 열연 공장과 1개의 하이밀 공장을 갖추고
            연간 980만 톤의 열연 완제품을 생산하며 세계적 경쟁력을 확보하고
            있으며 우수합니다.
          </p>
        </a>
      </article>
    </section>

    <section id="content02">
      <article class="item_news">
        <div class="item_h3">
          <h3>뉴스</h3>
          <p>포스코의<span>새로운 소식</span>을 전해드립니다.</p>
        </div>
        <a href="#none">새로운 소식을 신속하고 정확하게 전달합니다</a>
      </article>
      <article class="item_news">
        <div class="item_h3">
          <h3>뉴스</h3>
          <p>포스코의<span>새로운 소식</span>을 전해드립니다.</p>
        </div>
        <a href="#none">새로운 소식을 신속하고 정확하게 전달합니다</a>
      </article>
    </section>
    <div class="bg">
      <section id="content01">
        <h2 class="text_w">About POSCO</h2>
        <article class="item_box">
          <a href="#none">
            <img src="images/intro1.png" alt="제품별이미지" />
            <h3 class="text_w">회사소개</h3>
            <p class="text_w">
              세계에서 가장 경쟁력있는 철강회사로서 인류발전에 기여합니다.
            </p>
          </a>
        </article>
        <article class="item_box">
          <a href="#none">
            <img src="images/intro2.png" alt="제품별이미지" />
            <h3 class="text_w">회사소개</h3>
            <p class="text_w">
              세계에서 가장 경쟁력있는 철강회사로서 인류발전에 기여합니다.
            </p>
          </a>
        </article>
        <article class="item_box">
          <a href="#none">
            <img src="images/intro3.png" alt="제품별이미지" />
            <h3 class="text_w">회사소개</h3>
            <p class="text_w">
              세계에서 가장 경쟁력있는 철강회사로서 인류발전에 기여합니다.
            </p>
          </a>
        </article>
      </section>
    </div>
    <footer>
      <h1 class="tit_h1">
        <a href="#none"> </a>
        <span class="blind">posco</span>
      </h1>
      <div class="foot_box">
        <ul>
          <li>
            <a href="#none">개인정보처리방침</a>
          </li>
          <li>
            <a href="#none">이메일무단수집거부</a>
          </li>
          <li>
            <a href="#none">이용약관</a>
          </li>
        </ul>
        <address>
          경기도 안산시 단원구 번영로 68 대표이사: 조일현, 오준호
          사업자등록번호: 122-00-00000<br />
          TEL : 031.362.0000 FAX : 031.362.0000 Copyright (c) 2020 SW. ALL
          RIGHTS RESERVED
        </address>
      </div>
    </footer>
  </body>
</html>
