from django.shortcuts import render,redirect,HttpResponse
from .models import *
from .forms import *
from django.contrib.auth import login , authenticate,logout
from django.views.generic import CreateView,View,FormView
from django.contrib.auth.forms import AuthenticationForm
from .decorators import *


class HomeView(View):
    def get(self,req):
        
        return render(req,"home.html")
class DashbordView(View):
    def get(self,req):
        data={
            "user":User.objects.get(pk=req.user.id),
        }
        return render(req,"dashboard.html",data)
class DoctorDashbordView(View):
    def get(self,req):
        data={
            "user":User.objects.get(pk=req.user.id),
        }
        return render(req,"Doctor/doctorDaseboard.html",data)
class DoctorView(CreateView):
    model=User
    form_class=DoctorForm
    template_name="Form/singup.html"
    success_url="/doctor/dashbord/"
    def get_context_data(self,**kwargs):
        kwargs['user_type']="Doctor"
        return super().get_context_data(**kwargs)
    def form_valid(self,form):
        user=form.save()
        login(self.request,user)
        return redirect("DoctorDashbordView")
class PatientView(CreateView):
    model = User
    form_class=PatientForm
    template_name="Form/singup.html"
    success_url="/"
    def get_context_data(self,**kwargs):
        kwargs['user_type']="Patient"
        return super().get_context_data(**kwargs)
    def form_valid(self,form):
        user=form.save()
        login(self.request,user)
        return redirect("dasboard")
class LoginView(FormView):
    template_name="Form/login.html"
    form_class=AuthenticationForm
    success_url="/"
    def post(self,request):
        username=request.POST.get("username")
        password=request.POST.get("password")
        user=authenticate(username=username,password=password)
        if user is not None:
            if user.is_active:
                login(request,user)
                back = request.GET.get("next","dasboard")
                return redirect(back)
            else:
                return HttpResponse("Inactivated")
        else:
            return HttpResponse("login cheeking is not correct")
class LogoutView(View):
    def get(self,req):
        logout(req)
        return redirect("login")