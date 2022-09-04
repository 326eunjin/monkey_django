#from tkinter import image_names
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .forms import ImagefieldForm
from users.models import User
import pickle
import time
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import os
import torch
from torchvision import datasets, models, transforms
import torch.nn as nn
from torch.nn import functional as F
import torch.optim as optim
import torchvision
import joblib
from PIL import Image


def model_activate(img_path, model_path):
    device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
    model = models.resnet18(weights=None).to(device)
    model.fc = nn.Sequential(
        nn.Linear(512, 128),
        nn.ReLU(inplace=True),
        nn.Linear(128, 2)).to(device)
    model = joblib.load(model_path)
    classes = ['others', 'monkeypox']
    # 이건 테스트할 테스트 데이터 셋인데 저장해둔 사진 파일 위치 올려놓기
    file_list = Image.open(img_path)
    # 위에 문장에서 파일명을 받았으니 파일명과 나머지 주소를 합치는 과정
    print(file_list)
    normalize = transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                     std=[0.229, 0.224, 0.225])
    data_transforms = {
        'train':
        transforms.Compose([
            transforms.Resize((224, 224)),
            transforms.RandomAffine(0, shear=10, scale=(0.8, 1.2)),
            transforms.RandomHorizontalFlip(),
            transforms.ToTensor(),
            normalize
        ]),
        'test':
        transforms.Compose([
            transforms.Resize((224, 224)),
            transforms.ToTensor(),
            normalize
        ])
    }
    # 이미지 전처리 과정인데 여기서 'test' 부분으로 test데이터셋 resize해서 이미지 크기 평준화 시키는곳
    validation_batch1 = torch.stack(
        [data_transforms['test'](file_list).to(device)])

    # 이건 내가 위에꺼가 원숭이두창, 나머지로 원숭이두창, 나머지의 결과가 어떻게 나오나 보려고 나눠둔것 validation_batch한개만 있어도 상관 없음
    pred_logits_tensor = model(validation_batch1)
    pred_probs = F.softmax(pred_logits_tensor, dim=1).cpu().data.numpy()
    not_monkey = int(pred_probs[0][0]*100)
    monkey = int(pred_probs[0][1]*100)
    return monkey
# Create your views here.


def predict(request):
    try:
        user = User.objects.get(id=request.session['id'])
    #result = model_activate('user.image', '모델경로')
        imageUrl = '/Users/jiwon/monkey_django/uploaded_files/' + \
            str(user.image)
        result = model_activate(
            imageUrl, '/Users/jiwon/monkey_django/diagnose/model/resnet(cpu)(18) (1).pkl')
        if(result > 80):
            user.diagnosed = 1
        else:
            user.diagnosed = 0
        user.save()
        context = {"percentage": result, "user": user}
        # 사진 삭제하기
        os.remove(imageUrl)
        return render(request, "diagnose/result.jsp", context)
    except:
        return HttpResponse("잘못된 접근입니다. 로그인 후 다시 시도해 주세요.")


def home_view(request):
    context = {}
    if request.method == "POST":
        id = request.session['id']
        form = ImagefieldForm(request.POST, request.FILES)
        if form.is_valid():
            img = form.cleaned_data.get("image_field")
            # now = time.strftime('%Y-%m-%d %H:%M:%S')
            obj = User.objects.get(id=id)
            obj.updatedAt = time.strftime('%Y-%m-%d %H:%M:%S')  # 업데이트 시간 왜 안됨
            obj.image = img
            obj.save()
            return redirect('/diagnose/predict/view')  # 사진 올린 후 경로!
    else:
        form = ImagefieldForm()
        context['form'] = form
        return render(request, "diagnose/upload_file.jsp", context)


def success(request):
    return HttpResponse('successfully uploaded')
# Create your views here.
