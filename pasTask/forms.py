from django.contrib.auth.forms import UserCreationForm
from .models import *

class DoctorForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model=User
        fields=('username','first_name','last_name','address','email','profile_Picture')
    def save(self,commit=True):
        user=super().save(commit=False)
        user.is_doctor=True
        if commit:
            user.save()
        return user
    
class PatientForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model=User
        fields=('username','first_name','last_name','address','email','profile_Picture')
    def save(self,commit=True):
        user=super().save(commit=False)
        user.is_patient=True
        if commit:
            user.save()
        return user
