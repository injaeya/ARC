# 😀Abiman | ENG |DINNIG BOT 

admin - 123456789
---
## 변경 내용
1. 2024.09.02
	- 주문 db추가 사번으로 이력 갯수 결재 확인

## 사용자 추가
1. python manage.py import_users
	- users.csv 파일에 추가

---
## 관리자 비번초기화
from django.contrib.auth import get_user_model

User 모델 가져오기
User = get_user_model()

관리자 계정 가져오기 ('admin'을 관리자 사용자 이름으로 대체)
user = User.objects.get(username='admin')

새로운 비밀번호 설정
user.set_password('새로운_비밀번호')  # '새로운_비밀번호'를 원하는 비밀번호로 대체
user.save()

---

## DB data 제거
 - python manage.py
 - from Ramen.models import Mymodel
 - MyModel.objects.all(),delete()
 - exit()

## QR code

 - ![alt text](image.png)