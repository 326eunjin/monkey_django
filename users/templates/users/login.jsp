<h1>로그인</h1>
<form method="post" action="{% url 'users:login' %}">
  {% csrf_token %}
  <div>
    <label>사용자 ID</label>
    <input type="text" name="username" id="username">
  </div>
  <div>
    <label>비밀번호</label>
    <input type="text" name="password" id="password">
  </div>
  <button type="submit">로그인</button>
</form>