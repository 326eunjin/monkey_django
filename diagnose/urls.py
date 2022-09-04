from django.urls import path
import diagnose.views

app_name = "diagnose"
urlpatterns = [
    # path('signup/view/', users.views.signup, name='signup'),
    # path('login/view/', users.views.login, name='login'),
    # path('logout/', users.views.logout, name='logout'),
    # path('signup/idcheck/', users.views.idcheck, name='check')
    path('input/', diagnose.views.home_view),
    path('predict/view', diagnose.views.predict),
]
