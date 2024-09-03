from django.urls import path
from .views import index_views, index_5_oder_comp, index_3_voice_oder, index_0_cspower_on, db_index00

app_name = 'Ramen'

urlpatterns = [

    path('', index_views.index, name='index'), # 제일 초기 화면
    path('index02/', index_views.oder_select, name='index02'), # 일반주문 / 음성주문 선택화면
    path('index03/', index_3_voice_oder.voice_oder, name='index03'), # 음성인식 주문화면
    path('index04/', index_views.manual_oder, name='index04'), # 일반주문 화면
    # path('index05/', index_5_oder_comp.manual_oder_complete, name='index05'), # 일반주문 확인 완료
    path('index05/<int:count>/<str:employee_id>/', index_5_oder_comp.manual_oder_complete, name='index05'), # 일반주문 확인 완료

    # WARNING : db전송 확인 코드
    # 로그인 관련 URL 패턴
    path('db_index00/', db_index00.login_view, name='db_index00'),  # 로그인 페이지

    # 음성주문에 관한 것들 미사용
    # path('voice-order/', index_3_voice_oder.voice_oder, name='voice_order'),
    # path('test-microphone/', index_3_voice_oder.test_microphone_view, name='test_microphone_view'),
    # path('index05/', index_3_voice_oder.index05, name='index05'),  # index05 뷰에 대한 URL 패턴 추가
]