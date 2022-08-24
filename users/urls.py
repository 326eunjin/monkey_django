# users>urls.py

from django.urls import path
from django.contrib.auth import views as auth_views
import users.views

app_name = "users"
urlpatterns = [
    path('signup/view/', users.views.signup, name='signup'),
    path('login/view/', users.views.login, name='login'),
    path('logout/', users.views.logout, name='logout'),
    path('signup/idcheck/', users.views.idcheck, name='check')
]
