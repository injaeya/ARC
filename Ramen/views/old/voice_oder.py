from pyModbusTCP.client import ModbusClient
import os, sys, time
import speech_recognition as sr
from django.shortcuts import render, get_object_or_404
plc_ip = "192.168.20.100"

mainPlc = ModbusClient(host=plc_ip, unit_id=1, auto_open=True, auto_close=True)



def voice_oder_mic(request):
    test_microphone(device_index=0)
    return render(request, './ramen/new_index03.html')

def test_microphone(device_index=None):
    recognizer = sr.Recognizer()
    command_map = {
        '한 개': 1, '하나': 1, '한그릇': 1,
        '두 개': 2, '둘': 2, '두그릇': 2,
        '세 개': 3, '셋': 3, '세그릇': 3,
        '네 개': 4, '넷': 4, '네그릇': 4,
        '다섯 개': 5, '다섯': 5, '다섯그릇': 5,
        '여섯 개': 6, '여섯': 6, '여섯그릇': 6,
        '일곱 개': 7, '일곱': 7, '일곱그릇': 7,
        '여덟 개': 8, '여덟': 8, '여덟그릇': 8,
        '아홉 개': 9, '아홉': 9, '아홉그릇': 9,
        '열 개': 10, '열': 10, '열그릇': 10
    }


    try:
        with sr.Microphone(device_index=device_index) as source:
            print("환경 소음 조정 중...")
            recognizer.adjust_for_ambient_noise(source)
            time.sleep(1)  # 추가 대기 시간
            print("주문수량을 말씀해 주세요.")
            audio = recognizer.listen(source)
            time.sleep(2)
            try:
                print("주문 수량 확인중...")
                text = recognizer.recognize_google(audio, language="ko-KR")
                print(f"오더수량: {text}")
                # 명령어 매핑 확인
                for command, value in command_map.items():
                    if command in text:
                        mainPlc.write_multiple_registers(5000, [value])
                        print(f"{value}개 주문이 실행되었습니다.")
                        break
                else:
                    print("명령어가 인식되지 않았습니다.")
            except sr.UnknownValueError:
                print("음성을 명확하게 인식할 수 없습니다. 다시 시도해 주세요.")
            except sr.RequestError as e:
                print(f"음성 인식 서비스에 접근할 수 없습니다: {e}")
                time.sleep(5)
    except AssertionError as ae:
        print(f"오류: 마이크 장치에 접근할 수 없습니다. {ae}")
    except Exception as e:
        print(f"오류가 발생했습니다: {e}")