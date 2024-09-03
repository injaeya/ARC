import csv
from django.core.management.base import BaseCommand
from Ramen.models import Employee  # Employee 모델 임포트
from django.contrib.auth.hashers import make_password

class Command(BaseCommand):
    help = 'Import users from a CSV file'

    def handle(self, *args, **options):
        with open('users.csv', newline='', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                employee_id = row['employee_id']
                name = row['name']
                password = row['password']
                
                if not Employee.objects.filter(employee_id=employee_id).exists():
                    employee = Employee(
                        employee_id=employee_id,
                        name=name
                    )
                    employee.set_password(password)  # set_password 사용
                    employee.save()  # Employee 객체 저장
                    self.stdout.write(self.style.SUCCESS(f"Employee {employee_id} created"))
                else:
                    self.stdout.write(self.style.WARNING(f"Employee {employee_id} already exists"))
