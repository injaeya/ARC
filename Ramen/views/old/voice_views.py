from django.shortcuts import render

def dashboard(request):
    equipment = {
        'name': 'Machinery X',
        'state': 'Operational',
        'last_updated': '2024-08-01 12:34:56'
    }
    return render(request, './ramen/voice.html', {'equipment': equipment})


# myapp/views.py
from django.shortcuts import render
from django.http import JsonResponse
from pyModbusTCP.client import ModbusClient
import speech_recognition as sr

plc_ip = "192.168.20.100"
mainPlc = ModbusClient(host=plc_ip, unit_id=1, auto_open=True, auto_close=True)

def index(request):
    return render(request, 'index.html')

def get_plc_status(request):
    try:
        oder_bit = mainPlc.read_holding_registers(5001)
        status = 'Unknown'
        if oder_bit == [50]:
            status = 'Resetting coils'
        elif oder_bit == [40]:
            status = 'Waiting for voice command'
        return JsonResponse({'status': status})
    except Exception as e:
        return JsonResponse({'status': 'Error', 'error': str(e)})

def test_microphone(request):
    # Microphone testing logic here
    # For now, it will just return a JSON response for demo purposes
    return JsonResponse({'message': 'Microphone test triggered'})