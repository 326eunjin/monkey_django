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
    <link rel="stylesheet" href="{% static 'css/ins.css' %}" />

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
                <a href="#none">원숭이두창</a>
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
    <section id="mv">
      <img src="{% static 'css/images/main_image.png' %}" />
      <div class="container">
        <div class="text_box">
          <div class="box_inner">
            <details>
              <summary>원숭이두창이란?</summary>
              원숭이 두창(Monkeypox)은 천연두와 우두 등이 포함된
              오르토폭스바이러스 속의 원숭이 두창 바이러스(Monkeypox virus,
              MPXV)가 일으키는 희귀 인수공통전염병이다.
              <br />
              본래 MPXV는 중서부 아프리카의 열대우림에 서식하는 원숭이 사이에서
              전파되는 바이러스이나, 감염된 동물에 접촉한 사람에게도 발병한다.
              <br />
              <br />
              1958년 덴마크 코펜하겐의 실험용 원숭이에서 최초로 발견되었으며,
              1970년 인간에 대한 발병이 보고된 이후 각지에서 감염 사례가
              보고되고 있다.<br />원숭이 두창의 치명률은 약 10% 미만으로, 인간
              두창인 천연두에 비해서는 증상과 치명률이 낮으나
              오르토폭스바이러스속의 다른 바이러스처럼 전파율이 높으며 <br />
              감염자와의 직접 접촉을 제외한 비말 등 체액이나 바이러스 등에
              오염된 물건과 접촉하는 것으로도 전염될 수 있다.
            </details>
          </div>
          <div class="box_inner">
            <details>
              <summary>감염경로</summary>
              감염 환자의 혈액 또는 체액(타액, 소변, 구토물 등) 등이 피부상처
              또는 점막을 통해 직접 접촉 감염
              <br />
              환자의 혈액이나 체액으로 오염된 옷, 침구류, 감염된 바늘 등이
              사람의 점막, 피부 상처 등 접촉 감염
              <br />
              감염된 원숭이, 다람쥐 등 동물과의 직접 접촉 감염
            </details>
          </div>
          <div class="box_inner">
            <details>
              <summary>발현증상</summary>
              발열, 발진, 두통, 근육통, 허리통증, 무기력감, 림프절 부종 등이
              나타날 수 있습니다. <br />
              발진은 일반적으로 발열 후 1~3일 이내 시작하며 얼굴, 손바닥,
              발바닥에 집중하여 나타나는 경향이 있고, 간혹 입, 생식기 또는
              안구에도 나타날 수 있습니다.
              <br />
              <br />
              발진은 수포(물집), 농포(고름) 및 가피(딱지) 등으로 진행되며 특정
              부위 발진은 대개 같은 진행 단계인 것과 림프절병증 등이 특징이며,
              <br />
              이러한 발진 등 임상증상은 약 2~4주 지속 될 수 있습니다.
            </details>
          </div>
          <div class="box_inner">
            <details>
              <summary>검사 관련</summary>
              현재 원숭이두창 진단검사는 질병관리청에서 검사 가능합니다. <br />
              원숭이두창 진단검사 방식은 유전자검출검사로 검사실에서 검체 접수
              후 6시간 정도 소요됩니다.
              <br />
              <br />
              <a href="https://www.kdca.go.kr/contents.es?mid=a20108010000"
                >링크 바로가기</a
              >
            </details>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
