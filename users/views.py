from datetime import datetime
from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password
from .models import User
# Create your views here.


def signup(request):
    return render(request, 'users/signup.jsp')
