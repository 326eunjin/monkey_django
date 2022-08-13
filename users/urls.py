# users>urls.py

from django.urls import path
from django.contrib.auth import views as auth_views
import users.views

app_name = "users"
urlpatterns = [
    path('login/', auth_views.LoginView.as_view(), name='login'),  # 수정해야하는 코드
    path('signup/', users.views.signup, name="signup"),
    path('main/', users.views.mainPage, name="main")
    # django.contrib.auth앱의 LoginView 클래스를 활용했으므로 별도의 views.py 파일 수정이 필요 없음
]
