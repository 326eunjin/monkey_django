# users>urls.py

from django.urls import path
from django.contrib.auth import views as auth_views
import users.views
app_name = "users"
urlpatterns = [
    path('login/', auth_views.LoginView.as_view(
        template_name='users/login.jsp'), name='login'),
    path('signup/', users.views.signup, name='signup'),
]
