from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

class Question(models.Model):
    subject = models.CharField(max_length=200)
    content = models.TextField()
    create_date = models.DateTimeField()
    
    def __str__(self):
        return self.subject

class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    content = models.TextField()
    create_date = models.DateTimeField()

class EmployeeManager(BaseUserManager):
    def create_user(self, employee_id, name, password=None):
        if not employee_id:
            raise ValueError('Employees must have an employee ID')
        if not name:
            raise ValueError('Employees must have a name')

        user = self.model(
            employee_id=employee_id,
            name=name,
        )
        if password:
            user.set_password(password)
        else:
            raise ValueError('Password is required')
        user.save(using=self._db)
        return user

    def create_superuser(self, employee_id, name, password=None):
        user = self.create_user(
            employee_id=employee_id,
            name=name,
            password=password,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user

class Employee(AbstractBaseUser):
    employee_id = models.CharField(max_length=100, unique=True)
    name = models.CharField(max_length=200)
    date_joined = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = EmployeeManager()

    USERNAME_FIELD = 'employee_id'
    REQUIRED_FIELDS = ['name']

    def __str__(self):
        return f'{self.employee_id} - {self.name}'

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin
    
class MyModel(models.Model):
    date = models.DateTimeField(auto_now_add=True)  # 날짜 필드, 자동으로 현재 시간을 설정
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)  # Employee 모델과 연결
    count = models.IntegerField()  # 주문 수량

    def __str__(self):
        return f'{self.date} - {self.employee.employee_id} - {self.employee.name} - {self.count}'
