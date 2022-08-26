#from tkinter import image_names
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .forms import ImagefieldForm
from users.models import User
import time
import datetime
# Create your views here.


def home_view(request):
    context = {}
    mail = request.session['user']
    if request.method == "POST":
        form = ImagefieldForm(request.POST, request.FILES)
        if form.is_valid():
            img = form.cleaned_data.get("image_field")
            # now = time.strftime('%Y-%m-%d %H:%M:%S')
            obj = User.objects.get(mail=mail)
            # obj.delete()
            # obj1 = User.objects.create(
            #     image=img,
            #     mail=obj.mail,
            #     userpw=obj.userpw,
            #     gender=obj.gender,
            #     nationality=obj.nationality,
            #     createdat=now,
            #     updatedat=now
            # )
            # obj1.save()
            obj.image = img
            obj.save()
            return redirect('/')  # 사진 올린 후 경로!
    else:
        form = ImagefieldForm()
        context['form'] = form
        return render(request, "diagnose/upload_file.jsp", context)


def success(request):
    return HttpResponse('successfully uploaded')
# Create your views here.
