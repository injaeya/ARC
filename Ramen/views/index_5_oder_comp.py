from django.core.paginator import Paginator
from django.shortcuts import render, get_object_or_404
from pyModbusTCP.client import ModbusClient
import time

plc_ip = "192.168.20.100"

mainPlc = ModbusClient(host=plc_ip, unit_id=1, auto_open=True, auto_close=True)

def manual_oder_complete(request):
    count = request.GET.get('count', 0)
    plc_oder_count = int(count)
    print(": 주문수량 :",plc_oder_count)
    mainPlc.write_multiple_registers(5010, [40])
    mainPlc.write_multiple_registers(5000, [plc_oder_count])
    return render(request, './ramen/new_index05.html')