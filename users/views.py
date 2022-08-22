from curses.ascii import HT
from datetime import datetime
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password, check_password
from .models import User
# Create your views here.


def signup(request):  # 회원가입 페이지를 보여주기 위한 함수
    if request.method == "GET":
        return render(request, 'users/signup.jsp')

    elif request.method == "POST":
        username = request.POST.get('username', None)  # 딕셔너리형태
        password = request.POST.get('password', None)
        re_password = request.POST.get('re_password', None)
        gender = request.POST.get('gender', None)
        nationality = request.POST.get('nationality', None)
        res_data = {}
        if not (username and password and re_password and gender and nationality):
            res_data['error'] = "모든 값을 입력해야 합니다."
        if password != re_password:
            # return HttpResponse('비밀번호가 다릅니다.')
            res_data['error'] = '비밀번호가 다릅니다.'
        else:
            # make password 함수 호출할것
            user = User(mail=username, userpw=make_password(password),
                        gender=gender, nationality=nationality)
            user.save()
        # signup를 요청받으면 signup.html 로 응답.
        return render(request, 'users/signup_success.jsp', res_data)


def login(request):
    if request.method == 'GET':
        return render(request, 'users/login.jsp')
    elif request.method == 'POST':
        mail = request.POST.get('mail', None)
        userpw = request.POST.get('userpw', None)
    res_data = {}
    if not (mail and userpw):
        res_data['error'] = "모든 칸을 다 입력해주세요"
    else:
        user = User.objects.get(mail=mail)
        if check_password(userpw, user.userpw):
            request.session['user'] = user.mail
            return redirect('/')
        else:
            res_data['error'] = "비밀번호가 틀렸습니다."
    return render(request, 'users/login_error.jsp', res_data)


def home(request):
    return HttpResponse("HOME!")
    # user_pk = request.session.get('user')
    # if user_pk:
    #     user = User.objects.get(mail=user_pk)//로그인했으면 메일 주소가 나옴
    #     return HttpResponse(user.mail)
    # return HttpResponse("login success")//로그인 안 했으면 이걸로 나옴


def logout(request):
    if request.session['user']:  # 로그인중이라면
        del(request.session['user'])
        print("hi")
    return redirect('/')  # 홈화면으로 이동
