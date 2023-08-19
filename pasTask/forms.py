from django.contrib.auth.forms import UserCreationForm
from .models import *
from django import forms

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
class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name']
        
class BlogPostForm(forms.ModelForm):
    class Meta:
        model = BlogPost
        fields = ['title', 'image', 'category', 'summary', 'content', 'is_draft']