#from tkinter import image_names
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .forms import ImagefieldForm
from users.models import User
import pickle
import time

# Create your views here.
def predict(request):
    userId = request.session['id']
    image = User.objects.get(id=userId)
    res_data = {'image', image}
    return res_data

def showPredict(request):
    userId = request.session['id']
    user = User.objects.get(id=userId)
    context = {'user' : user}
    return render(request, 'diagnose/showimage.jsp', context)
    
def home_view(request):
    context = {}
    if request.method == "POST":
        mail = request.session['mail']
        form = ImagefieldForm(request.POST, request.FILES)
        if form.is_valid():
            img = form.cleaned_data.get("image_field")
            # now = time.strftime('%Y-%m-%d %H:%M:%S')
            obj = User.objects.get(mail=mail)
            obj.updatedAt = time.strftime('%Y-%m-%d %H:%M:%S') #업데이트 시간
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
            return redirect('/diagnose/predict/view')  # 사진 올린 후 경로!
    else :
        form = ImagefieldForm()
        context['form'] = form
        return render(request, "diagnose/upload_file.jsp", context)


def success(request):
    return HttpResponse('successfully uploaded')
# Create your views here.
