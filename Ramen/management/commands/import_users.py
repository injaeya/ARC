import csv
from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password

class Command(BaseCommand):
    help = 'Import users from a CSV file'

    def handle(self, *args, **options):
        with open('users.csv', newline='', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                employee_id = row['employee_id']
                password = row['password']
                
                if not User.objects.filter(username=employee_id).exists():
                    User.objects.create(
                        username=employee_id,
                        password=make_password(password)
                    )
                    self.stdout.write(self.style.SUCCESS(f"User {employee_id} created"))
                else:
                    self.stdout.write(self.style.WARNING(f"User {employee_id} already exists"))
