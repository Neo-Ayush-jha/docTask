from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    is_doctor=models.BooleanField(default=False)
    is_patient=models.BooleanField(default=False)

class Patient(models.Model):
    first_name=models.CharField(max_length=150)
    last_name=models.CharField(max_length=150)
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name='patient')
    profile_Picture=models.ImageField(upload_to="patient/photo/" ,null=True,blank=True)
    address=models.TextField(help_text="line1,city,state,pincode")
class Doctor(models.Model):
    first_name=models.CharField(max_length=150)
    last_name=models.CharField(max_length=150)
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name='doctor')
    profile_Picture=models.ImageField(upload_to="doctor/photo/" ,null=True,blank=True)
    address=models.TextField(help_text="line1,city,state,pincode")
class Category(models.Model):
    name = models.CharField(max_length=100)
    def __str__(self):
        return self.name
    
class BlogPost(models.Model):
    title = models.CharField(max_length=200)
    image = models.ImageField(upload_to='blog_images/')
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    summary = models.TextField()
    content = models.TextField()
    is_draft = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def truncated_summary(self):
        words = self.summary.split()
        if len(words) > 15:
            return ' '.join(words[:15]) + '...'
        return self.summary
    def __str__(self):
        return self.title
class Appointment(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    patient_name = models.ForeignKey(Patient, on_delete=models.CASCADE)
    specialty = models.CharField(max_length=50)
    appointment_date = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField()