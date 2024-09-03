from django.db import models
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

class MyModel(models.Model):
    employee_id = models.CharField(max_length=100)
    count = models.IntegerField()

    def __str__(self):
        return f'{self.employee_id} - {self.count}'