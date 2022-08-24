from curses.ascii import HT
from datetime import datetime
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.core.mail.backends import console
from django.contrib.auth.hashers import make_password, check_password
from .models import User
import time
# Create your views here.


def signup(request):
    if request.method == 'GET':
        return render(request, 'users/signup.jsp')
    elif request.method == 'POST':
        mailInput = request.POST.get('mail', None)
        userPWInput = request.POST.get('userPW', None)
        genderInput = request.POST.get('gender', None)
        nationalityInput = request.POST.get('nationality', None)
        now = time.strftime('%Y-%m-%d %H:%M:%S')

        res_data = {}
        try : 
            user = User.objects.get(mail = mailInput)
            if user:
                res_data['status'] = '0'
                return JsonResponse(res_data)
        except User.DoesNotExist:
            user = User(
                mail = mailInput,
                userpw = make_password(userPWInput),
                gender = genderInput,
                nationality = nationalityInput,
                createdat = now,
                updatedat = now
            )
            user.save()
            user = User.objects.get(mail=mailInput)
            request.session['user'] = user.id
            res_data['status'] = '1'
            return JsonResponse(res_data)
        return render(request, 'users/login.jsp', res_data)

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
    return render(request, 'users/index.jsp')
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

def idcheck(request):
    if request.method == 'GET' :
        emailInput = request.GET.get('email', None)
        res_data = {}
        try :
            userFound = User.objects.get(mail = emailInput)
            res_data['result'] = 'DUPLICATED'
            return JsonResponse(res_data)
        except User.DoesNotExist: 
            res_data['result'] = 'CHECK COMPLETED'
            return JsonResponse(res_data)

        