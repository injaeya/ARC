from django.core.paginator import Paginator
from django.shortcuts import render, get_object_or_404
import time

#메인 화면 첫화면

def index(request):
    return render(request, './ramen/new_index.html')

def oder_select(request):
    return render(request, './ramen/new_index02.html')

def manual_oder(request):
    return render(request, './ramen/new_index04.html')