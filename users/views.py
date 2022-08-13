from django.shortcuts import render

# Create your views here.


def signup(request):
    return render(request, 'users/signup.jsp')

def mainPage(request):
    return render(request, 'users/index.jsp')