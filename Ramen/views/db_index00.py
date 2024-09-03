from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from ..models import MyModel  # 상위 디렉토리의 models.py 파일에서 MyModel을 가져옵니다

def login_view(request):
    if request.method == 'POST':
        employee_id = request.POST.get('employee_id')
        password = request.POST.get('password')
        count = request.POST.get('count', 0)  # POST 요청에서 count 값을 받음

        # 사번과 비밀번호로 사용자 인증
        user = authenticate(request, username=employee_id, password=password)

        if user is not None:
            login(request, user)

            # 사번과 count 값을 DB에 저장
            my_model_instance = MyModel(employee_id=employee_id, count=int(count))
            my_model_instance.save()

            # 사번과 count 값을 index05로 넘김
            return redirect('Ramen:index05', count=count, employee_id=employee_id)  # 로그인 성공 시 index05로 리디렉션
        else:
            messages.error(request, '사번 또는 비밀번호가 잘못되었습니다.')
            return render(request, 'ramen/db_index00.html')  # 로그인 실패 시 다시 로그인 페이지
    return render(request, 'ramen/db_index00.html')  # GET 요청 시 로그인 페이지 렌더링